--Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2015.1 (win64) Build 1215546 Mon Apr 27 19:22:08 MDT 2015
--Date        : Sun Jul 26 21:19:56 2015
--Host        : Thi3fLaptop running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    eth_mdio_mdc_mdc : out STD_LOGIC;
    eth_mdio_mdc_mdio_io : inout STD_LOGIC;
    eth_ref_clk : out STD_LOGIC;
    eth_rmii_crs_dv : in STD_LOGIC;
    eth_rmii_rx_er : in STD_LOGIC;
    eth_rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    eth_rmii_tx_en : out STD_LOGIC;
    eth_rmii_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    processor_clk : out STD_LOGIC;
    psram_rtl_addr : out STD_LOGIC_VECTOR ( 22 downto 0 );
    psram_rtl_adv_ldn : out STD_LOGIC;
    psram_rtl_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    psram_rtl_ce_n : out STD_LOGIC;
    psram_rtl_cre : out STD_LOGIC;
    psram_rtl_dq_io : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    psram_rtl_oen : out STD_LOGIC;
    psram_rtl_wen : out STD_LOGIC;
    reset : in STD_LOGIC;
    resetn : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    psram_rtl_ce_n : out STD_LOGIC;
    psram_rtl_adv_ldn : out STD_LOGIC;
    psram_rtl_oen : out STD_LOGIC;
    psram_rtl_addr : out STD_LOGIC_VECTOR ( 22 downto 0 );
    psram_rtl_wen : out STD_LOGIC;
    psram_rtl_dq_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    psram_rtl_dq_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    psram_rtl_ben : out STD_LOGIC_VECTOR ( 1 downto 0 );
    psram_rtl_dq_t : out STD_LOGIC_VECTOR ( 15 downto 0 );
    psram_rtl_cre : out STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    eth_mdio_mdc_mdc : out STD_LOGIC;
    eth_mdio_mdc_mdio_i : in STD_LOGIC;
    eth_mdio_mdc_mdio_o : out STD_LOGIC;
    eth_mdio_mdc_mdio_t : out STD_LOGIC;
    eth_rmii_crs_dv : in STD_LOGIC;
    eth_rmii_rx_er : in STD_LOGIC;
    eth_rmii_rxd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    eth_rmii_tx_en : out STD_LOGIC;
    eth_rmii_txd : out STD_LOGIC_VECTOR ( 1 downto 0 );
    processor_clk : out STD_LOGIC;
    sys_clock : in STD_LOGIC;
    resetn : in STD_LOGIC;
    reset : in STD_LOGIC;
    eth_ref_clk : out STD_LOGIC
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal eth_mdio_mdc_mdio_i : STD_LOGIC;
  signal eth_mdio_mdc_mdio_o : STD_LOGIC;
  signal eth_mdio_mdc_mdio_t : STD_LOGIC;
  signal psram_rtl_dq_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal psram_rtl_dq_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal psram_rtl_dq_i_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal psram_rtl_dq_i_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal psram_rtl_dq_i_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal psram_rtl_dq_i_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal psram_rtl_dq_i_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal psram_rtl_dq_i_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal psram_rtl_dq_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal psram_rtl_dq_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal psram_rtl_dq_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal psram_rtl_dq_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal psram_rtl_dq_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal psram_rtl_dq_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal psram_rtl_dq_i_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal psram_rtl_dq_i_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal psram_rtl_dq_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal psram_rtl_dq_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal psram_rtl_dq_io_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal psram_rtl_dq_io_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal psram_rtl_dq_io_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal psram_rtl_dq_io_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal psram_rtl_dq_io_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal psram_rtl_dq_io_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal psram_rtl_dq_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal psram_rtl_dq_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal psram_rtl_dq_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal psram_rtl_dq_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal psram_rtl_dq_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal psram_rtl_dq_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal psram_rtl_dq_io_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal psram_rtl_dq_io_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal psram_rtl_dq_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal psram_rtl_dq_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal psram_rtl_dq_o_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal psram_rtl_dq_o_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal psram_rtl_dq_o_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal psram_rtl_dq_o_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal psram_rtl_dq_o_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal psram_rtl_dq_o_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal psram_rtl_dq_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal psram_rtl_dq_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal psram_rtl_dq_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal psram_rtl_dq_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal psram_rtl_dq_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal psram_rtl_dq_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal psram_rtl_dq_o_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal psram_rtl_dq_o_9 : STD_LOGIC_VECTOR ( 9 to 9 );
  signal psram_rtl_dq_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal psram_rtl_dq_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal psram_rtl_dq_t_10 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal psram_rtl_dq_t_11 : STD_LOGIC_VECTOR ( 11 to 11 );
  signal psram_rtl_dq_t_12 : STD_LOGIC_VECTOR ( 12 to 12 );
  signal psram_rtl_dq_t_13 : STD_LOGIC_VECTOR ( 13 to 13 );
  signal psram_rtl_dq_t_14 : STD_LOGIC_VECTOR ( 14 to 14 );
  signal psram_rtl_dq_t_15 : STD_LOGIC_VECTOR ( 15 to 15 );
  signal psram_rtl_dq_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal psram_rtl_dq_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal psram_rtl_dq_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal psram_rtl_dq_t_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal psram_rtl_dq_t_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal psram_rtl_dq_t_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal psram_rtl_dq_t_8 : STD_LOGIC_VECTOR ( 8 to 8 );
  signal psram_rtl_dq_t_9 : STD_LOGIC_VECTOR ( 9 to 9 );
begin
design_1_i: component design_1
     port map (
      eth_mdio_mdc_mdc => eth_mdio_mdc_mdc,
      eth_mdio_mdc_mdio_i => eth_mdio_mdc_mdio_i,
      eth_mdio_mdc_mdio_o => eth_mdio_mdc_mdio_o,
      eth_mdio_mdc_mdio_t => eth_mdio_mdc_mdio_t,
      eth_ref_clk => eth_ref_clk,
      eth_rmii_crs_dv => eth_rmii_crs_dv,
      eth_rmii_rx_er => eth_rmii_rx_er,
      eth_rmii_rxd(1 downto 0) => eth_rmii_rxd(1 downto 0),
      eth_rmii_tx_en => eth_rmii_tx_en,
      eth_rmii_txd(1 downto 0) => eth_rmii_txd(1 downto 0),
      processor_clk => processor_clk,
      psram_rtl_addr(22 downto 0) => psram_rtl_addr(22 downto 0),
      psram_rtl_adv_ldn => psram_rtl_adv_ldn,
      psram_rtl_ben(1 downto 0) => psram_rtl_ben(1 downto 0),
      psram_rtl_ce_n => psram_rtl_ce_n,
      psram_rtl_cre => psram_rtl_cre,
      psram_rtl_dq_i(15) => psram_rtl_dq_i_15(15),
      psram_rtl_dq_i(14) => psram_rtl_dq_i_14(14),
      psram_rtl_dq_i(13) => psram_rtl_dq_i_13(13),
      psram_rtl_dq_i(12) => psram_rtl_dq_i_12(12),
      psram_rtl_dq_i(11) => psram_rtl_dq_i_11(11),
      psram_rtl_dq_i(10) => psram_rtl_dq_i_10(10),
      psram_rtl_dq_i(9) => psram_rtl_dq_i_9(9),
      psram_rtl_dq_i(8) => psram_rtl_dq_i_8(8),
      psram_rtl_dq_i(7) => psram_rtl_dq_i_7(7),
      psram_rtl_dq_i(6) => psram_rtl_dq_i_6(6),
      psram_rtl_dq_i(5) => psram_rtl_dq_i_5(5),
      psram_rtl_dq_i(4) => psram_rtl_dq_i_4(4),
      psram_rtl_dq_i(3) => psram_rtl_dq_i_3(3),
      psram_rtl_dq_i(2) => psram_rtl_dq_i_2(2),
      psram_rtl_dq_i(1) => psram_rtl_dq_i_1(1),
      psram_rtl_dq_i(0) => psram_rtl_dq_i_0(0),
      psram_rtl_dq_o(15) => psram_rtl_dq_o_15(15),
      psram_rtl_dq_o(14) => psram_rtl_dq_o_14(14),
      psram_rtl_dq_o(13) => psram_rtl_dq_o_13(13),
      psram_rtl_dq_o(12) => psram_rtl_dq_o_12(12),
      psram_rtl_dq_o(11) => psram_rtl_dq_o_11(11),
      psram_rtl_dq_o(10) => psram_rtl_dq_o_10(10),
      psram_rtl_dq_o(9) => psram_rtl_dq_o_9(9),
      psram_rtl_dq_o(8) => psram_rtl_dq_o_8(8),
      psram_rtl_dq_o(7) => psram_rtl_dq_o_7(7),
      psram_rtl_dq_o(6) => psram_rtl_dq_o_6(6),
      psram_rtl_dq_o(5) => psram_rtl_dq_o_5(5),
      psram_rtl_dq_o(4) => psram_rtl_dq_o_4(4),
      psram_rtl_dq_o(3) => psram_rtl_dq_o_3(3),
      psram_rtl_dq_o(2) => psram_rtl_dq_o_2(2),
      psram_rtl_dq_o(1) => psram_rtl_dq_o_1(1),
      psram_rtl_dq_o(0) => psram_rtl_dq_o_0(0),
      psram_rtl_dq_t(15) => psram_rtl_dq_t_15(15),
      psram_rtl_dq_t(14) => psram_rtl_dq_t_14(14),
      psram_rtl_dq_t(13) => psram_rtl_dq_t_13(13),
      psram_rtl_dq_t(12) => psram_rtl_dq_t_12(12),
      psram_rtl_dq_t(11) => psram_rtl_dq_t_11(11),
      psram_rtl_dq_t(10) => psram_rtl_dq_t_10(10),
      psram_rtl_dq_t(9) => psram_rtl_dq_t_9(9),
      psram_rtl_dq_t(8) => psram_rtl_dq_t_8(8),
      psram_rtl_dq_t(7) => psram_rtl_dq_t_7(7),
      psram_rtl_dq_t(6) => psram_rtl_dq_t_6(6),
      psram_rtl_dq_t(5) => psram_rtl_dq_t_5(5),
      psram_rtl_dq_t(4) => psram_rtl_dq_t_4(4),
      psram_rtl_dq_t(3) => psram_rtl_dq_t_3(3),
      psram_rtl_dq_t(2) => psram_rtl_dq_t_2(2),
      psram_rtl_dq_t(1) => psram_rtl_dq_t_1(1),
      psram_rtl_dq_t(0) => psram_rtl_dq_t_0(0),
      psram_rtl_oen => psram_rtl_oen,
      psram_rtl_wen => psram_rtl_wen,
      reset => reset,
      resetn => resetn,
      sys_clock => sys_clock,
      usb_uart_rxd => usb_uart_rxd,
      usb_uart_txd => usb_uart_txd
    );
eth_mdio_mdc_mdio_iobuf: component IOBUF
     port map (
      I => eth_mdio_mdc_mdio_o,
      IO => eth_mdio_mdc_mdio_io,
      O => eth_mdio_mdc_mdio_i,
      T => eth_mdio_mdc_mdio_t
    );
psram_rtl_dq_iobuf_0: component IOBUF
     port map (
      I => psram_rtl_dq_o_0(0),
      IO => psram_rtl_dq_io(0),
      O => psram_rtl_dq_i_0(0),
      T => psram_rtl_dq_t_0(0)
    );
psram_rtl_dq_iobuf_1: component IOBUF
     port map (
      I => psram_rtl_dq_o_1(1),
      IO => psram_rtl_dq_io(1),
      O => psram_rtl_dq_i_1(1),
      T => psram_rtl_dq_t_1(1)
    );
psram_rtl_dq_iobuf_10: component IOBUF
     port map (
      I => psram_rtl_dq_o_10(10),
      IO => psram_rtl_dq_io(10),
      O => psram_rtl_dq_i_10(10),
      T => psram_rtl_dq_t_10(10)
    );
psram_rtl_dq_iobuf_11: component IOBUF
     port map (
      I => psram_rtl_dq_o_11(11),
      IO => psram_rtl_dq_io(11),
      O => psram_rtl_dq_i_11(11),
      T => psram_rtl_dq_t_11(11)
    );
psram_rtl_dq_iobuf_12: component IOBUF
     port map (
      I => psram_rtl_dq_o_12(12),
      IO => psram_rtl_dq_io(12),
      O => psram_rtl_dq_i_12(12),
      T => psram_rtl_dq_t_12(12)
    );
psram_rtl_dq_iobuf_13: component IOBUF
     port map (
      I => psram_rtl_dq_o_13(13),
      IO => psram_rtl_dq_io(13),
      O => psram_rtl_dq_i_13(13),
      T => psram_rtl_dq_t_13(13)
    );
psram_rtl_dq_iobuf_14: component IOBUF
     port map (
      I => psram_rtl_dq_o_14(14),
      IO => psram_rtl_dq_io(14),
      O => psram_rtl_dq_i_14(14),
      T => psram_rtl_dq_t_14(14)
    );
psram_rtl_dq_iobuf_15: component IOBUF
     port map (
      I => psram_rtl_dq_o_15(15),
      IO => psram_rtl_dq_io(15),
      O => psram_rtl_dq_i_15(15),
      T => psram_rtl_dq_t_15(15)
    );
psram_rtl_dq_iobuf_2: component IOBUF
     port map (
      I => psram_rtl_dq_o_2(2),
      IO => psram_rtl_dq_io(2),
      O => psram_rtl_dq_i_2(2),
      T => psram_rtl_dq_t_2(2)
    );
psram_rtl_dq_iobuf_3: component IOBUF
     port map (
      I => psram_rtl_dq_o_3(3),
      IO => psram_rtl_dq_io(3),
      O => psram_rtl_dq_i_3(3),
      T => psram_rtl_dq_t_3(3)
    );
psram_rtl_dq_iobuf_4: component IOBUF
     port map (
      I => psram_rtl_dq_o_4(4),
      IO => psram_rtl_dq_io(4),
      O => psram_rtl_dq_i_4(4),
      T => psram_rtl_dq_t_4(4)
    );
psram_rtl_dq_iobuf_5: component IOBUF
     port map (
      I => psram_rtl_dq_o_5(5),
      IO => psram_rtl_dq_io(5),
      O => psram_rtl_dq_i_5(5),
      T => psram_rtl_dq_t_5(5)
    );
psram_rtl_dq_iobuf_6: component IOBUF
     port map (
      I => psram_rtl_dq_o_6(6),
      IO => psram_rtl_dq_io(6),
      O => psram_rtl_dq_i_6(6),
      T => psram_rtl_dq_t_6(6)
    );
psram_rtl_dq_iobuf_7: component IOBUF
     port map (
      I => psram_rtl_dq_o_7(7),
      IO => psram_rtl_dq_io(7),
      O => psram_rtl_dq_i_7(7),
      T => psram_rtl_dq_t_7(7)
    );
psram_rtl_dq_iobuf_8: component IOBUF
     port map (
      I => psram_rtl_dq_o_8(8),
      IO => psram_rtl_dq_io(8),
      O => psram_rtl_dq_i_8(8),
      T => psram_rtl_dq_t_8(8)
    );
psram_rtl_dq_iobuf_9: component IOBUF
     port map (
      I => psram_rtl_dq_o_9(9),
      IO => psram_rtl_dq_io(9),
      O => psram_rtl_dq_i_9(9),
      T => psram_rtl_dq_t_9(9)
    );
end STRUCTURE;
