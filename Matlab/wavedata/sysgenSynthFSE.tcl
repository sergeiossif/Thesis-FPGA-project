load C:/Xilinx/Vivado/2015.1/lib/win64.o/librdi_dsp_tcltasks.dll
cd {e:/Thesis/Thesis-FPGA-project/Matlab/wavedata}
dsp_wave_convert {sysgenSynthFSE.wfv} 
set_param project.waveformStandaloneMode 1
start_gui
current_fileset
dsp_register_design_manager
dsp_open_waveform {sysgenSynthFSE.wdb}
open_wave_config {sysgenSynthFSE.wcfg}
source C:/Xilinx/Vivado/2015.1/scripts/sysgen/tcl/SgPaSlaveInterp.tcl
