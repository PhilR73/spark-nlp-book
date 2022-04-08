@echo off
path %path%;%ProgramData%\Miniconda3\condabin;%~d0\Dev\Git\llvm-project\build\Release\bin
conda activate %CD%\.env\win
