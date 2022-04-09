@echo off
set SPARK_HOME=%CD%\build\spark-3.2.1-bin-hadoop3.2
set HADOOP_HOME=%CD%\build\hadoop-3.2.3
set HADOOP_HEAPSIZE=4096
path %path%;%ProgramData%\Miniconda3\condabin;%~d0\Dev\Git\llvm-project\build\Release\bin;C:\Program Files\Git\usr\bin;C:\Program Files\cygwin64\bin
rem conda env create -f environment.yml -p %CD%\.env\win
conda activate %CD%\.env\win
