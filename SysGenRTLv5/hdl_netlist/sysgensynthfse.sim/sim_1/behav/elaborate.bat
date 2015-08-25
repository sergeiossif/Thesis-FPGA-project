@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto fd57e7cc15964a74a7a0cb8181c9821b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot sysgensynthfse_tb_behav xil_defaultlib.sysgensynthfse_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
