# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {HDL Netlist}
	set CompilationFlow {STANDARD}
	set DSPDevice {xc7a100t}
	set DSPFamily {artix7}
	set DSPPackage {csg324}
	set DSPSpeed {-1}
	set FPGAClockPeriod 10
	set GenerateTestBench 1
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {C:/Users/Sergei/AppData/Local/Xilinx/Sysgen/SysgenVivado/win64.o/ip}
	set ImplStrategyName {Vivado Implementation Defaults}
	set Project {sysgensynthfse}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{sysgensynthfse_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{sysgensynthfse.vhd} -lib {xil_defaultlib}}
		{{sysgensynthfse_tb.vhd}}
		{{sysgensynthfse_clock.xdc}}
		{{sysgensynthfse.xdc}}
		{{sysgensynthfse.htm}}
	}
	set SimPeriod 1
	set SimTime 1780
	set SimulationTime {18010.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {E:/Thesis/Thesis-FPGA-project/SysGenRTLv4}
	set TestBenchModule {sysgensynthfse_tb}
	set TopLevelModule {sysgensynthfse}
	set TopLevelSimulinkHandle 2.00134
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface q_in Name {q_in}
	dict set TopLevelPortInterface q_in Type Fix_12_10
	dict set TopLevelPortInterface q_in ArithmeticType xlSigned
	dict set TopLevelPortInterface q_in BinaryPoint 10
	dict set TopLevelPortInterface q_in Width 12
	dict set TopLevelPortInterface q_in DatFile {sysgensynthfse_q_in.dat}
	dict set TopLevelPortInterface q_in IconText {q_in}
	dict set TopLevelPortInterface q_in Direction in
	dict set TopLevelPortInterface q_in Period 2
	dict set TopLevelPortInterface q_in Interface 0
	dict set TopLevelPortInterface q_in InterfaceName {}
	dict set TopLevelPortInterface q_in InterfaceString {DATA}
	dict set TopLevelPortInterface q_in ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface q_in Locs {}
	dict set TopLevelPortInterface q_in IOStandard {}
	dict set TopLevelPortInterface q_desired Name {q_desired}
	dict set TopLevelPortInterface q_desired Type Fix_10_8
	dict set TopLevelPortInterface q_desired ArithmeticType xlSigned
	dict set TopLevelPortInterface q_desired BinaryPoint 8
	dict set TopLevelPortInterface q_desired Width 10
	dict set TopLevelPortInterface q_desired DatFile {sysgensynthfse_q_desired.dat}
	dict set TopLevelPortInterface q_desired IconText {q_desired}
	dict set TopLevelPortInterface q_desired Direction in
	dict set TopLevelPortInterface q_desired Period 2
	dict set TopLevelPortInterface q_desired Interface 0
	dict set TopLevelPortInterface q_desired InterfaceName {}
	dict set TopLevelPortInterface q_desired InterfaceString {DATA}
	dict set TopLevelPortInterface q_desired ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface q_desired Locs {}
	dict set TopLevelPortInterface q_desired IOStandard {}
	dict set TopLevelPortInterface i_in Name {i_in}
	dict set TopLevelPortInterface i_in Type Fix_12_10
	dict set TopLevelPortInterface i_in ArithmeticType xlSigned
	dict set TopLevelPortInterface i_in BinaryPoint 10
	dict set TopLevelPortInterface i_in Width 12
	dict set TopLevelPortInterface i_in DatFile {sysgensynthfse_i_in.dat}
	dict set TopLevelPortInterface i_in IconText {i_in}
	dict set TopLevelPortInterface i_in Direction in
	dict set TopLevelPortInterface i_in Period 2
	dict set TopLevelPortInterface i_in Interface 0
	dict set TopLevelPortInterface i_in InterfaceName {}
	dict set TopLevelPortInterface i_in InterfaceString {DATA}
	dict set TopLevelPortInterface i_in ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface i_in Locs {}
	dict set TopLevelPortInterface i_in IOStandard {}
	dict set TopLevelPortInterface i_desired Name {i_desired}
	dict set TopLevelPortInterface i_desired Type Fix_10_8
	dict set TopLevelPortInterface i_desired ArithmeticType xlSigned
	dict set TopLevelPortInterface i_desired BinaryPoint 8
	dict set TopLevelPortInterface i_desired Width 10
	dict set TopLevelPortInterface i_desired DatFile {sysgensynthfse_i_desired.dat}
	dict set TopLevelPortInterface i_desired IconText {i_desired}
	dict set TopLevelPortInterface i_desired Direction in
	dict set TopLevelPortInterface i_desired Period 2
	dict set TopLevelPortInterface i_desired Interface 0
	dict set TopLevelPortInterface i_desired InterfaceName {}
	dict set TopLevelPortInterface i_desired InterfaceString {DATA}
	dict set TopLevelPortInterface i_desired ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface i_desired Locs {}
	dict set TopLevelPortInterface i_desired IOStandard {}
	dict set TopLevelPortInterface i_out Name {i_out}
	dict set TopLevelPortInterface i_out Type Fix_10_8
	dict set TopLevelPortInterface i_out ArithmeticType xlSigned
	dict set TopLevelPortInterface i_out BinaryPoint 8
	dict set TopLevelPortInterface i_out Width 10
	dict set TopLevelPortInterface i_out DatFile {sysgensynthfse_i_out.dat}
	dict set TopLevelPortInterface i_out IconText {i_out}
	dict set TopLevelPortInterface i_out Direction out
	dict set TopLevelPortInterface i_out Period 4
	dict set TopLevelPortInterface i_out Interface 0
	dict set TopLevelPortInterface i_out InterfaceName {}
	dict set TopLevelPortInterface i_out InterfaceString {DATA}
	dict set TopLevelPortInterface i_out ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface i_out Locs {}
	dict set TopLevelPortInterface i_out IOStandard {}
	dict set TopLevelPortInterface q_out Name {q_out}
	dict set TopLevelPortInterface q_out Type Fix_10_8
	dict set TopLevelPortInterface q_out ArithmeticType xlSigned
	dict set TopLevelPortInterface q_out BinaryPoint 8
	dict set TopLevelPortInterface q_out Width 10
	dict set TopLevelPortInterface q_out DatFile {sysgensynthfse_q_out.dat}
	dict set TopLevelPortInterface q_out IconText {q_out}
	dict set TopLevelPortInterface q_out Direction out
	dict set TopLevelPortInterface q_out Period 4
	dict set TopLevelPortInterface q_out Interface 0
	dict set TopLevelPortInterface q_out InterfaceName {}
	dict set TopLevelPortInterface q_out InterfaceString {DATA}
	dict set TopLevelPortInterface q_out ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface q_out Locs {}
	dict set TopLevelPortInterface q_out IOStandard {}
	dict set TopLevelPortInterface dh_i Name {dh_i}
	dict set TopLevelPortInterface dh_i Type Fix_18_10
	dict set TopLevelPortInterface dh_i ArithmeticType xlSigned
	dict set TopLevelPortInterface dh_i BinaryPoint 10
	dict set TopLevelPortInterface dh_i Width 18
	dict set TopLevelPortInterface dh_i DatFile {sysgensynthfse_t_2_fse_dh_i.dat}
	dict set TopLevelPortInterface dh_i IconText {dh_i}
	dict set TopLevelPortInterface dh_i Direction out
	dict set TopLevelPortInterface dh_i Period 4
	dict set TopLevelPortInterface dh_i Interface 0
	dict set TopLevelPortInterface dh_i InterfaceName {}
	dict set TopLevelPortInterface dh_i InterfaceString {DATA}
	dict set TopLevelPortInterface dh_i ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface dh_i Locs {}
	dict set TopLevelPortInterface dh_i IOStandard {}
	dict set TopLevelPortInterface dh_q Name {dh_q}
	dict set TopLevelPortInterface dh_q Type Fix_18_10
	dict set TopLevelPortInterface dh_q ArithmeticType xlSigned
	dict set TopLevelPortInterface dh_q BinaryPoint 10
	dict set TopLevelPortInterface dh_q Width 18
	dict set TopLevelPortInterface dh_q DatFile {sysgensynthfse_t_2_fse_dh_q.dat}
	dict set TopLevelPortInterface dh_q IconText {dh_q}
	dict set TopLevelPortInterface dh_q Direction out
	dict set TopLevelPortInterface dh_q Period 4
	dict set TopLevelPortInterface dh_q Interface 0
	dict set TopLevelPortInterface dh_q InterfaceName {}
	dict set TopLevelPortInterface dh_q InterfaceString {DATA}
	dict set TopLevelPortInterface dh_q ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface dh_q Locs {}
	dict set TopLevelPortInterface dh_q IOStandard {}
	dict set TopLevelPortInterface e_i Name {e_i}
	dict set TopLevelPortInterface e_i Type Fix_18_15
	dict set TopLevelPortInterface e_i ArithmeticType xlSigned
	dict set TopLevelPortInterface e_i BinaryPoint 15
	dict set TopLevelPortInterface e_i Width 18
	dict set TopLevelPortInterface e_i DatFile {sysgensynthfse_t_2_fse_e_i.dat}
	dict set TopLevelPortInterface e_i IconText {e_i}
	dict set TopLevelPortInterface e_i Direction out
	dict set TopLevelPortInterface e_i Period 4
	dict set TopLevelPortInterface e_i Interface 0
	dict set TopLevelPortInterface e_i InterfaceName {}
	dict set TopLevelPortInterface e_i InterfaceString {DATA}
	dict set TopLevelPortInterface e_i ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface e_i Locs {}
	dict set TopLevelPortInterface e_i IOStandard {}
	dict set TopLevelPortInterface e_q Name {e_q}
	dict set TopLevelPortInterface e_q Type Fix_18_15
	dict set TopLevelPortInterface e_q ArithmeticType xlSigned
	dict set TopLevelPortInterface e_q BinaryPoint 15
	dict set TopLevelPortInterface e_q Width 18
	dict set TopLevelPortInterface e_q DatFile {sysgensynthfse_t_2_fse_e_q.dat}
	dict set TopLevelPortInterface e_q IconText {e_q}
	dict set TopLevelPortInterface e_q Direction out
	dict set TopLevelPortInterface e_q Period 4
	dict set TopLevelPortInterface e_q Interface 0
	dict set TopLevelPortInterface e_q InterfaceName {}
	dict set TopLevelPortInterface e_q InterfaceString {DATA}
	dict set TopLevelPortInterface e_q ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface e_q Locs {}
	dict set TopLevelPortInterface e_q IOStandard {}
	dict set TopLevelPortInterface err_i Name {err_i}
	dict set TopLevelPortInterface err_i Type Fix_18_10
	dict set TopLevelPortInterface err_i ArithmeticType xlSigned
	dict set TopLevelPortInterface err_i BinaryPoint 10
	dict set TopLevelPortInterface err_i Width 18
	dict set TopLevelPortInterface err_i DatFile {sysgensynthfse_t_2_fse_filters_synth_lms_filter1_err_i.dat}
	dict set TopLevelPortInterface err_i IconText {err_i}
	dict set TopLevelPortInterface err_i Direction out
	dict set TopLevelPortInterface err_i Period 1
	dict set TopLevelPortInterface err_i Interface 0
	dict set TopLevelPortInterface err_i InterfaceName {}
	dict set TopLevelPortInterface err_i InterfaceString {DATA}
	dict set TopLevelPortInterface err_i ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface err_i Locs {}
	dict set TopLevelPortInterface err_i IOStandard {}
	dict set TopLevelPortInterface err_q Name {err_q}
	dict set TopLevelPortInterface err_q Type Fix_18_10
	dict set TopLevelPortInterface err_q ArithmeticType xlSigned
	dict set TopLevelPortInterface err_q BinaryPoint 10
	dict set TopLevelPortInterface err_q Width 18
	dict set TopLevelPortInterface err_q DatFile {sysgensynthfse_t_2_fse_filters_synth_lms_filter1_err_q.dat}
	dict set TopLevelPortInterface err_q IconText {err_q}
	dict set TopLevelPortInterface err_q Direction out
	dict set TopLevelPortInterface err_q Period 1
	dict set TopLevelPortInterface err_q Interface 0
	dict set TopLevelPortInterface err_q InterfaceName {}
	dict set TopLevelPortInterface err_q InterfaceString {DATA}
	dict set TopLevelPortInterface err_q ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface err_q Locs {}
	dict set TopLevelPortInterface err_q IOStandard {}
	dict set TopLevelPortInterface clr Name {clr}
	dict set TopLevelPortInterface clr Type -
	dict set TopLevelPortInterface clr ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clr BinaryPoint 0
	dict set TopLevelPortInterface clr Width 1
	dict set TopLevelPortInterface clr DatFile {}
	dict set TopLevelPortInterface clr IconText {clr}
	dict set TopLevelPortInterface clr Direction in
	dict set TopLevelPortInterface clr Period 1
	dict set TopLevelPortInterface clr Interface 9
	dict set TopLevelPortInterface clr InterfaceName {}
	dict set TopLevelPortInterface clr InterfaceString {CLOCKENABLE_CLEAR}
	dict set TopLevelPortInterface clr ClockDomain {}
	dict set TopLevelPortInterface clr Locs {}
	dict set TopLevelPortInterface clr IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {sysgensynthfse}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project