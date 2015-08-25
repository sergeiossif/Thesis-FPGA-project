-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity sysgensynthfse_stub is
  port (
    clk : in std_logic;
    sysgensynthfse_aresetn : in std_logic;
    sysgensynthfse_s_axi_awaddr : in std_logic;
    sysgensynthfse_s_axi_awvalid : in std_logic;
    sysgensynthfse_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_s_axi_wvalid : in std_logic;
    sysgensynthfse_s_axi_bready : in std_logic;
    sysgensynthfse_s_axi_araddr : in std_logic;
    sysgensynthfse_s_axi_arvalid : in std_logic;
    sysgensynthfse_s_axi_rready : in std_logic;
    sysgensynthfse_dh_i_s_axi_awaddr : in std_logic;
    sysgensynthfse_dh_i_s_axi_awvalid : in std_logic;
    sysgensynthfse_dh_i_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_dh_i_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_dh_i_s_axi_wvalid : in std_logic;
    sysgensynthfse_dh_i_s_axi_bready : in std_logic;
    sysgensynthfse_dh_i_s_axi_araddr : in std_logic;
    sysgensynthfse_dh_i_s_axi_arvalid : in std_logic;
    sysgensynthfse_dh_i_s_axi_rready : in std_logic;
    sysgensynthfse_dh_q_s_axi_awaddr : in std_logic;
    sysgensynthfse_dh_q_s_axi_awvalid : in std_logic;
    sysgensynthfse_dh_q_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_dh_q_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_dh_q_s_axi_wvalid : in std_logic;
    sysgensynthfse_dh_q_s_axi_bready : in std_logic;
    sysgensynthfse_dh_q_s_axi_araddr : in std_logic;
    sysgensynthfse_dh_q_s_axi_arvalid : in std_logic;
    sysgensynthfse_dh_q_s_axi_rready : in std_logic;
    sysgensynthfse_i_in_s_axi_awaddr : in std_logic;
    sysgensynthfse_i_in_s_axi_awvalid : in std_logic;
    sysgensynthfse_i_in_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_i_in_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_i_in_s_axi_wvalid : in std_logic;
    sysgensynthfse_i_in_s_axi_bready : in std_logic;
    sysgensynthfse_i_in_s_axi_araddr : in std_logic;
    sysgensynthfse_i_in_s_axi_arvalid : in std_logic;
    sysgensynthfse_i_in_s_axi_rready : in std_logic;
    sysgensynthfse_q_in_s_axi_awaddr : in std_logic;
    sysgensynthfse_q_in_s_axi_awvalid : in std_logic;
    sysgensynthfse_q_in_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_q_in_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_q_in_s_axi_wvalid : in std_logic;
    sysgensynthfse_q_in_s_axi_bready : in std_logic;
    sysgensynthfse_q_in_s_axi_araddr : in std_logic;
    sysgensynthfse_q_in_s_axi_arvalid : in std_logic;
    sysgensynthfse_q_in_s_axi_rready : in std_logic;
    sysgensynthfse_q_out_s_axi_awaddr : in std_logic;
    sysgensynthfse_q_out_s_axi_awvalid : in std_logic;
    sysgensynthfse_q_out_s_axi_wdata : in std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_q_out_s_axi_wstrb : in std_logic_vector( 4-1 downto 0 );
    sysgensynthfse_q_out_s_axi_wvalid : in std_logic;
    sysgensynthfse_q_out_s_axi_bready : in std_logic;
    sysgensynthfse_q_out_s_axi_araddr : in std_logic;
    sysgensynthfse_q_out_s_axi_arvalid : in std_logic;
    sysgensynthfse_q_out_s_axi_rready : in std_logic;
    sysgensynthfse_s_axi_awready : out std_logic;
    sysgensynthfse_s_axi_wready : out std_logic;
    sysgensynthfse_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_s_axi_bvalid : out std_logic;
    sysgensynthfse_s_axi_arready : out std_logic;
    sysgensynthfse_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_s_axi_rvalid : out std_logic;
    sysgensynthfse_dh_i_s_axi_awready : out std_logic;
    sysgensynthfse_dh_i_s_axi_wready : out std_logic;
    sysgensynthfse_dh_i_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_dh_i_s_axi_bvalid : out std_logic;
    sysgensynthfse_dh_i_s_axi_arready : out std_logic;
    sysgensynthfse_dh_i_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_dh_i_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_dh_i_s_axi_rvalid : out std_logic;
    sysgensynthfse_dh_q_s_axi_awready : out std_logic;
    sysgensynthfse_dh_q_s_axi_wready : out std_logic;
    sysgensynthfse_dh_q_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_dh_q_s_axi_bvalid : out std_logic;
    sysgensynthfse_dh_q_s_axi_arready : out std_logic;
    sysgensynthfse_dh_q_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_dh_q_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_dh_q_s_axi_rvalid : out std_logic;
    sysgensynthfse_i_in_s_axi_awready : out std_logic;
    sysgensynthfse_i_in_s_axi_wready : out std_logic;
    sysgensynthfse_i_in_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_i_in_s_axi_bvalid : out std_logic;
    sysgensynthfse_i_in_s_axi_arready : out std_logic;
    sysgensynthfse_i_in_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_i_in_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_i_in_s_axi_rvalid : out std_logic;
    sysgensynthfse_q_in_s_axi_awready : out std_logic;
    sysgensynthfse_q_in_s_axi_wready : out std_logic;
    sysgensynthfse_q_in_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_q_in_s_axi_bvalid : out std_logic;
    sysgensynthfse_q_in_s_axi_arready : out std_logic;
    sysgensynthfse_q_in_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_q_in_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_q_in_s_axi_rvalid : out std_logic;
    sysgensynthfse_q_out_s_axi_awready : out std_logic;
    sysgensynthfse_q_out_s_axi_wready : out std_logic;
    sysgensynthfse_q_out_s_axi_bresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_q_out_s_axi_bvalid : out std_logic;
    sysgensynthfse_q_out_s_axi_arready : out std_logic;
    sysgensynthfse_q_out_s_axi_rdata : out std_logic_vector( 32-1 downto 0 );
    sysgensynthfse_q_out_s_axi_rresp : out std_logic_vector( 2-1 downto 0 );
    sysgensynthfse_q_out_s_axi_rvalid : out std_logic
  );
end sysgensynthfse_stub;
architecture structural of sysgensynthfse_stub is 
begin
  sysgen_dut : entity xil_defaultlib.sysgensynthfse 
  port map (
    clk => clk,
    sysgensynthfse_aresetn => sysgensynthfse_aresetn,
    sysgensynthfse_s_axi_awaddr => sysgensynthfse_s_axi_awaddr,
    sysgensynthfse_s_axi_awvalid => sysgensynthfse_s_axi_awvalid,
    sysgensynthfse_s_axi_wdata => sysgensynthfse_s_axi_wdata,
    sysgensynthfse_s_axi_wstrb => sysgensynthfse_s_axi_wstrb,
    sysgensynthfse_s_axi_wvalid => sysgensynthfse_s_axi_wvalid,
    sysgensynthfse_s_axi_bready => sysgensynthfse_s_axi_bready,
    sysgensynthfse_s_axi_araddr => sysgensynthfse_s_axi_araddr,
    sysgensynthfse_s_axi_arvalid => sysgensynthfse_s_axi_arvalid,
    sysgensynthfse_s_axi_rready => sysgensynthfse_s_axi_rready,
    sysgensynthfse_dh_i_s_axi_awaddr => sysgensynthfse_dh_i_s_axi_awaddr,
    sysgensynthfse_dh_i_s_axi_awvalid => sysgensynthfse_dh_i_s_axi_awvalid,
    sysgensynthfse_dh_i_s_axi_wdata => sysgensynthfse_dh_i_s_axi_wdata,
    sysgensynthfse_dh_i_s_axi_wstrb => sysgensynthfse_dh_i_s_axi_wstrb,
    sysgensynthfse_dh_i_s_axi_wvalid => sysgensynthfse_dh_i_s_axi_wvalid,
    sysgensynthfse_dh_i_s_axi_bready => sysgensynthfse_dh_i_s_axi_bready,
    sysgensynthfse_dh_i_s_axi_araddr => sysgensynthfse_dh_i_s_axi_araddr,
    sysgensynthfse_dh_i_s_axi_arvalid => sysgensynthfse_dh_i_s_axi_arvalid,
    sysgensynthfse_dh_i_s_axi_rready => sysgensynthfse_dh_i_s_axi_rready,
    sysgensynthfse_dh_q_s_axi_awaddr => sysgensynthfse_dh_q_s_axi_awaddr,
    sysgensynthfse_dh_q_s_axi_awvalid => sysgensynthfse_dh_q_s_axi_awvalid,
    sysgensynthfse_dh_q_s_axi_wdata => sysgensynthfse_dh_q_s_axi_wdata,
    sysgensynthfse_dh_q_s_axi_wstrb => sysgensynthfse_dh_q_s_axi_wstrb,
    sysgensynthfse_dh_q_s_axi_wvalid => sysgensynthfse_dh_q_s_axi_wvalid,
    sysgensynthfse_dh_q_s_axi_bready => sysgensynthfse_dh_q_s_axi_bready,
    sysgensynthfse_dh_q_s_axi_araddr => sysgensynthfse_dh_q_s_axi_araddr,
    sysgensynthfse_dh_q_s_axi_arvalid => sysgensynthfse_dh_q_s_axi_arvalid,
    sysgensynthfse_dh_q_s_axi_rready => sysgensynthfse_dh_q_s_axi_rready,
    sysgensynthfse_i_in_s_axi_awaddr => sysgensynthfse_i_in_s_axi_awaddr,
    sysgensynthfse_i_in_s_axi_awvalid => sysgensynthfse_i_in_s_axi_awvalid,
    sysgensynthfse_i_in_s_axi_wdata => sysgensynthfse_i_in_s_axi_wdata,
    sysgensynthfse_i_in_s_axi_wstrb => sysgensynthfse_i_in_s_axi_wstrb,
    sysgensynthfse_i_in_s_axi_wvalid => sysgensynthfse_i_in_s_axi_wvalid,
    sysgensynthfse_i_in_s_axi_bready => sysgensynthfse_i_in_s_axi_bready,
    sysgensynthfse_i_in_s_axi_araddr => sysgensynthfse_i_in_s_axi_araddr,
    sysgensynthfse_i_in_s_axi_arvalid => sysgensynthfse_i_in_s_axi_arvalid,
    sysgensynthfse_i_in_s_axi_rready => sysgensynthfse_i_in_s_axi_rready,
    sysgensynthfse_q_in_s_axi_awaddr => sysgensynthfse_q_in_s_axi_awaddr,
    sysgensynthfse_q_in_s_axi_awvalid => sysgensynthfse_q_in_s_axi_awvalid,
    sysgensynthfse_q_in_s_axi_wdata => sysgensynthfse_q_in_s_axi_wdata,
    sysgensynthfse_q_in_s_axi_wstrb => sysgensynthfse_q_in_s_axi_wstrb,
    sysgensynthfse_q_in_s_axi_wvalid => sysgensynthfse_q_in_s_axi_wvalid,
    sysgensynthfse_q_in_s_axi_bready => sysgensynthfse_q_in_s_axi_bready,
    sysgensynthfse_q_in_s_axi_araddr => sysgensynthfse_q_in_s_axi_araddr,
    sysgensynthfse_q_in_s_axi_arvalid => sysgensynthfse_q_in_s_axi_arvalid,
    sysgensynthfse_q_in_s_axi_rready => sysgensynthfse_q_in_s_axi_rready,
    sysgensynthfse_q_out_s_axi_awaddr => sysgensynthfse_q_out_s_axi_awaddr,
    sysgensynthfse_q_out_s_axi_awvalid => sysgensynthfse_q_out_s_axi_awvalid,
    sysgensynthfse_q_out_s_axi_wdata => sysgensynthfse_q_out_s_axi_wdata,
    sysgensynthfse_q_out_s_axi_wstrb => sysgensynthfse_q_out_s_axi_wstrb,
    sysgensynthfse_q_out_s_axi_wvalid => sysgensynthfse_q_out_s_axi_wvalid,
    sysgensynthfse_q_out_s_axi_bready => sysgensynthfse_q_out_s_axi_bready,
    sysgensynthfse_q_out_s_axi_araddr => sysgensynthfse_q_out_s_axi_araddr,
    sysgensynthfse_q_out_s_axi_arvalid => sysgensynthfse_q_out_s_axi_arvalid,
    sysgensynthfse_q_out_s_axi_rready => sysgensynthfse_q_out_s_axi_rready,
    sysgensynthfse_s_axi_awready => sysgensynthfse_s_axi_awready,
    sysgensynthfse_s_axi_wready => sysgensynthfse_s_axi_wready,
    sysgensynthfse_s_axi_bresp => sysgensynthfse_s_axi_bresp,
    sysgensynthfse_s_axi_bvalid => sysgensynthfse_s_axi_bvalid,
    sysgensynthfse_s_axi_arready => sysgensynthfse_s_axi_arready,
    sysgensynthfse_s_axi_rdata => sysgensynthfse_s_axi_rdata,
    sysgensynthfse_s_axi_rresp => sysgensynthfse_s_axi_rresp,
    sysgensynthfse_s_axi_rvalid => sysgensynthfse_s_axi_rvalid,
    sysgensynthfse_dh_i_s_axi_awready => sysgensynthfse_dh_i_s_axi_awready,
    sysgensynthfse_dh_i_s_axi_wready => sysgensynthfse_dh_i_s_axi_wready,
    sysgensynthfse_dh_i_s_axi_bresp => sysgensynthfse_dh_i_s_axi_bresp,
    sysgensynthfse_dh_i_s_axi_bvalid => sysgensynthfse_dh_i_s_axi_bvalid,
    sysgensynthfse_dh_i_s_axi_arready => sysgensynthfse_dh_i_s_axi_arready,
    sysgensynthfse_dh_i_s_axi_rdata => sysgensynthfse_dh_i_s_axi_rdata,
    sysgensynthfse_dh_i_s_axi_rresp => sysgensynthfse_dh_i_s_axi_rresp,
    sysgensynthfse_dh_i_s_axi_rvalid => sysgensynthfse_dh_i_s_axi_rvalid,
    sysgensynthfse_dh_q_s_axi_awready => sysgensynthfse_dh_q_s_axi_awready,
    sysgensynthfse_dh_q_s_axi_wready => sysgensynthfse_dh_q_s_axi_wready,
    sysgensynthfse_dh_q_s_axi_bresp => sysgensynthfse_dh_q_s_axi_bresp,
    sysgensynthfse_dh_q_s_axi_bvalid => sysgensynthfse_dh_q_s_axi_bvalid,
    sysgensynthfse_dh_q_s_axi_arready => sysgensynthfse_dh_q_s_axi_arready,
    sysgensynthfse_dh_q_s_axi_rdata => sysgensynthfse_dh_q_s_axi_rdata,
    sysgensynthfse_dh_q_s_axi_rresp => sysgensynthfse_dh_q_s_axi_rresp,
    sysgensynthfse_dh_q_s_axi_rvalid => sysgensynthfse_dh_q_s_axi_rvalid,
    sysgensynthfse_i_in_s_axi_awready => sysgensynthfse_i_in_s_axi_awready,
    sysgensynthfse_i_in_s_axi_wready => sysgensynthfse_i_in_s_axi_wready,
    sysgensynthfse_i_in_s_axi_bresp => sysgensynthfse_i_in_s_axi_bresp,
    sysgensynthfse_i_in_s_axi_bvalid => sysgensynthfse_i_in_s_axi_bvalid,
    sysgensynthfse_i_in_s_axi_arready => sysgensynthfse_i_in_s_axi_arready,
    sysgensynthfse_i_in_s_axi_rdata => sysgensynthfse_i_in_s_axi_rdata,
    sysgensynthfse_i_in_s_axi_rresp => sysgensynthfse_i_in_s_axi_rresp,
    sysgensynthfse_i_in_s_axi_rvalid => sysgensynthfse_i_in_s_axi_rvalid,
    sysgensynthfse_q_in_s_axi_awready => sysgensynthfse_q_in_s_axi_awready,
    sysgensynthfse_q_in_s_axi_wready => sysgensynthfse_q_in_s_axi_wready,
    sysgensynthfse_q_in_s_axi_bresp => sysgensynthfse_q_in_s_axi_bresp,
    sysgensynthfse_q_in_s_axi_bvalid => sysgensynthfse_q_in_s_axi_bvalid,
    sysgensynthfse_q_in_s_axi_arready => sysgensynthfse_q_in_s_axi_arready,
    sysgensynthfse_q_in_s_axi_rdata => sysgensynthfse_q_in_s_axi_rdata,
    sysgensynthfse_q_in_s_axi_rresp => sysgensynthfse_q_in_s_axi_rresp,
    sysgensynthfse_q_in_s_axi_rvalid => sysgensynthfse_q_in_s_axi_rvalid,
    sysgensynthfse_q_out_s_axi_awready => sysgensynthfse_q_out_s_axi_awready,
    sysgensynthfse_q_out_s_axi_wready => sysgensynthfse_q_out_s_axi_wready,
    sysgensynthfse_q_out_s_axi_bresp => sysgensynthfse_q_out_s_axi_bresp,
    sysgensynthfse_q_out_s_axi_bvalid => sysgensynthfse_q_out_s_axi_bvalid,
    sysgensynthfse_q_out_s_axi_arready => sysgensynthfse_q_out_s_axi_arready,
    sysgensynthfse_q_out_s_axi_rdata => sysgensynthfse_q_out_s_axi_rdata,
    sysgensynthfse_q_out_s_axi_rresp => sysgensynthfse_q_out_s_axi_rresp,
    sysgensynthfse_q_out_s_axi_rvalid => sysgensynthfse_q_out_s_axi_rvalid
  );
end structural;
