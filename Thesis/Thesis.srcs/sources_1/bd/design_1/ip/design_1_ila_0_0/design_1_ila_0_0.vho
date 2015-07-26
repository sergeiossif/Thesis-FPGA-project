-- (c) Copyright 1995-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-- DO NOT MODIFY THIS FILE.


COMPONENT design_1_ila_0_0

PORT (
	clk : IN STD_LOGIC;
      

	---- WREADY
	probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe1 : IN STD_LOGIC_VECTOR(23 DOWNTO 0); 	probe2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 	probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe5 : IN STD_LOGIC_VECTOR(23 DOWNTO 0); 	probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 	probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe13 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 	probe14 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 	probe15 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe17 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 	probe18 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 	probe19 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe20 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe21 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 	probe22 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe23 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 	probe24 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 	probe25 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe26 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe27 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 	probe28 : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 	probe29 : IN STD_LOGIC_VECTOR(1 DOWNTO 0); 	probe30 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe31 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe32 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe33 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe34 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe35 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe36 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe37 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 	probe38 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe39 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe40 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe41 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe42 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 	probe43 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe44 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG


your_instance_name : design_1_ila_0_0
PORT MAP (
	clk => clk,
      

	probe0 => WREADY, 
	---- AWADDR
	probe1 => AWADDR, 
	---- BRESP
	probe2 => BRESP, 
	---- BVALID
	probe3 => BVALID, 
	---- BREADY
	probe4 => BREADY, 
	---- ARADDR
	probe5 => ARADDR, 
	---- RREADY
	probe6 => RREADY, 
	---- WVALID
	probe7 => WVALID, 
	---- ARVALID
	probe8 => ARVALID, 
	---- ARREADY
	probe9 => ARREADY, 
	---- RDATA
	probe10 => RDATA, 
	---- AWVALID
	probe11 => AWVALID, 
	---- AWREADY
	probe12 => AWREADY, 
	---- RRESP
	probe13 => RRESP, 
	---- WDATA
	probe14 => WDATA, 
	---- WSTRB
	probe15 => WSTRB, 
	---- RVALID
	probe16 => RVALID, 
	---- ARPROT
	probe17 => ARPROT, 
	---- AWPROT
	probe18 => AWPROT, 
	---- AWID
	probe19 => AWID, 
	---- BID
	probe20 => BID, 
	---- AWLEN
	probe21 => AWLEN, 
	---- BUSER
	probe22 => BUSER, 
	---- AWSIZE
	probe23 => AWSIZE, 
	---- AWBURST
	probe24 => AWBURST, 
	---- ARID
	probe25 => ARID, 
	---- AWLOCK
	probe26 => AWLOCK, 
	---- ARLEN
	probe27 => ARLEN, 
	---- ARSIZE
	probe28 => ARSIZE, 
	---- ARBUSRT
	probe29 => ARBUSRT, 
	---- ARLOCK
	probe30 => ARLOCK, 
	---- ARCACHE
	probe31 => ARCACHE, 
	---- AWCACHE
	probe32 => AWCACHE, 
	---- ARREGION
	probe33 => ARREGION, 
	---- ARQOS
	probe34 => ARQOS, 
	---- ARUSER
	probe35 => ARUSER, 
	---- AWREGION
	probe36 => AWREGION, 
	---- AWQOS
	probe37 => AWQOS, 
	---- RID
	probe38 => RID, 
	---- AWUSER
	probe39 => AWUSER, 
	---- WID
	probe40 => WID, 
	---- RLAST
	probe41 => RLAST, 
	---- RUSER
	probe42 => RUSER, 
	---- WLAST
	probe43 => WLAST,
	---- WUSER 
	probe44 => WUSER 
);


-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file design_1_ila_0_0.vhd when simulating
-- the core, design_1_ila_0_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.
