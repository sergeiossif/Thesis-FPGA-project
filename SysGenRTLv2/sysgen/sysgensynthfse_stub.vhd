-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity sysgensynthfse_stub is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    i_desired : in std_logic_vector( 10-1 downto 0 );
    q_desired : in std_logic_vector( 10-1 downto 0 );
    clk : in std_logic;
    clr : in std_logic;
    i_out : out std_logic_vector( 10-1 downto 0 );
    q_out : out std_logic_vector( 10-1 downto 0 );
    dh_i : out std_logic_vector( 18-1 downto 0 );
    dh_q : out std_logic_vector( 18-1 downto 0 );
    e_i : out std_logic_vector( 18-1 downto 0 );
    e_q : out std_logic_vector( 18-1 downto 0 );
    gateway_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out1 : out std_logic_vector( 18-1 downto 0 )
  );
end sysgensynthfse_stub;
architecture structural of sysgensynthfse_stub is 
begin
  sysgen_dut : entity xil_defaultlib.sysgensynthfse 
  port map (
    i_in => i_in,
    q_in => q_in,
    i_desired => i_desired,
    q_desired => q_desired,
    clk => clk,
    clr => clr,
    i_out => i_out,
    q_out => q_out,
    dh_i => dh_i,
    dh_q => dh_q,
    e_i => e_i,
    e_q => e_q,
    gateway_out => gateway_out,
    gateway_out1 => gateway_out1
  );
end structural;
