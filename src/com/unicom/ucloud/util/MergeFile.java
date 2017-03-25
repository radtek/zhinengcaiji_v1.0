package com.unicom.ucloud.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.uway.nbi.task.resolver.FTPFileParseResolver;
import cn.uway.nbi.task.resolver.FileInfo;
import cn.uway.nbi.util.ConstDef;
import cn.uway.nbi.util.SysCfg;

/**
 * 文件合并工具类
 * 
 * @author huzq 2016-11-29
 */
public class MergeFile {
	private  final Logger LOG = LoggerFactory.getLogger(FTPFileParseResolver.class);
	
	private static MergeFile mf =null;
	
	/**
	 * 合并后的文件名
	 */
	private  String mergeFileName = "";
	/**
	 * 从ftp下载下来的文件存放路径（相对路径），不带文件名,/D/testfile/huzq/NBISRC
	 */
	private  String downLoadPath = "";
	/**
	 * 文件的生成时间
	 */
	private  String fileTime = "";
	/**
	 * 文件的接口文件类型
	 * 8-2G话单室外小区（1x）：8，9-2G话单室内小区（1x）： 9，6-4G话单室外上报：6，11-4G话单室内小区：11
	 * 10-3G话单室内小区(do):10,3-3G话单室外上报(do):3
	 * C网话单都是2G,DO是3G
	 */
	private static  Map<String,String> dataType= new HashMap<String,String>();
	/**
	 * 采集文件的时间粒度，15分钟，5分钟
	 * 
	 */
	private  String timeSpace;
	
	private  String zipFile = "";
	
	static{
		dataType.put("outdoor2G8", "8");
		dataType.put("indoor2G9", "9");
		dataType.put("outdoor4G6", "6");
		dataType.put("indoor4G11", "11");
		dataType.put("indoor3G10", "10");
		dataType.put("outdoor3G3", "3");
	}
	
	public static MergeFile getInstance(){
		if(null == mf){
			mf = new MergeFile();
		}
		return mf;
	}
	/**
	 * 合并小文件
	 * @param pathList  文件路径集合
	 * @zipFile 要压缩的文件名，用文件名区分要压缩的数据类型:TH,WH;文件名只有TH.ZIP ,WH.ZIP
	 * @return afterMergeName 文件合并后的文件名集合,最后要上传的文件集
	 */
	public  Map<String,String>  merge(List<String> pathList,String zipFile){
		this.zipFile =zipFile;
		Map<String,String> afterMergeName = new HashMap<String,String>();
		//下载下来的文件绝对路径
		List<String> absoluteFile = new ArrayList<String>();
		//读取
		List<BufferedReader> readerList = read(pathList,absoluteFile);
		//合并
		write(readerList,afterMergeName);
		//删除原有的文件
		boolean delFlag = SysCfg.getInstance().isDelLocalFile();
		if(delFlag){
			delete(absoluteFile);
		}
		return afterMergeName;
	}
	/**
	 * 读取下载下来的所有文件流
	 * @param pathList
	 * @return
	 */
	private  List<BufferedReader> read(List<String> pathList,List<String> absoluteFile){
		  try {  
			  if(null == pathList || pathList.size() <= 0){
				  return null;
			  }
			  String tem = pathList.get(0);
			  mergeFileName = tem.substring(0,tem.lastIndexOf("/"));
			  downLoadPath  = tem.substring(0,tem.lastIndexOf("/"));
			  //生成压缩文件名的信息
			  fillFiled(tem);
			  List<BufferedReader> list = new ArrayList<BufferedReader>();
			  BufferedReader reader = null;
			  File file = null;
			  //绝对路径
			  String af = null;
			  for(String path : pathList){
				  if(path.startsWith("\\")){
					  path = path.substring(1,path.length());
				  }
				  if(path.contains("\\\\")){
					  path = path.replace("\\\\", "\\");
				  }
				  file = new File(path);
				  af = file.getAbsolutePath();
				  absoluteFile.add(af);
				  reader = new BufferedReader(new FileReader(af));
				  list.add(reader);
			  }
	            return list;
	        } catch (Exception e) {  
	        	LOG.error("合并文件出错，读取文件时出错",e);
	            e.printStackTrace();  
	        }  
		  return null;
	}
	
	 /**
	  * 将文件写成一个大文件
	  * @param readerList
	  */
	private  void write(List<BufferedReader> readerList,Map<String,String> afterMergeName){
		 try {
			 //写文件的最大限制值,单位是M，需要换算成B
			 int maxFileSize = SysCfg.getInstance().getMaxFileSize();
			 maxFileSize = maxFileSize < 50 ? 50 : maxFileSize;
			 Long maxSizeB = maxFileSize*1024L*1024L;
			 String[] fileNames = new String[6];
//			 fileTime = getData(fileTime,timeSpace);
			 fileNames[0] = mergeFileName + "/"+fileTime+"_"+dataType.get("outdoor2G8")+"_"+timeSpace+".txt";
			 fileNames[1] = mergeFileName + "/"+fileTime+"_"+dataType.get("indoor2G9")+"_"+timeSpace+".txt";
			 fileNames[2] = mergeFileName + "/"+fileTime+"_"+dataType.get("outdoor4G6")+"_"+timeSpace+".txt";
			 fileNames[3] = mergeFileName + "/"+fileTime+"_"+dataType.get("indoor4G11")+"_"+timeSpace+".txt";
			 fileNames[4] = mergeFileName + "/"+fileTime+"_"+dataType.get("indoor3G10")+"_"+timeSpace+".txt";
			 fileNames[5] = mergeFileName + "/"+fileTime+"_"+dataType.get("outdoor3G3")+"_"+timeSpace+".txt";
		      File txt1 = new File(fileNames[0]);
		      File txt2 = new File(fileNames[1]);
		      File txt3 = new File(fileNames[2]);
		      File txt4 = new File(fileNames[3]);
		      File txt5 = new File(fileNames[4]);
		      File txt6 = new File(fileNames[5]);
		      BufferedWriter bw1 = new BufferedWriter(new FileWriter(txt1, true)); 
		      BufferedWriter bw2 = new BufferedWriter(new FileWriter(txt2, true)); 
		      BufferedWriter bw3 = new BufferedWriter(new FileWriter(txt3, true)); 
		      BufferedWriter bw4= new BufferedWriter(new FileWriter(txt4, true)); 
		      BufferedWriter bw5= new BufferedWriter(new FileWriter(txt5, true)); 
		      BufferedWriter bw6= new BufferedWriter(new FileWriter(txt6, true)); 
		      int i = 0;
		      int[] writerNum = new int[6];
		      //记录各个文件写了多少字节
//		      msg.getBytes("UTF-8").length
		      String header = "";
		      Long f1size = 0L;Long f2size = 0L;Long f3size = 0L;Long f4size = 0L;Long f5size = 0L;Long f6size = 0L;
		      for(BufferedReader reader : readerList){
			      String line = null; 
			      //写表头
			      if(i == 0){
			    	 header =  reader.readLine();
			    	//如果是通话数据，去掉数据类型，增加此字段只是为了逻辑判断
			    	  if(this.zipFile.contains("TH")){
			    		  header = header.substring(0,header.lastIndexOf(","));
			    	  }
			    	 bw1.write(header); 
			    	 bw1.newLine();
			    	 bw2.write(header); 
			    	 bw2.newLine();
			    	 bw3.write(header); 
			    	 bw3.newLine();
			    	 bw4.write(header); 
			    	 bw4.newLine();
			    	 bw5.write(header); 
			    	 bw5.newLine();
			    	 bw6.write(header); 
			    	 bw6.newLine();
			      }
			      //不是第一份文件，跳过表头
			      if(i > 0){
			    	  reader.readLine();
			      }
			      while((line=reader.readLine())!=null){ 
			    	  if(null == line || line.length() <= 0) continue;
			    	  String lineValue[] = line.split(",");
			    	  if(lineValue.length <= 0) continue;
			    	  //如果是通话数据，去掉数据类型，增加此字段只是为了逻辑判断
			    	  if(this.zipFile.contains("TH")){
			    		  line = line.substring(0,line.lastIndexOf(","));
			    	  }
			    	  //2G话单室外小区
			    	  if("8".equals(lineValue[lineValue.length-1])){
			    		  f1size += line.getBytes("UTF-8").length;
			    		  //达到一定的大小，重新写另外一个文件
			    		  if(f1size >= maxSizeB){
			    			  bw1 = createNewFile(bw1,fileNames[0],this.zipFile,afterMergeName);
			    			  //重新写表头
			    			  bw1.write(header); 
			    			  bw1.newLine();
			    			  f1size = 0L;
			    			  writerNum[0] = 0;
			    		  }
			    		  bw1.write(line); 
				    	  bw1.newLine();
				    	  writerNum[0]++;
			    	  }else if("9".equals(lineValue[lineValue.length-1])){
			    		  f2size += line.getBytes("UTF-8").length;
			    		  if(f2size >= maxSizeB){
			    			  bw2 = createNewFile(bw2,fileNames[1],this.zipFile,afterMergeName);
			    			  bw2.write(header); 
			    			  bw2.newLine();
			    			  f2size = 0L;
			    			  writerNum[1] = 0;
			    		  }
			    		  bw2.write(line); 
				    	  bw2.newLine();
				    	  writerNum[1]++;
			    	  }else if("6".equals(lineValue[lineValue.length-1])){
			    		  f3size += line.getBytes("UTF-8").length;
			    		  if(f3size >= maxSizeB){
			    			  bw3 = createNewFile(bw3,fileNames[2],this.zipFile,afterMergeName);
			    			  bw3.write(header); 
			    			  bw3.newLine();
			    			  f3size = 0L;
			    			  writerNum[2] = 0;
			    		  }
			    		  bw3.write(line); 
				    	  bw3.newLine();
				    	  writerNum[2]++;
			    	  }else if("11".equals(lineValue[lineValue.length-1])){
			    		  f4size += line.getBytes("UTF-8").length;
			    		  if(f4size >= maxSizeB){
			    			  bw4 = createNewFile(bw4,fileNames[3],zipFile,afterMergeName);
			    			  bw4.write(header); 
			    			  bw4.newLine();
			    			  f4size = 0L;
			    			  writerNum[3] = 0;
			    		  }
			    		  bw4.write(line); 
				    	  bw4.newLine();
				    	  writerNum[3]++;
			    	  }else if("10".equals(lineValue[lineValue.length-1])){
			    		  f5size += line.getBytes("UTF-8").length;
			    		  if(f5size >= maxSizeB){
			    			  bw5 = createNewFile(bw5,fileNames[4],zipFile,afterMergeName);
			    			  bw5.write(header); 
			    			  bw5.newLine();
			    			  f5size = 0L;
			    			  writerNum[4] = 0;
			    		  }
			    		  bw5.write(line); 
				    	  bw5.newLine();
				    	  writerNum[4]++;
			    	  }else if("3".equals(lineValue[lineValue.length-1])){
			    		  f6size += line.getBytes("UTF-8").length;
			    		  if(f6size >= maxSizeB){
			    			  bw6 = createNewFile(bw6,fileNames[5],zipFile,afterMergeName);
			    			  bw6.write(header); 
			    			  bw6.newLine();
			    			  f6size = 0L;
			    			  writerNum[5] = 0;
			    		  }
			    		  bw6.write(line); 
				    	  bw6.newLine();
				    	  writerNum[5]++;
			    	  }
			    	 
			      }
			      reader.close();
			      i++;
		      }
		      bw1.close();  
		      bw2.close(); 
		      bw3.close(); 
		      bw4.close(); 
		      bw5.close(); 
		      bw6.close(); 
			 //MD5对文件流进行加密，产生MD5文件校验码
		      String seq = "";
		      if(zipFile.contains("WH")){
	    		   seq = readSeq("WH");
	    	  }else{
	    		   seq = readSeq("TH");
	    	  }
		      
		      colseFile(writerNum,fileNames,seq,afterMergeName);

		    } catch (FileNotFoundException e) {  
		      // File对象的创建过程中的异常捕获 
		    	LOG.error("合并文件出错，找不到文件",e);
		      e.printStackTrace();  
		    } catch (IOException e) {  
		      // BufferedWriter在关闭对象捕捉异常 
		    	LOG.error("合并文件出错，IO异常",e);
		      e.printStackTrace();  
		    }

		 LOG.info("文件合并成功！此次生成"+afterMergeName.size()+"个文件！");
	 }
	
	private  void colseFile(int[] dn,String[] filePaths,
			String seq,Map<String,String> afterMergeName) throws IOException{
		if(null == dn || dn.length <= 0 ){
			return ;
		}
		if(null == filePaths || filePaths.length <= 0){
			return ;
		}
		for(int i=0 ;i < dn.length;i++){
			 String filePath = filePaths[i];
			if(dn[i] > 0){
				 File file = new File(filePath);
				 FileInputStream in = new FileInputStream(file);
				 String md5 =  DigestUtils.md5Hex(in);
				 in.close();
				 filePath = filePath.substring(0,filePath.lastIndexOf("."))+"_"+seq+"_"+md5+
						 filePath.substring(filePath.lastIndexOf("."),filePath.length());
				 File f2 = new File(filePath);
				 file.renameTo(f2);
				 afterMergeName.put(filePath,filePath);
				 Long num = Long.valueOf(seq)+1;
				 DecimalFormat df=new DecimalFormat("0000");
				 seq = String.valueOf(df.format(num));
			}else{
				  File file = new File(filePath);
		    	  if(file.exists()) file.delete();
			}
		}
		
		 nextSeq(this.zipFile.substring(0,this.zipFile.lastIndexOf(".")),Long.valueOf(seq));
	}
	
	private  BufferedWriter createNewFile(BufferedWriter bw,String fileName,
			String zipFile,Map<String,String> afterMergeName) throws IOException{
		  //先关闭写完的文件
		bw.close();
		String tmpname = fileName;
		 //MD5对文件流进行加密，产生MD5文件校验码
	      String seq = "";
	      if(zipFile.contains("WH")){
  		   seq = readSeq("WH");
  	    }else{
  		   seq = readSeq("TH");
  	    }
	     File file = new File(fileName);
		 FileInputStream in = new FileInputStream(file);
		 String md5 =  DigestUtils.md5Hex(in);
		 in.close();
		 fileName = fileName.substring(0,fileName.lastIndexOf("."))+"_"+seq+"_"+md5+
				 fileName.substring(fileName.lastIndexOf("."),fileName.length());
		 File f2 = new File(fileName);
		 file.renameTo(f2);
		 file = null;
		 f2 = null;
		 afterMergeName.put(fileName,fileName);
		 Long num = Long.valueOf(seq)+1;
		 DecimalFormat df=new DecimalFormat("0000");
		 seq = String.valueOf(df.format(num));
	     nextSeq(zipFile.substring(0,zipFile.lastIndexOf(".")),Long.valueOf(seq));
	     
	     //重新生成文件
	     File newFile = new File(tmpname);
	     if(!newFile.exists()){
	    	 newFile.createNewFile();
	     }
	     BufferedWriter bw1 = new BufferedWriter(new FileWriter(newFile, true));
	     return bw1;
	     
	}
	
	/**
	 * 删除原文件
	 * @param list
	 */
	private  void delete(List<String> list){
		if(null != list && list.size() > 0){
			for(String path : list){
				File file = new File(path);
				if(file.exists()){
					boolean a =file.delete();
					if(a){
					  LOG.debug("删除已合并的文件："+path+"成功！");
					}else{
						 LOG.debug("删除已合并的文件："+path+"失败！");
					}
				}
			}
		}
		
	}
	
	
	/**
	 * 返回序列号
	 * @param ss  指定返回的是哪一类型的序列号有:WH,TH;例：WH:0001,TH:0001
	 * @return
	 */
	private  synchronized  String readSeq(String ss){
		
		File file = new File(ConstDef.SEQ_FILE_URL);
		try {
			 BufferedReader  reader = new BufferedReader(new FileReader(file));
			 String tempString = null;
	            while ((tempString = reader.readLine()) != null) {
	            	if(ss.equalsIgnoreCase("WH") && tempString.contains("WH")){
	            		tempString = tempString.substring(tempString.indexOf(":")+1,tempString.length());
	            		return tempString;
	            	}
	            	if(ss.equalsIgnoreCase("TH") && tempString.contains("TH")){
	            		tempString = tempString.substring(tempString.indexOf(":")+1,tempString.length());
	            		return tempString;
	            	}
	            	
	            }
	            reader.close();

		} catch (FileNotFoundException e) {
			LOG.error("返回序列号出错:FileNotFoundException",e);
			e.printStackTrace();
		} catch (IOException e) {
			LOG.error("返回序列号出错:IOException",e);
		}
		return null;
	}
	
	/**
	 * 生成下一序号
	 * @param ss  数据类型,TH,WH
	 * @param val 最新值
	 */
	private synchronized  void nextSeq(String ss,Long val){
		File file = new File(ConstDef.SEQ_FILE_URL);

		try {
			FileReader r = new FileReader(file);
			 BufferedReader  reader = new BufferedReader(r);
			
			 String tempString = null;
			 StringBuffer tt = new StringBuffer();
	            while ((tempString = reader.readLine()) != null) {
	            	if(ss.contains("WH") && tempString.contains("WH")){
	            		tempString = tempString.substring(tempString.indexOf(":")+1,tempString.length());
	            		DecimalFormat df=new DecimalFormat("0000");
	            		String aa = df.format(val);
	            		tempString = "WH:"+aa+"\r\n";
	            		tt.append(tempString);
	            	}else if(ss.contains("TH") && tempString.contains("TH")){
	            		tempString = tempString.substring(tempString.indexOf(":")+1,tempString.length());
	            		DecimalFormat df=new DecimalFormat("0000");
	            		String aa = df.format(val);
	            		tempString = "TH:"+aa+"\r\n";
	            		tt.append(tempString);
	            	}else{
	            		tt.append(tempString+"\r\n");
	            	}
	            }
	            reader.close();
	            BufferedWriter writer = new BufferedWriter(new FileWriter(file,false));
	            writer.write(tt.toString());
	            r.close();
	            writer.close();
		} catch (FileNotFoundException e) {
			LOG.error("序列号自增出错:FileNotFoundException",e);
		} catch (IOException e) {
			LOG.error("序列号自增出错:IOException",e);
		}
		
	}
	
	public  String createChkFile(List<FileInfo> uploadFileResultList){
		String date = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
		String tem = downLoadPath+"/CHK_"+date+".chk";
		File file = new File(tem);
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(file,false));
			for(FileInfo f : uploadFileResultList){
				String filename = f.getFileName();
				filename = filename.substring(filename.lastIndexOf("/")+1,filename.length());
				if(filename.contains("\\")){
					filename = filename.replace("\\", "");
				}
				writer.write(filename);
				writer.newLine();
			}
			writer.close();
		} catch (IOException e) {
			LOG.error("写chk文件出错:IOException",e);
		}
		return tem;
	}
	
	/**
	 * ipg生成的文件名：20161201120000_15_TH.txt
	 * @param fileName
	 */
	private  void fillFiled(String fileName){
		if(null == fileName){
			return ;
		}
		String sp[] = fileName.substring(fileName.lastIndexOf("/")+1, fileName.length()).split("_");
		fileTime = sp[0];
		timeSpace = sp[1];
	}
	
	private  String getData(String data,String plusVal){
		int val = 0;
		if(null != plusVal ){
			val = Integer.valueOf(plusVal);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");    
		Date d = null;
		try {
			d = sdf.parse(data);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(Calendar.MINUTE,val);
		return sdf.format(calendar.getTime());
	}
	public static void main(String[] args) throws ParseException {
//		String aa = readSeq("WH");
//		System.out.print(aa);
//		seqPlusOne("WH");

	}
}
