@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xsim sysgensynthfse_tb_behav -key {Behavioral:sim_1:Functional:sysgensynthfse_tb} -tclbatch sysgensynthfse_tb.tcl -view E:/Thesis/Thesis-FPGA-project/SysGenRTLv5/hdl_netlist/sysgensynthfse_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
