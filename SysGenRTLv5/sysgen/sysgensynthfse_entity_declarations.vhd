-------------------------------------------------------------------
-- System Generator version 2015.1 VHDL source file.
--
-- Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xlregister.vhd
--
--  Description   : VHDL description of an arbitrary wide register.
--                  Unlike the delay block, an initial value is
--                  specified and is considered valid at the start
--                  of simulation.  The register is only one word
--                  deep.
--
--  Mod. History  : Removed valid bit logic from wrapper.
--                : Changed VHDL to use a bit_vector generic for its
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity sysgensynthfse_xlregister is

   generic (d_width          : integer := 5;          -- Width of d input
            init_value       : bit_vector := b"00");  -- Binary init value string

   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));

end sysgensynthfse_xlregister;

architecture behavior of sysgensynthfse_xlregister is

   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component; -- end synth_reg_w_init

   -- synthesis translate_off
   signal real_d, real_q           : real;    -- For debugging info ports
   -- synthesis translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;

begin

   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;

   -- Synthesizable behavioral model
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);

end architecture behavior;


library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_ce254631c3 is
  port (
    d : in std_logic_vector((18 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_ce254631c3;
architecture behavior of sysgen_delay_ce254631c3
is
  signal d_1_22: std_logic_vector((18 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (2 - 1)) of std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    "000000000000000000",
    "000000000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((18 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(1);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_20_24_push_front_pop_back_en = '1')) then
        for i in 1 downto 1 loop 
          op_mem_20_24(i) <= op_mem_20_24(i-1);
        end loop;
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= '1';
  q <= op_mem_20_24_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

---------------------------------------------------------------------
--
--  Filename      : xldsamp.vhd
--
--  Description   : VHDL description of a block that is inserted into the
--                  data path to down sample the data betwen two blocks
--                  where the period is different between two blocks.
--
--  Mod. History  : Changed clock timing on the down sampler.  The
--                  destination enable is delayed by one system clock
--                  cycle and held until the next consecutive source
--                  enable pulse.  This change allows downsampler data
--                  transitions to occur on the rising clock edge when
--                  the destination ce is asserted.
--                : Added optional latency is the downsampler.  Note, if
--                  the latency is greater than 0, no shutter is used.
--                : Removed valid bit logic from wrapper
--
--
---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


-- synthesis translate_off
library unisim;
use unisim.vcomponents.all;
-- synthesis translate_on

entity sysgensynthfse_xldsamp is
  generic (
    d_width: integer := 12;
    d_bin_pt: integer := 0;
    d_arith: integer := xlUnsigned;
    q_width: integer := 12;
    q_bin_pt: integer := 0;
    q_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    ds_ratio: integer := 2;
    phase: integer := 0;
    latency: integer := 1
  );
  port (
    d: in std_logic_vector(d_width - 1 downto 0);
    src_clk: in std_logic;
    src_ce: in std_logic;
    src_clr: in std_logic;
    dest_clk: in std_logic;
    dest_ce: in std_logic;
    dest_clr: in std_logic;
    en: in std_logic_vector(en_width - 1 downto 0);
    rst: in std_logic_vector(rst_width - 1 downto 0);
    q: out std_logic_vector(q_width - 1 downto 0)
  );
end sysgensynthfse_xldsamp;

architecture struct of sysgensynthfse_xldsamp is
  component synth_reg
    generic (
      width: integer := 16;
      latency: integer := 5
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component; -- end synth_reg

  component synth_reg_reg
     generic (width       : integer;
              latency     : integer);
     port (i       : in std_logic_vector(width-1 downto 0);
           ce      : in std_logic;
           clr     : in std_logic;
           clk     : in std_logic;
           o       : out std_logic_vector(width-1 downto 0));
  end component;

  component fdse
    port (
      q: out   std_ulogic;
      d: in    std_ulogic;
      c: in    std_ulogic;
      s: in    std_ulogic;
      ce: in    std_ulogic
    );
  end component; -- end fdse
  attribute syn_black_box of fdse: component is true;
  attribute fpga_dont_touch of fdse: component is "true";

  signal adjusted_dest_ce: std_logic;
  signal adjusted_dest_ce_w_en: std_logic;
  signal dest_ce_w_en: std_logic;
  signal smpld_d: std_logic_vector(d_width-1 downto 0);
  signal sclr:std_logic;
begin
  -- An 'adjusted' destination clock enable signal must be generated for
  -- the zero latency and double registered down-sampler implementations.
  -- For both cases, it is necassary to adjust the timing of the clock
  -- enable so that it is asserted at the start of the sample period,
  -- instead of the end.  This is realized using an fdse prim. to register
  -- the destination clock enable.  The fdse itself is enabled with the
  -- source clock enable.  Enabling the fdse holds the adjusted CE high
  -- for the duration of the fast sample period and is needed to satisfy
  -- the multicycle constraint if the input data is running at a non-system
  -- rate.
  adjusted_ce_needed: if ((latency = 0) or (phase /= (ds_ratio - 1))) generate
    dest_ce_reg: fdse
      port map (
        q => adjusted_dest_ce,
        d => dest_ce,
        c => src_clk,
        s => sclr,
        ce => src_ce
      );
  end generate; -- adjusted_ce_needed

  -- A shutter (mux/reg pair) is used to implement a 0 latency downsampler.
  -- The shutter uses the adjusted destination clock enable to select between
  -- the current input and the sampled input.
  latency_eq_0: if (latency = 0) generate
    shutter_d_reg: synth_reg
      generic map (
        width => d_width,
        latency => 1
      )
      port map (
        i => d,
        ce => adjusted_dest_ce,
        clr => sclr,
        clk => src_clk,
        o => smpld_d
      );

    -- Mux selects current input value or register value.
    shutter_mux: process (adjusted_dest_ce, d, smpld_d)
    begin
	  if adjusted_dest_ce = '0' then
        q <= smpld_d;
      else
        q <= d;
      end if;
    end process; -- end select_mux
  end generate; -- end latency_eq_0

  -- A more efficient downsampler can be implemented if a latency > 0 is
  -- allowed.  There are two possible implementations, depending on the
  -- requested sampling phase.  A double register downsampler is needed
  -- for all cases except when the sample phase is the last input frame
  -- of the sample period.  In this case, only one register is needed.

  latency_gt_0: if (latency > 0) generate
    -- The first register in the double reg implementation is used to
    -- sample the correct frame (phase) of the input data.  Both the
    -- data and valid bit must be sampled.
    dbl_reg_test: if (phase /= (ds_ratio-1)) generate
        smpl_d_reg: synth_reg_reg
          generic map (
            width => d_width,
            latency => 1
          )
          port map (
            i => d,
            ce => adjusted_dest_ce_w_en,
            clr => sclr,
            clk => src_clk,
            o => smpld_d
          );
    end generate; -- end dbl_reg_test

    sngl_reg_test: if (phase = (ds_ratio -1)) generate
      smpld_d <= d;
    end generate; -- sngl_reg_test

    -- The latency pipe captures the sampled data and the END of the sample
    -- period.  Note that if the requested sample phase is the last input
    -- frame in the period, the first register (smpl_reg) is not needed.
    latency_pipe: synth_reg_reg
      generic map (
        width => d_width,
        latency => latency
      )
      port map (
        i => smpld_d,
        ce => dest_ce_w_en,
        clr => sclr,
        clk => dest_clk,
        o => q
      );
  end generate; -- end latency_gt_0

  -- Signal assignments
  dest_ce_w_en <= dest_ce and en(0);
  adjusted_dest_ce_w_en <= adjusted_dest_ce and en(0);
  sclr <= (src_clr or rst(0)) and dest_ce;
end architecture struct;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_9be8e7d538 is
  port (
    i : in std_logic_vector((18 - 1) downto 0);
    v : out std_logic_vector((10 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_9be8e7d538;
architecture behavior of sysgen_mcode_block_9be8e7d538
is
  signal i_1_22: signed((18 - 1) downto 0);
  signal r0_11_16_next: signed((10 - 1) downto 0);
  signal r0_11_16: signed((10 - 1) downto 0) := "0000000000";
  signal r1_12_16_next: signed((10 - 1) downto 0);
  signal r1_12_16: signed((10 - 1) downto 0) := "0000000000";
  signal msb_8_1_slice: unsigned((1 - 1) downto 0);
  signal cast_19_20: signed((19 - 1) downto 0);
  signal neg_19_19: signed((19 - 1) downto 0);
  signal rel_19_7: boolean;
  signal r0_join_19_3: signed((9 - 1) downto 0);
  signal rel_25_7: boolean;
  signal r0_join_25_3: signed((10 - 1) downto 0);
  signal rel_18_5: boolean;
  signal r0_join_18_1: signed((10 - 1) downto 0);
begin
  i_1_22 <= std_logic_vector_to_signed(i);
  proc_r0_11_16: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        r0_11_16 <= r0_11_16_next;
      end if;
    end if;
  end process proc_r0_11_16;
  proc_r1_12_16: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        r1_12_16 <= r1_12_16_next;
      end if;
    end if;
  end process proc_r1_12_16;
  msb_8_1_slice <= s2u_slice(i_1_22, 17, 17);
  cast_19_20 <= s2s_cast(i_1_22, 10, 19, 10);
  neg_19_19 <=  -cast_19_20;
  rel_19_7 <= std_logic_vector_to_signed("0000000001010101100") < neg_19_19;
  proc_if_19_3: process (rel_19_7)
  is
  begin
    if rel_19_7 then
      r0_join_19_3 <= std_logic_vector_to_signed("100000000");
    else 
      r0_join_19_3 <= std_logic_vector_to_signed("110101011");
    end if;
  end process proc_if_19_3;
  rel_25_7 <= std_logic_vector_to_signed("000000001010101100") < i_1_22;
  proc_if_25_3: process (rel_25_7)
  is
  begin
    if rel_25_7 then
      r0_join_25_3 <= std_logic_vector_to_signed("0100000000");
    else 
      r0_join_25_3 <= std_logic_vector_to_signed("0001010101");
    end if;
  end process proc_if_25_3;
  rel_18_5 <= msb_8_1_slice = std_logic_vector_to_unsigned("1");
  proc_if_18_1: process (r0_join_19_3, r0_join_25_3, rel_18_5)
  is
  begin
    if rel_18_5 then
      r0_join_18_1 <= s2s_cast(r0_join_19_3, 8, 10, 8);
    else 
      r0_join_18_1 <= r0_join_25_3;
    end if;
  end process proc_if_18_1;
  r0_11_16_next <= r0_join_18_1;
  r1_12_16_next <= r0_11_16;
  v <= signed_to_std_logic_vector(r1_12_16);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_f5be8d2ed8 is
  port (
    sym_i : in std_logic_vector((10 - 1) downto 0);
    filt_i : in std_logic_vector((18 - 1) downto 0);
    sym_q : in std_logic_vector((10 - 1) downto 0);
    filt_q : in std_logic_vector((18 - 1) downto 0);
    mu_e_i : out std_logic_vector((18 - 1) downto 0);
    e_i : out std_logic_vector((18 - 1) downto 0);
    e_q : out std_logic_vector((18 - 1) downto 0);
    mu_e_q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_f5be8d2ed8;
architecture behavior of sysgen_mcode_block_f5be8d2ed8
is
  signal sym_i_1_46: signed((10 - 1) downto 0);
  signal filt_i_1_53: signed((18 - 1) downto 0);
  signal sym_q_1_61: signed((10 - 1) downto 0);
  signal filt_q_1_68: signed((18 - 1) downto 0);
  signal r0_3_16_next: signed((18 - 1) downto 0);
  signal r0_3_16: signed((18 - 1) downto 0);
  signal r0_3_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r0_3_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal r1_4_16_next: signed((18 - 1) downto 0);
  signal r1_4_16: signed((18 - 1) downto 0);
  signal r1_4_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r1_4_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal r2_5_16_next: signed((18 - 1) downto 0);
  signal r2_5_16: signed((18 - 1) downto 0);
  signal r2_5_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r2_5_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal r3_6_16_next: signed((18 - 1) downto 0);
  signal r3_6_16: signed((18 - 1) downto 0);
  signal r3_6_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r3_6_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal r4_7_16_next: signed((18 - 1) downto 0);
  signal r4_7_16: signed((18 - 1) downto 0);
  signal r4_7_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r4_7_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal r5_8_16_next: signed((18 - 1) downto 0);
  signal r5_8_16: signed((18 - 1) downto 0);
  signal r5_8_16_reg_i: std_logic_vector((18 - 1) downto 0);
  signal r5_8_16_reg_o: std_logic_vector((18 - 1) downto 0);
  signal cast_13_7: signed((19 - 1) downto 0);
  signal cast_13_15: signed((19 - 1) downto 0);
  signal r4_13_1_addsub: signed((19 - 1) downto 0);
  signal cast_16_7: signed((19 - 1) downto 0);
  signal cast_16_15: signed((19 - 1) downto 0);
  signal r5_16_1_addsub: signed((19 - 1) downto 0);
  signal r1_20_1_mult: signed((37 - 1) downto 0);
  signal cast_24_7: signed((20 - 1) downto 0);
  signal neg_24_6: signed((20 - 1) downto 0);
  signal r3_24_1_mult: signed((38 - 1) downto 0);
  signal r1_4_16_next_x_000000: signed((18 - 1) downto 0);
  signal r3_6_16_next_x_000000: signed((18 - 1) downto 0);
  signal r4_7_16_next_x_000000: signed((18 - 1) downto 0);
  signal r5_8_16_next_x_000000: signed((18 - 1) downto 0);
begin
  sym_i_1_46 <= std_logic_vector_to_signed(sym_i);
  filt_i_1_53 <= std_logic_vector_to_signed(filt_i);
  sym_q_1_61 <= std_logic_vector_to_signed(sym_q);
  filt_q_1_68 <= std_logic_vector_to_signed(filt_q);
  r0_3_16_reg_i <= signed_to_std_logic_vector(r0_3_16_next);
  r0_3_16 <= std_logic_vector_to_signed(r0_3_16_reg_o);
  r0_3_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r0_3_16_reg_i, 
      o => r0_3_16_reg_o);
  r1_4_16_reg_i <= signed_to_std_logic_vector(r1_4_16_next);
  r1_4_16 <= std_logic_vector_to_signed(r1_4_16_reg_o);
  r1_4_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r1_4_16_reg_i, 
      o => r1_4_16_reg_o);
  r2_5_16_reg_i <= signed_to_std_logic_vector(r2_5_16_next);
  r2_5_16 <= std_logic_vector_to_signed(r2_5_16_reg_o);
  r2_5_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r2_5_16_reg_i, 
      o => r2_5_16_reg_o);
  r3_6_16_reg_i <= signed_to_std_logic_vector(r3_6_16_next);
  r3_6_16 <= std_logic_vector_to_signed(r3_6_16_reg_o);
  r3_6_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r3_6_16_reg_i, 
      o => r3_6_16_reg_o);
  r4_7_16_reg_i <= signed_to_std_logic_vector(r4_7_16_next);
  r4_7_16 <= std_logic_vector_to_signed(r4_7_16_reg_o);
  r4_7_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r4_7_16_reg_i, 
      o => r4_7_16_reg_o);
  r5_8_16_reg_i <= signed_to_std_logic_vector(r5_8_16_next);
  r5_8_16 <= std_logic_vector_to_signed(r5_8_16_reg_o);
  r5_8_16_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000000010100100", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r5_8_16_reg_i, 
      o => r5_8_16_reg_o);
  cast_13_7 <= s2s_cast(sym_i_1_46, 8, 19, 10);
  cast_13_15 <= s2s_cast(filt_i_1_53, 10, 19, 10);
  r4_13_1_addsub <= cast_13_7 - cast_13_15;
  cast_16_7 <= s2s_cast(sym_q_1_61, 8, 19, 10);
  cast_16_15 <= s2s_cast(filt_q_1_68, 10, 19, 10);
  r5_16_1_addsub <= cast_16_7 - cast_16_15;
  r1_20_1_mult <= (r4_13_1_addsub * std_logic_vector_to_signed("000000000010100100"));
  cast_24_7 <= s2s_cast(r5_16_1_addsub, 10, 20, 10);
  neg_24_6 <=  -cast_24_7;
  r3_24_1_mult <= (neg_24_6 * std_logic_vector_to_signed("000000000010100100"));
  r0_3_16_next <= r1_4_16;
  r1_4_16_next_x_000000 <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(r1_20_1_mult), 37, 25, xlSigned, 18, 15, xlSigned, xlRound, xlWrap));
  r1_4_16_next <= r1_4_16_next_x_000000;
  r2_5_16_next <= r3_6_16;
  r3_6_16_next_x_000000 <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(r3_24_1_mult), 38, 25, xlSigned, 18, 15, xlSigned, xlRound, xlWrap));
  r3_6_16_next <= r3_6_16_next_x_000000;
  r4_7_16_next_x_000000 <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(r4_13_1_addsub), 19, 10, xlSigned, 18, 15, xlSigned, xlRound, xlWrap));
  r4_7_16_next <= r4_7_16_next_x_000000;
  r5_8_16_next_x_000000 <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(r5_16_1_addsub), 19, 10, xlSigned, 18, 15, xlSigned, xlRound, xlWrap));
  r5_8_16_next <= r5_8_16_next_x_000000;
  mu_e_i <= signed_to_std_logic_vector(r0_3_16);
  e_i <= signed_to_std_logic_vector(r4_7_16);
  e_q <= signed_to_std_logic_vector(r5_8_16);
  mu_e_q <= signed_to_std_logic_vector(r2_5_16);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_a3bd783a9f is
  port (
    a : in std_logic_vector((36 - 1) downto 0);
    b : in std_logic_vector((36 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_a3bd783a9f;
architecture behavior of sysgen_addsub_a3bd783a9f
is
  signal a_17_32: signed((36 - 1) downto 0);
  signal b_17_35: signed((36 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((37 - 1) downto 0);
  signal cast_69_22: signed((37 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((37 - 1) downto 0);
  signal cast_internal_s_83_3_convert: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= s2s_cast(a_17_32, 28, 37, 28);
  cast_69_22 <= s2s_cast(b_17_35, 28, 37, 28);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  cast_internal_s_83_3_convert <= s2s_cast(internal_s_69_5_addsub, 28, 18, 10);
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(cast_internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_165894e142 is
  port (
    d : in std_logic_vector((12 - 1) downto 0);
    q : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_165894e142;
architecture behavior of sysgen_delay_165894e142
is
  signal d_1_22: std_logic_vector((12 - 1) downto 0);
  type array_type_op_mem_20_24 is array (0 to (1 - 1)) of std_logic_vector((12 - 1) downto 0);
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    0 => "000000000000");
  signal op_mem_20_24_front_din: std_logic_vector((12 - 1) downto 0);
  signal op_mem_20_24_back: std_logic_vector((12 - 1) downto 0);
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d;
  op_mem_20_24_back <= op_mem_20_24(0);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_20_24_push_front_pop_back_en = '1')) then
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= '1';
  q <= op_mem_20_24_back;
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

----------------------------------------------------------------------------
--
--  Filename      : xlusamp.vhd
--
--  Description   : VHDL description of an up sampler.  The input signal
--                  has a larger period than the output signal's period
--                  and the blocks's period is set on the Simulink mask
--                  GUI.
--
--  Assumptions   : Input size, bin_pt, etc. are the same as the output
--
--  Mod. History  : Removed the shutter from the upsampler.  A mux is used
--                  to zero pad the data samples.  The mux select line is
--                  generated by registering the source enable signal
--                  when the destination ce is asserted.
--                : Removed valid bits from wrapper.
--
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


-- synthesis translate_off
library unisim;
use unisim.vcomponents.all;
-- synthesis translate_on

entity sysgensynthfse_xlusamp is

    generic (
             d_width      : integer := 5;          -- Width of d input
             d_bin_pt     : integer := 2;          -- Binary point of input d
             d_arith      : integer := xlUnsigned; -- Type of arith of d input
             q_width      : integer := 5;          -- Width of q output
             q_bin_pt     : integer := 2;          -- Binary point of output q
             q_arith      : integer := xlUnsigned; -- Type of arith of output
             en_width     : integer := 1;
             en_bin_pt    : integer := 0;
             en_arith     : integer := xlUnsigned;
             sampling_ratio     : integer := 2;
             latency      : integer := 1;
             copy_samples : integer := 0);         -- if 0, output q = 0
                                                   -- when ce = 0, else sample
                                                   -- is held until next clk

    port (
          d        : in std_logic_vector (d_width-1 downto 0);
          src_clk  : in std_logic;
          src_ce   : in std_logic;
          src_clr  : in std_logic;
          dest_clk : in std_logic;
          dest_ce  : in std_logic;
          dest_clr : in std_logic;
          en       : in std_logic_vector(en_width-1 downto 0);
          q        : out std_logic_vector (q_width-1 downto 0)
         );
end sysgensynthfse_xlusamp;

architecture struct of sysgensynthfse_xlusamp is
    component synth_reg
      generic (
        width: integer := 16;
        latency: integer := 5
      );
      port (
        i: in std_logic_vector(width - 1 downto 0);
        ce: in std_logic;
        clr: in std_logic;
        clk: in std_logic;
        o: out std_logic_vector(width - 1 downto 0)
      );
    end component; -- end synth_reg

    component FDSE
        port (q  : out   std_ulogic;
              d  : in    std_ulogic;
              c  : in    std_ulogic;
              s  : in    std_ulogic;
              ce : in    std_ulogic);
    end component; -- end FDSE

    attribute syn_black_box of FDSE : component is true;
    attribute fpga_dont_touch of FDSE : component is "true";

    signal zero    : std_logic_vector (d_width-1 downto 0);
    signal mux_sel : std_logic;
    signal sampled_d  : std_logic_vector (d_width-1 downto 0);
    signal internal_ce : std_logic;

begin


   -- If zero padding is required, a mux is used to switch between data input
   -- and zeros.  The mux select is generated by registering the source enable
   -- signal.  This register is enabled by the destination enable signal. This
   -- has the effect of holding the select line high until the next consecutive
   -- destination enable pulse, and thereby satisfying the timing constraints.
   -- Signal assignments

   -- register the source enable signal with the register enabled
   -- by the destination enable
   sel_gen : FDSE
       port map (q  => mux_sel,
           d  => src_ce,
            c  => src_clk,
            s  => src_clr,
            ce => dest_ce);
  -- Generate the user enable
  internal_ce <= src_ce and en(0);

  copy_samples_false : if (copy_samples = 0) generate

      -- signal assignments
      zero <= (others => '0');

      -- purpose: latency is 0 and copy_samples is 0
      -- type   : combinational
      -- inputs : mux_sel, d, zero
      -- outputs: q
      gen_q_cp_smpls_0_and_lat_0: if (latency = 0) generate
        cp_smpls_0_and_lat_0: process (mux_sel, d, zero)
        begin  -- process cp_smpls_0_and_lat_0
          if (mux_sel = '1') then
            q <= d;
          else
            q <= zero;
          end if;
        end process cp_smpls_0_and_lat_0;
      end generate; -- end gen_q_cp_smpls_0_and_lat_0

      gen_q_cp_smpls_0_and_lat_gt_0: if (latency > 0) generate
        sampled_d_reg: synth_reg
          generic map (
            width => d_width,
            latency => latency
          )

          port map (
            i => d,
            ce => internal_ce,
            clr => src_clr,
            clk => src_clk,
            o => sampled_d
          );

        gen_q_check_mux_sel: process (mux_sel, sampled_d, zero)
        begin
          if (mux_sel = '1') then
            q <= sampled_d;
          else
            q <= zero;
          end if;
        end process gen_q_check_mux_sel;
      end generate; -- end gen_q_cp_smpls_0_and_lat_gt_0
   end generate; -- end copy_samples_false

   -- If zero padding is not required, we can short the upsampler data inputs
   -- to the upsampler data outputs when latency is 0.
   -- This option uses no hardware resources.

   copy_samples_true : if (copy_samples = 1) generate

     gen_q_cp_smpls_1_and_lat_0: if (latency = 0) generate
       q <= d;
     end generate; -- end gen_q_cp_smpls_1_and_lat_0

     gen_q_cp_smpls_1_and_lat_gt_0: if (latency > 0) generate
       q <= sampled_d;
       sampled_d_reg2: synth_reg
         generic map (
           width => d_width,
           latency => latency
         )

         port map (
           i => d,
           ce => internal_ce,
           clr => src_clr,
           clk => src_clk,
           o => sampled_d
         );
     end generate; -- end gen_q_cp_smpls_1_and_lat_gt_0
   end generate; -- end copy_samples_true
end architecture struct;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addrsr_f2a1535cba is
  port (
    d : in std_logic_vector((12 - 1) downto 0);
    hw_en : in std_logic;
    addr : in std_logic_vector((2 - 1) downto 0);
    q : out std_logic_vector((12 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addrsr_f2a1535cba;
architecture behavior of sysgen_addrsr_f2a1535cba
is
  signal d_13_25: signed((12 - 1) downto 0);
  signal hw_en_13_28: boolean;
  signal addr_13_39: unsigned((2 - 1) downto 0);
  type array_type_r_20_17 is array (0 to (4 - 1)) of signed((12 - 1) downto 0);
  signal r_20_17: array_type_r_20_17 := (
    "000000000000",
    "000000000000",
    "000000000000",
    "000000000000");
  signal r_20_17_d: signed((12 - 1) downto 0);
  signal r_20_17_q: signed((12 - 1) downto 0);
  signal r_20_17_addr: unsigned((2 - 1) downto 0);
  signal r_20_17_en: std_logic;
  signal bool_28_8: boolean;
  signal r_shift_join_28_3: signed((12 - 1) downto 0);
  signal r_shift_join_28_3_en: std_logic;
begin
  d_13_25 <= std_logic_vector_to_signed(d);
  hw_en_13_28 <= ((hw_en) = '1');
  addr_13_39 <= std_logic_vector_to_unsigned(addr);
  r_20_17_q <= r_20_17(to_integer(r_20_17_addr));
  proc_r_20_17: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (r_20_17_en = '1')) then
        for i in 3 downto 1 loop 
          r_20_17(i) <= r_20_17(i-1);
        end loop;
        r_20_17(0) <= r_20_17_d;
      end if;
    end if;
  end process proc_r_20_17;
  bool_28_8 <= true and hw_en_13_28;
  proc_if_28_3: process (bool_28_8, d_13_25)
  is
  begin
    if bool_28_8 then
      r_shift_join_28_3_en <= '1';
    else 
      r_shift_join_28_3_en <= '0';
    end if;
    r_shift_join_28_3 <= d_13_25;
  end process proc_if_28_3;
  r_20_17_d <= r_shift_join_28_3;
  r_20_17_en <= r_shift_join_28_3_en;
  r_20_17_addr <= addr_13_39;
  q <= signed_to_std_logic_vector(r_20_17_q);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_accum_ac47251739 is
  port (
    b : in std_logic_vector((36 - 1) downto 0);
    rst : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_accum_ac47251739;
architecture behavior of sysgen_accum_ac47251739
is
  signal b_17_24: signed((36 - 1) downto 0);
  signal rst_17_27: boolean;
  signal accum_reg_39_23: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal accum_reg_39_23_rst: std_logic;
  signal accum_reg_join_45_1: signed((37 - 1) downto 0);
  signal accum_reg_join_45_1_rst: std_logic;
begin
  b_17_24 <= std_logic_vector_to_signed(b);
  rst_17_27 <= ((rst) = "1");
  proc_accum_reg_39_23: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (accum_reg_39_23_rst = '1')) then
        accum_reg_39_23 <= "000000000000000000000000000000000000";
      elsif (ce = '1') then 
        accum_reg_39_23 <= accum_reg_39_23 + b_17_24;
      end if;
    end if;
  end process proc_accum_reg_39_23;
  proc_if_45_1: process (accum_reg_39_23, b_17_24, rst_17_27)
  is
  begin
    if rst_17_27 then
      accum_reg_join_45_1_rst <= '1';
    else 
      accum_reg_join_45_1_rst <= '0';
    end if;
  end process proc_if_45_1;
  accum_reg_39_23_rst <= accum_reg_join_45_1_rst;
  q <= signed_to_std_logic_vector(accum_reg_39_23);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_addsub_8a40b637d2 is
  port (
    a : in std_logic_vector((36 - 1) downto 0);
    b : in std_logic_vector((18 - 1) downto 0);
    s : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_addsub_8a40b637d2;
architecture behavior of sysgen_addsub_8a40b637d2
is
  signal a_17_32: signed((36 - 1) downto 0);
  signal b_17_35: signed((18 - 1) downto 0);
  type array_type_op_mem_91_20 is array (0 to (1 - 1)) of signed((18 - 1) downto 0);
  signal op_mem_91_20: array_type_op_mem_91_20 := (
    0 => "000000000000000000");
  signal op_mem_91_20_front_din: signed((18 - 1) downto 0);
  signal op_mem_91_20_back: signed((18 - 1) downto 0);
  signal op_mem_91_20_push_front_pop_back_en: std_logic;
  type array_type_cout_mem_92_22 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal cout_mem_92_22: array_type_cout_mem_92_22 := (
    0 => "0");
  signal cout_mem_92_22_front_din: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_back: unsigned((1 - 1) downto 0);
  signal cout_mem_92_22_push_front_pop_back_en: std_logic;
  signal prev_mode_93_22_next: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22: unsigned((3 - 1) downto 0);
  signal prev_mode_93_22_reg_i: std_logic_vector((3 - 1) downto 0);
  signal prev_mode_93_22_reg_o: std_logic_vector((3 - 1) downto 0);
  signal cast_69_18: signed((37 - 1) downto 0);
  signal cast_69_22: signed((37 - 1) downto 0);
  signal internal_s_69_5_addsub: signed((37 - 1) downto 0);
  signal internal_s_83_3_convert: signed((18 - 1) downto 0);
begin
  a_17_32 <= std_logic_vector_to_signed(a);
  b_17_35 <= std_logic_vector_to_signed(b);
  op_mem_91_20_back <= op_mem_91_20(0);
  proc_op_mem_91_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_91_20_push_front_pop_back_en = '1')) then
        op_mem_91_20(0) <= op_mem_91_20_front_din;
      end if;
    end if;
  end process proc_op_mem_91_20;
  cout_mem_92_22_back <= cout_mem_92_22(0);
  proc_cout_mem_92_22: process (clk)
  is
    variable i_x_000000: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (cout_mem_92_22_push_front_pop_back_en = '1')) then
        cout_mem_92_22(0) <= cout_mem_92_22_front_din;
      end if;
    end if;
  end process proc_cout_mem_92_22;
  prev_mode_93_22_reg_i <= unsigned_to_std_logic_vector(prev_mode_93_22_next);
  prev_mode_93_22 <= std_logic_vector_to_unsigned(prev_mode_93_22_reg_o);
  prev_mode_93_22_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"010", 
      latency => 1, 
      width => 3)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => prev_mode_93_22_reg_i, 
      o => prev_mode_93_22_reg_o);
  cast_69_18 <= s2s_cast(a_17_32, 28, 37, 28);
  cast_69_22 <= s2s_cast(b_17_35, 10, 37, 28);
  internal_s_69_5_addsub <= cast_69_18 + cast_69_22;
  internal_s_83_3_convert <= std_logic_vector_to_signed(convert_type(signed_to_std_logic_vector(internal_s_69_5_addsub), 37, 28, xlSigned, 18, 10, xlSigned, xlRound, xlSaturate));
  op_mem_91_20_push_front_pop_back_en <= '0';
  cout_mem_92_22_push_front_pop_back_en <= '0';
  prev_mode_93_22_next <= std_logic_vector_to_unsigned("000");
  s <= signed_to_std_logic_vector(internal_s_83_3_convert);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;


entity sysgensynthfse_xldelay is
   generic(width        : integer := -1;
           latency      : integer := -1;
           reg_retiming : integer :=  0;
           reset        : integer :=  0);
   port(d       : in std_logic_vector (width-1 downto 0);
        ce      : in std_logic;
        clk     : in std_logic;
        en      : in std_logic;
        rst     : in std_logic;
        q       : out std_logic_vector (width-1 downto 0));

end sysgensynthfse_xldelay;

architecture behavior of sysgensynthfse_xldelay is
   component synth_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component; -- end component synth_reg

   component synth_reg_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;

   signal internal_ce  : std_logic;

begin
   internal_ce  <= ce and en;

   srl_delay: if ((reg_retiming = 0) and (reset = 0)) or (latency < 1) generate
     synth_reg_srl_inst : synth_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate srl_delay;

   reg_delay: if ((reg_retiming = 1) or (reset = 1)) and (latency >= 1) generate
     synth_reg_reg_inst : synth_reg_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => rst,
         clk => clk,
         o   => q);
   end generate reg_delay;
end architecture behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_delay_061416299d is
  port (
    d : in std_logic_vector((1 - 1) downto 0);
    q : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_delay_061416299d;
architecture behavior of sysgen_delay_061416299d
is
  signal d_1_22: std_logic;
  type array_type_op_mem_20_24 is array (0 to (3 - 1)) of std_logic;
  signal op_mem_20_24: array_type_op_mem_20_24 := (
    '0',
    '0',
    '0');
  signal op_mem_20_24_front_din: std_logic;
  signal op_mem_20_24_back: std_logic;
  signal op_mem_20_24_push_front_pop_back_en: std_logic;
begin
  d_1_22 <= d(0);
  op_mem_20_24_back <= op_mem_20_24(2);
  proc_op_mem_20_24: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_20_24_push_front_pop_back_en = '1')) then
        for i in 2 downto 1 loop 
          op_mem_20_24(i) <= op_mem_20_24(i-1);
        end loop;
        op_mem_20_24(0) <= op_mem_20_24_front_din;
      end if;
    end if;
  end process proc_op_mem_20_24;
  op_mem_20_24_front_din <= d_1_22;
  op_mem_20_24_push_front_pop_back_en <= '1';
  q <= std_logic_to_vector(op_mem_20_24_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_9962b0dfee is
  port (
    ar : in std_logic_vector((12 - 1) downto 0);
    ai : in std_logic_vector((12 - 1) downto 0);
    br : in std_logic_vector((18 - 1) downto 0);
    bi : in std_logic_vector((18 - 1) downto 0);
    pr : out std_logic_vector((36 - 1) downto 0);
    pi : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_9962b0dfee;
architecture behavior of sysgen_mcode_block_9962b0dfee
is
  signal ar_1_34: signed((12 - 1) downto 0);
  signal ai_1_38: signed((12 - 1) downto 0);
  signal br_1_42: signed((18 - 1) downto 0);
  signal bi_1_46: signed((18 - 1) downto 0);
  signal pr0_7_17_next: signed((30 - 1) downto 0);
  signal pr0_7_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr1_8_17_next: signed((30 - 1) downto 0);
  signal pr1_8_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr2_10_17_next: signed((30 - 1) downto 0);
  signal pr2_10_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr3_11_17_next: signed((30 - 1) downto 0);
  signal pr3_11_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr4_13_17_next: signed((30 - 1) downto 0);
  signal pr4_13_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr5_14_17_next: signed((30 - 1) downto 0);
  signal pr5_14_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr6_16_17_next: signed((30 - 1) downto 0);
  signal pr6_16_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr7_17_17_next: signed((30 - 1) downto 0);
  signal pr7_17_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr8_20_17_next: signed((36 - 1) downto 0);
  signal pr8_20_17: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr9_21_17_next: signed((36 - 1) downto 0);
  signal pr9_21_17: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr10_23_18_next: signed((36 - 1) downto 0);
  signal pr10_23_18: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr11_24_18_next: signed((36 - 1) downto 0);
  signal pr11_24_18: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal cast_29_9: signed((31 - 1) downto 0);
  signal cast_29_15: signed((31 - 1) downto 0);
  signal pr8_29_3_addsub: signed((31 - 1) downto 0);
  signal cast_39_10: signed((31 - 1) downto 0);
  signal cast_39_16: signed((31 - 1) downto 0);
  signal pr10_39_3_addsub: signed((31 - 1) downto 0);
  signal pr0_46_1_mult: signed((30 - 1) downto 0);
  signal pr2_49_1_mult: signed((30 - 1) downto 0);
  signal pr4_52_1_mult: signed((30 - 1) downto 0);
  signal pr6_55_1_mult: signed((30 - 1) downto 0);
  signal cast_pr0_7_17_next: signed((30 - 1) downto 0);
  signal cast_pr2_10_17_next: signed((30 - 1) downto 0);
  signal cast_pr4_13_17_next: signed((30 - 1) downto 0);
  signal cast_pr6_16_17_next: signed((30 - 1) downto 0);
  signal cast_pr8_20_17_next: signed((36 - 1) downto 0);
  signal cast_pr10_23_18_next: signed((36 - 1) downto 0);
begin
  ar_1_34 <= std_logic_vector_to_signed(ar);
  ai_1_38 <= std_logic_vector_to_signed(ai);
  br_1_42 <= std_logic_vector_to_signed(br);
  bi_1_46 <= std_logic_vector_to_signed(bi);
  proc_pr0_7_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr0_7_17 <= pr0_7_17_next;
      end if;
    end if;
  end process proc_pr0_7_17;
  proc_pr1_8_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr1_8_17 <= pr1_8_17_next;
      end if;
    end if;
  end process proc_pr1_8_17;
  proc_pr2_10_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr2_10_17 <= pr2_10_17_next;
      end if;
    end if;
  end process proc_pr2_10_17;
  proc_pr3_11_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr3_11_17 <= pr3_11_17_next;
      end if;
    end if;
  end process proc_pr3_11_17;
  proc_pr4_13_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr4_13_17 <= pr4_13_17_next;
      end if;
    end if;
  end process proc_pr4_13_17;
  proc_pr5_14_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr5_14_17 <= pr5_14_17_next;
      end if;
    end if;
  end process proc_pr5_14_17;
  proc_pr6_16_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr6_16_17 <= pr6_16_17_next;
      end if;
    end if;
  end process proc_pr6_16_17;
  proc_pr7_17_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr7_17_17 <= pr7_17_17_next;
      end if;
    end if;
  end process proc_pr7_17_17;
  proc_pr8_20_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr8_20_17 <= pr8_20_17_next;
      end if;
    end if;
  end process proc_pr8_20_17;
  proc_pr9_21_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr9_21_17 <= pr9_21_17_next;
      end if;
    end if;
  end process proc_pr9_21_17;
  proc_pr10_23_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr10_23_18 <= pr10_23_18_next;
      end if;
    end if;
  end process proc_pr10_23_18;
  proc_pr11_24_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr11_24_18 <= pr11_24_18_next;
      end if;
    end if;
  end process proc_pr11_24_18;
  cast_29_9 <= s2s_cast(pr1_8_17, 20, 31, 20);
  cast_29_15 <= s2s_cast(pr3_11_17, 20, 31, 20);
  pr8_29_3_addsub <= cast_29_9 - cast_29_15;
  cast_39_10 <= s2s_cast(pr5_14_17, 20, 31, 20);
  cast_39_16 <= s2s_cast(pr7_17_17, 20, 31, 20);
  pr10_39_3_addsub <= cast_39_10 + cast_39_16;
  pr0_46_1_mult <= (ar_1_34 * br_1_42);
  pr2_49_1_mult <= (ai_1_38 * bi_1_46);
  pr4_52_1_mult <= (ar_1_34 * bi_1_46);
  pr6_55_1_mult <= (ai_1_38 * br_1_42);
  cast_pr0_7_17_next <= s2s_cast(pr0_46_1_mult, 25, 30, 20);
  pr0_7_17_next <= cast_pr0_7_17_next;
  pr1_8_17_next <= pr0_7_17;
  cast_pr2_10_17_next <= s2s_cast(pr2_49_1_mult, 25, 30, 20);
  pr2_10_17_next <= cast_pr2_10_17_next;
  pr3_11_17_next <= pr2_10_17;
  cast_pr4_13_17_next <= s2s_cast(pr4_52_1_mult, 25, 30, 20);
  pr4_13_17_next <= cast_pr4_13_17_next;
  pr5_14_17_next <= pr4_13_17;
  cast_pr6_16_17_next <= s2s_cast(pr6_55_1_mult, 25, 30, 20);
  pr6_16_17_next <= cast_pr6_16_17_next;
  pr7_17_17_next <= pr6_16_17;
  cast_pr8_20_17_next <= s2s_cast(pr8_29_3_addsub, 20, 36, 28);
  pr8_20_17_next <= cast_pr8_20_17_next;
  pr9_21_17_next <= pr8_20_17;
  cast_pr10_23_18_next <= s2s_cast(pr10_39_3_addsub, 20, 36, 28);
  pr10_23_18_next <= cast_pr10_23_18_next;
  pr11_24_18_next <= pr10_23_18;
  pr <= signed_to_std_logic_vector(pr9_21_17);
  pi <= signed_to_std_logic_vector(pr11_24_18);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_ffc377abf7 is
  port (
    ar : in std_logic_vector((12 - 1) downto 0);
    ai : in std_logic_vector((12 - 1) downto 0);
    br : in std_logic_vector((18 - 1) downto 0);
    bi : in std_logic_vector((18 - 1) downto 0);
    pr : out std_logic_vector((36 - 1) downto 0);
    pi : out std_logic_vector((36 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_ffc377abf7;
architecture behavior of sysgen_mcode_block_ffc377abf7
is
  signal ar_1_34: signed((12 - 1) downto 0);
  signal ai_1_38: signed((12 - 1) downto 0);
  signal br_1_42: signed((18 - 1) downto 0);
  signal bi_1_46: signed((18 - 1) downto 0);
  signal pr0_7_17_next: signed((30 - 1) downto 0);
  signal pr0_7_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr1_8_17_next: signed((30 - 1) downto 0);
  signal pr1_8_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr2_10_17_next: signed((30 - 1) downto 0);
  signal pr2_10_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr3_11_17_next: signed((30 - 1) downto 0);
  signal pr3_11_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr4_13_17_next: signed((30 - 1) downto 0);
  signal pr4_13_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr5_14_17_next: signed((30 - 1) downto 0);
  signal pr5_14_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr6_16_17_next: signed((30 - 1) downto 0);
  signal pr6_16_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr7_17_17_next: signed((30 - 1) downto 0);
  signal pr7_17_17: signed((30 - 1) downto 0) := "000000000000000000000000000000";
  signal pr8_20_17_next: signed((36 - 1) downto 0);
  signal pr8_20_17: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr9_21_17_next: signed((36 - 1) downto 0);
  signal pr9_21_17: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr10_23_18_next: signed((36 - 1) downto 0);
  signal pr10_23_18: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal pr11_24_18_next: signed((36 - 1) downto 0);
  signal pr11_24_18: signed((36 - 1) downto 0) := "000000000000000000000000000000000000";
  signal cast_32_9: signed((31 - 1) downto 0);
  signal cast_32_15: signed((31 - 1) downto 0);
  signal pr8_32_3_addsub: signed((31 - 1) downto 0);
  signal cast_42_10: signed((31 - 1) downto 0);
  signal cast_42_16: signed((31 - 1) downto 0);
  signal pr10_42_3_addsub: signed((31 - 1) downto 0);
  signal pr0_46_1_mult: signed((30 - 1) downto 0);
  signal pr2_49_1_mult: signed((30 - 1) downto 0);
  signal pr4_52_1_mult: signed((30 - 1) downto 0);
  signal pr6_55_1_mult: signed((30 - 1) downto 0);
  signal cast_pr8_20_17_next: signed((36 - 1) downto 0);
  signal cast_pr10_23_18_next: signed((36 - 1) downto 0);
begin
  ar_1_34 <= std_logic_vector_to_signed(ar);
  ai_1_38 <= std_logic_vector_to_signed(ai);
  br_1_42 <= std_logic_vector_to_signed(br);
  bi_1_46 <= std_logic_vector_to_signed(bi);
  proc_pr0_7_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr0_7_17 <= pr0_7_17_next;
      end if;
    end if;
  end process proc_pr0_7_17;
  proc_pr1_8_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr1_8_17 <= pr1_8_17_next;
      end if;
    end if;
  end process proc_pr1_8_17;
  proc_pr2_10_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr2_10_17 <= pr2_10_17_next;
      end if;
    end if;
  end process proc_pr2_10_17;
  proc_pr3_11_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr3_11_17 <= pr3_11_17_next;
      end if;
    end if;
  end process proc_pr3_11_17;
  proc_pr4_13_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr4_13_17 <= pr4_13_17_next;
      end if;
    end if;
  end process proc_pr4_13_17;
  proc_pr5_14_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr5_14_17 <= pr5_14_17_next;
      end if;
    end if;
  end process proc_pr5_14_17;
  proc_pr6_16_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr6_16_17 <= pr6_16_17_next;
      end if;
    end if;
  end process proc_pr6_16_17;
  proc_pr7_17_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr7_17_17 <= pr7_17_17_next;
      end if;
    end if;
  end process proc_pr7_17_17;
  proc_pr8_20_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr8_20_17 <= pr8_20_17_next;
      end if;
    end if;
  end process proc_pr8_20_17;
  proc_pr9_21_17: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr9_21_17 <= pr9_21_17_next;
      end if;
    end if;
  end process proc_pr9_21_17;
  proc_pr10_23_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr10_23_18 <= pr10_23_18_next;
      end if;
    end if;
  end process proc_pr10_23_18;
  proc_pr11_24_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        pr11_24_18 <= pr11_24_18_next;
      end if;
    end if;
  end process proc_pr11_24_18;
  cast_32_9 <= s2s_cast(pr1_8_17, 20, 31, 20);
  cast_32_15 <= s2s_cast(pr3_11_17, 20, 31, 20);
  pr8_32_3_addsub <= cast_32_9 + cast_32_15;
  cast_42_10 <= s2s_cast(pr7_17_17, 20, 31, 20);
  cast_42_16 <= s2s_cast(pr5_14_17, 20, 31, 20);
  pr10_42_3_addsub <= cast_42_10 - cast_42_16;
  pr0_46_1_mult <= (ar_1_34 * br_1_42);
  pr2_49_1_mult <= (ai_1_38 * bi_1_46);
  pr4_52_1_mult <= (ar_1_34 * bi_1_46);
  pr6_55_1_mult <= (ai_1_38 * br_1_42);
  pr0_7_17_next <= pr0_46_1_mult;
  pr1_8_17_next <= pr0_7_17;
  pr2_10_17_next <= pr2_49_1_mult;
  pr3_11_17_next <= pr2_10_17;
  pr4_13_17_next <= pr4_52_1_mult;
  pr5_14_17_next <= pr4_13_17;
  pr6_16_17_next <= pr6_55_1_mult;
  pr7_17_17_next <= pr6_16_17;
  cast_pr8_20_17_next <= s2s_cast(pr8_32_3_addsub, 20, 36, 28);
  pr8_20_17_next <= cast_pr8_20_17_next;
  pr9_21_17_next <= pr9_21_17;
  cast_pr10_23_18_next <= s2s_cast(pr10_42_3_addsub, 20, 36, 28);
  pr10_23_18_next <= cast_pr10_23_18_next;
  pr11_24_18_next <= pr11_24_18;
  pr <= signed_to_std_logic_vector(pr8_20_17);
  pi <= signed_to_std_logic_vector(pr10_23_18);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_7ed4b76418 is
  port (
    cnt : out std_logic_vector((2 - 1) downto 0);
    rst : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_7ed4b76418;
architecture behavior of sysgen_mcode_block_7ed4b76418
is
  signal r_2_17_next: unsigned((2 - 1) downto 0);
  signal r_2_17: unsigned((2 - 1) downto 0);
  signal r_2_17_reg_i: std_logic_vector((2 - 1) downto 0);
  signal r_2_17_reg_o: std_logic_vector((2 - 1) downto 0);
  signal cast_9_9: unsigned((3 - 1) downto 0);
  signal r_9_5_addsub: unsigned((3 - 1) downto 0);
  signal rel_12_7: boolean;
  signal rst_join_12_3: boolean;
  signal cast_r_2_17_next: unsigned((2 - 1) downto 0);
begin
  r_2_17_reg_i <= unsigned_to_std_logic_vector(r_2_17_next);
  r_2_17 <= std_logic_vector_to_unsigned(r_2_17_reg_o);
  r_2_17_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"11", 
      latency => 1, 
      width => 2)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => r_2_17_reg_i, 
      o => r_2_17_reg_o);
  cast_9_9 <= u2u_cast(r_2_17, 0, 3, 0);
  r_9_5_addsub <= cast_9_9 + std_logic_vector_to_unsigned("001");
  rel_12_7 <= r_2_17 = std_logic_vector_to_unsigned("00");
  proc_if_12_3: process (rel_12_7)
  is
  begin
    if rel_12_7 then
      rst_join_12_3 <= true;
    else 
      rst_join_12_3 <= false;
    end if;
  end process proc_if_12_3;
  cast_r_2_17_next <= u2u_cast(r_9_5_addsub, 0, 2, 0);
  r_2_17_next <= cast_r_2_17_next;
  cnt <= unsigned_to_std_logic_vector(r_2_17);
  rst <= boolean_to_vector(rst_join_12_3);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_f123d6727c is
  port (
    din : in std_logic_vector((18 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_f123d6727c;
architecture behavior of sysgen_mcode_block_f123d6727c
is
  signal din_1_19: signed((18 - 1) downto 0);
  type array_type_regs_3_18 is array (0 to (4 - 1)) of signed((18 - 1) downto 0);
  signal regs_3_18: array_type_regs_3_18 := (
    "000000000000000000",
    "000000000000000000",
    "000000000000000000",
    "000000000000000000");
  signal regs_3_18_front_din: signed((18 - 1) downto 0);
  signal regs_3_18_back: signed((18 - 1) downto 0);
  signal regs_3_18_push_front_pop_back_en: std_logic;
begin
  din_1_19 <= std_logic_vector_to_signed(din);
  regs_3_18_back <= regs_3_18(3);
  proc_regs_3_18: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (regs_3_18_push_front_pop_back_en = '1')) then
        for i in 3 downto 1 loop 
          regs_3_18(i) <= regs_3_18(i-1);
        end loop;
        regs_3_18(0) <= regs_3_18_front_din;
      end if;
    end if;
  end process proc_regs_3_18;
  regs_3_18_front_din <= din_1_19;
  regs_3_18_push_front_pop_back_en <= '1';
  q <= signed_to_std_logic_vector(regs_3_18_back);
end behavior;

library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity sysgen_mcode_block_c5df6a9ceb is
  port (
    din : in std_logic_vector((18 - 1) downto 0);
    q : out std_logic_vector((18 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end sysgen_mcode_block_c5df6a9ceb;
architecture behavior of sysgen_mcode_block_c5df6a9ceb
is
  signal din_1_19: signed((18 - 1) downto 0);
  signal regs_0_3_18_next: signed((18 - 1) downto 0);
  signal regs_0_3_18: signed((18 - 1) downto 0) := "000000000000000000";
  signal regs_1_3_18_next: signed((18 - 1) downto 0);
  signal regs_1_3_18: signed((18 - 1) downto 0);
  signal regs_1_3_18_reg_i: std_logic_vector((18 - 1) downto 0);
  signal regs_1_3_18_reg_o: std_logic_vector((18 - 1) downto 0);
  signal regs_2_3_18_next: signed((18 - 1) downto 0);
  signal regs_2_3_18: signed((18 - 1) downto 0) := "000000000000000000";
  signal regs_3_3_18_next: signed((18 - 1) downto 0);
  signal regs_3_3_18: signed((18 - 1) downto 0) := "000000000000000000";
begin
  din_1_19 <= std_logic_vector_to_signed(din);
  proc_regs_0_3_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        regs_0_3_18 <= regs_0_3_18_next;
      end if;
    end if;
  end process proc_regs_0_3_18;
  regs_1_3_18_reg_i <= signed_to_std_logic_vector(regs_1_3_18_next);
  regs_1_3_18 <= std_logic_vector_to_signed(regs_1_3_18_reg_o);
  regs_1_3_18_reg_inst: entity work.synth_reg_w_init
    generic map (
      init_index => 2, 
      init_value => b"000000010000000000", 
      latency => 1, 
      width => 18)
    port map (
      ce => ce, 
      clk => clk, 
      clr => clr, 
      i => regs_1_3_18_reg_i, 
      o => regs_1_3_18_reg_o);
  proc_regs_2_3_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        regs_2_3_18 <= regs_2_3_18_next;
      end if;
    end if;
  end process proc_regs_2_3_18;
  proc_regs_3_3_18: process (clk)
  is
  begin
    if (clk'event and (clk = '1')) then
      if (ce = '1') then
        regs_3_3_18 <= regs_3_3_18_next;
      end if;
    end if;
  end process proc_regs_3_3_18;
  regs_0_3_18_next <= din_1_19;
  regs_1_3_18_next <= regs_0_3_18;
  regs_2_3_18_next <= regs_1_3_18;
  regs_3_3_18_next <= regs_2_3_18;
  q <= signed_to_std_logic_vector(regs_3_3_18);
end behavior;

