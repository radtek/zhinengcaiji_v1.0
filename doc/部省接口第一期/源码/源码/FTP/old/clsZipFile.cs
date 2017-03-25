using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using ICSharpCode.SharpZipLib.Checksums;
using ICSharpCode.SharpZipLib.Zip;
using ICSharpCode.SharpZipLib.GZip;
namespace NOAP.Ftp
{
    /// <summary>
    /// 20090901hsp 压缩文件
    /// </summary>
    public  class clsZipFile
    {
      public static string CreateZIPFile(string path, int M,string strsuff)
      {
          try
          {
              Crc32 crc = new Crc32();//未压缩的
              ICSharpCode.SharpZipLib.Zip.ZipOutputStream zipout = new ICSharpCode.SharpZipLib.Zip.ZipOutputStream(System.IO.File.Create(path+ ".zip"));

              //ICSharpCode.SharpZipLib.GZip.GZipOutputStream zipout = new GZipOutputStream(System.IO.File.Create(path+ ".zip"));
              System.IO.FileStream fs = System.IO.File.OpenRead(path + strsuff);
              long pai = 1024 * 1024 * M;//每M兆写一次
              long forint = fs.Length / pai + 1;
              byte[] buffer = null;
              zipout.SetLevel(7);
              ZipEntry entry = new ZipEntry(System.IO.Path.GetFileName(path + strsuff));
              entry.Size = fs.Length;
              entry.DateTime = DateTime.Now;
              zipout.PutNextEntry(entry);
              //zipout.
              for (long i = 1; i <= forint; i++)
              {
                  if (pai * i < fs.Length)
                  {
                      buffer = new byte[pai];
                      fs.Seek(pai * (i - 1), System.IO.SeekOrigin.Begin);
                  }
                  else
                  {
                      if (fs.Length < pai)
                      {
                          buffer = new byte[fs.Length];
                      }
                      else
                      {
                          buffer = new byte[fs.Length - pai * (i - 1)];
                          fs.Seek(pai * (i - 1), System.IO.SeekOrigin.Begin);
                      }
                  }
                  fs.Read(buffer, 0, buffer.Length);
                  crc.Reset();
                  crc.Update(buffer);
                  zipout.Write(buffer, 0, buffer.Length);
                  zipout.Flush();
              }
              fs.Close();
              zipout.Finish();
              zipout.Close();

              System.IO.File.Delete(path+strsuff);
            // File.Create(path.Replace(".doc","") + ".zip",buffer.Length);
              return path + ".zip";
          }
          catch (Exception ex)
          {
              string str = ex.Message;
              return path;
          }
      }

      public  static bool GZipFile(string sourcefilename, string zipfilename)
      {

          bool blResult;//表示压缩是否成功的返回结果

          //为源文件创建读取文件的流实例

          

          FileStream srcFile = File.OpenRead(sourcefilename);

          //为压缩文件创建写入文件的流实例，

          GZipOutputStream zipFile = new GZipOutputStream(File.Open(zipfilename, FileMode.Create));

          try
          {

              byte[] FileData = new byte[srcFile.Length];//创建缓冲数据

              srcFile.Read(FileData, 0, (int)srcFile.Length);//读取源文件

              zipFile.Write(FileData, 0, FileData.Length);//写入压缩文件

              blResult = true;

          }

          catch (Exception ee)
          {

              Console.WriteLine(ee.Message);

              blResult = false;

          }

          srcFile.Close();//关闭源文件

          zipFile.Close();//关闭压缩文件

          return blResult;

      }
    }

    
    /// <summary>
    ///  解压类
    /// </summary>
    public class UnZipClass
    {
        /**//// <summary>
        /// 解压功能(解压压缩文件到指定目录)
        /// </summary>
        /// <param name="FileToUpZip">待解压的文件</param>
        /// <param name="ZipedFolder">指定解压目标目录</param>
        public static void UnZip(string FileToUpZip, string ZipedFolder,string Password)
        {
            if (!File.Exists(FileToUpZip))
            {
                return;
            }

            if (!Directory.Exists(ZipedFolder))
            {
                Directory.CreateDirectory(ZipedFolder);
            }

            ZipInputStream s = null;
            ZipEntry theEntry = null;

            string fileName;
            FileStream streamWriter = null;
            try
            {
                s = new ZipInputStream(File.OpenRead(FileToUpZip));
                s.Password = Password;
                while ((theEntry = s.GetNextEntry()) != null)
                {
                    if (theEntry.Name != String.Empty)
                    {
                        fileName = Path.Combine(ZipedFolder, theEntry.Name);
                        /**////判断文件路径是否是文件夹
                        if (fileName.EndsWith("/") || fileName.EndsWith("\\"))
                        {
                            Directory.CreateDirectory(fileName);
                            continue;
                        }

                        streamWriter = File.Create(fileName);
                        int size = 2048;
                        byte[] data = new byte[2048];
                        while (true)
                        {
                            size = s.Read(data, 0, data.Length);
                            if (size > 0)
                            {
                                streamWriter.Write(data, 0, size);
                            }
                            else
                            {
                                break;
                            }
                        }
                    }
                }
            }
            finally
            {
                if (streamWriter != null)
                {
                    streamWriter.Close();
                    streamWriter = null;
                }
                if (theEntry != null)
                {
                    theEntry = null;
                }
                if (s != null)
                {
                    s.Close();
                    s = null;
                }
                GC.Collect();
                GC.Collect(1);
            }
        }

        //使用GZIP解压文件的方法
        public static bool UnGzipFile(string zipfilename, string unzipfilename)
        {

            bool blResult;//表示解压是否成功的返回结果

            //创建压缩文件的输入流实例

            GZipInputStream zipFile = new GZipInputStream(File.OpenRead(zipfilename));

            //创建目标文件的流

            FileStream destFile = File.Open(unzipfilename, FileMode.Create);

            try
            {

                int buffersize = 2048;//缓冲区的尺寸，一般是2048的倍数

                byte[] FileData = new byte[buffersize];//创建缓冲数据

                while (buffersize > 0)//一直读取到文件末尾
                {

                    buffersize = zipFile.Read(FileData, 0, buffersize);//读取压缩文件数据

                    destFile.Write(FileData, 0, buffersize);//写入目标文件

                }

                blResult = true;

            }

            catch (Exception ee)
            {

                Console.WriteLine(ee.Message);

                blResult = false;

            }

            destFile.Close();//关闭目标文件

            zipFile.Close();//关闭压缩文件

            return blResult;

        }
    }
}

