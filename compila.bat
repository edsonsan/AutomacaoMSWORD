@echo off
set disable_sikuli_log=1
cd reports
del *.* /q /s
cd..
cls
robot -d .\reports\%1 %1.robot
removerjava.bat
