cd ..
CLASSPATH=${CLASSPATH}:./lib/nbi.jar;
EXTLIBDIRS=./lib:
export CLASSPATH;
export EXTLIBDIRS;
nohup java -server -DoEscapeAnalysis -Xms2048m -Xmx8192m -Djava.ext.dirs=${EXTLIBDIRS}"${JAVA_HOME}/jre/lib/ext" -cp ${CLASSPATH} -Dfile.encoding=utf-8 -Djava.library.path=. cn.uway.nbi.NBI 1>./log/out.log 2>./log/error.log&
