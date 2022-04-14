@echo off

set JAVA_HOME=%CD%\build\openjdk-8u322-b06-jre
set SPARK_HOME=%CD%\build\spark-3.2.1-bin-hadoop3.2
set HADOOP_HOME=%CD%\build\hadoop-3.2.3
set HADOOP_HEAPSIZE=4096

path %JAVA_HOME%\bin;%path%;%ProgramData%\Miniconda3\condabin;%~d0\Dev\Git\llvm-project\build\Release\bin;%HADOOP_HOME%\bin;%ProgramFiles%\Git\usr\bin;%ProgramFiles%\cygwin64\bin

if not exist build\. mkdir build
if not exist %JAVA_HOME%\. (
	pushd build
	wget --no-check-certificate "https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u322-b06/OpenJDK8U-jre_x64_windows_8u322b06.zip"
	unzip OpenJDK8U-jre_x64_windows_8u322b06.zip
	del OpenJDK8U-jre_x64_windows_8u322b06.zip
	popd
)
if not exist %SPARK_HOME%\. (
	pushd build
	wget --no-check-certificate "https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz"
	tar -xvzf spark-3.2.1-bin-hadoop3.2.tgz
	del spark-3.2.1-bin-hadoop3.2.tgz
	popd
)
if not exist %HADOOP_HOME%\. (
	pushd build
	wget --no-check-certificate "https://dlcdn.apache.org/hadoop/common/hadoop-3.2.3/hadoop-3.2.3.tar.gz"
	tar -xvzf hadoop-3.2.3.tar.gz
	del hadoop-3.2.3.tar.gz
	popd
)
if not exist %HADOOP_HOME%\bin\winutils.exe (
	pushd build
	wget --no-check-certificate "https://github.com/cdarlint/winutils/archive/refs/heads/master.zip"
	unzip -o -j master.zip "winutils-master/hadoop-3.2.2/bin/*" -d hadoop-3.2.3/bin/
	del master.zip
	popd
)

if not exist .env\. (
	conda env create -f environment.yml -p %CD%\.env\win
)
conda activate %CD%\.env\win
