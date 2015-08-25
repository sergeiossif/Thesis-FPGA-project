-- Generated from Simulink block sysgenSynthFSE/T_2 FSE/Filters/Synth LMS Filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_synth_lms_filter is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    err_i : in std_logic_vector( 18-1 downto 0 );
    err_q : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_4 : in std_logic;
    ce_4 : in std_logic;
    i_out : out std_logic_vector( 36-1 downto 0 );
    q_out : out std_logic_vector( 36-1 downto 0 )
  );
end sysgensynthfse_synth_lms_filter;
architecture structural of sysgensynthfse_synth_lms_filter is 
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal register_q_net : std_logic_vector( 36-1 downto 0 );
  signal complex_mult_w_ngtd_bi_pi_net : std_logic_vector( 36-1 downto 0 );
  signal accumulator1_q_net : std_logic_vector( 36-1 downto 0 );
  signal sreg_q_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal asr_q_net : std_logic_vector( 12-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal up_sample1_q_net : std_logic_vector( 18-1 downto 0 );
  signal up_sample_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal complex_mult_w_ngtd_bi_pr_net : std_logic_vector( 36-1 downto 0 );
  signal asr1_q_net : std_logic_vector( 12-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal counter_cnt_net : std_logic_vector( 2-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 36-1 downto 0 );
  signal complex_mult_pi_net : std_logic_vector( 36-1 downto 0 );
  signal register2_q_net : std_logic_vector( 36-1 downto 0 );
  signal counter_rst_net : std_logic_vector( 1-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal register1_q_net : std_logic_vector( 36-1 downto 0 );
  signal delay_q_net : std_logic_vector( 12-1 downto 0 );
  signal sreg1_q_net : std_logic_vector( 18-1 downto 0 );
  signal complex_mult_pr_net : std_logic_vector( 36-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 12-1 downto 0 );
  signal down_sample_q_net : std_logic_vector( 12-1 downto 0 );
  signal register3_q_net : std_logic_vector( 36-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 12-1 downto 0 );
begin
  i_out <= register2_q_net;
  q_out <= register3_q_net;
  down_sample_q_net <= i_in;
  down_sample1_q_net <= q_in;
  up_sample_q_net <= err_i;
  up_sample1_q_net <= err_q;
  clk_net_x0 <= clk_1;
  ce_net <= ce_1;
  clk_net <= clk_4;
  ce_net_x0 <= ce_4;
  asr : entity xil_defaultlib.sysgen_addrsr_f2a1535cba 
  port map (
    clr => '0',
    d => down_sample_q_net,
    addr => counter_cnt_net,
    clk => clk_net,
    ce => ce_net_x0,
    hw_en => ce_net_x0,
    q => asr_q_net
  );
  asr1 : entity xil_defaultlib.sysgen_addrsr_f2a1535cba 
  port map (
    clr => '0',
    d => down_sample1_q_net,
    addr => counter_cnt_net,
    clk => clk_net,
    ce => ce_net_x0,
    hw_en => ce_net_x0,
    q => asr1_q_net
  );
  accumulator : entity xil_defaultlib.sysgen_accum_ac47251739 
  port map (
    clr => '0',
    b => complex_mult_w_ngtd_bi_pr_net,
    rst => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => accumulator_q_net
  );
  accumulator1 : entity xil_defaultlib.sysgen_accum_ac47251739 
  port map (
    clr => '0',
    b => complex_mult_w_ngtd_bi_pi_net,
    rst => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => accumulator1_q_net
  );
  addsub : entity xil_defaultlib.sysgen_addsub_8a40b637d2 
  port map (
    clr => '0',
    a => register_q_net,
    b => sreg_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sysgen_addsub_8a40b637d2 
  port map (
    clr => '0',
    a => register1_q_net,
    b => sreg1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    s => addsub1_s_net
  );
  delay : entity xil_defaultlib.sysgensynthfse_xldelay 
  generic map (
    latency => 27,
    reg_retiming => 0,
    reset => 0,
    width => 12
  )
  port map (
    en => '1',
    rst => '1',
    d => asr_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.sysgen_delay_061416299d 
  port map (
    clr => '0',
    d => counter_rst_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay1_q_net
  );
  delay4 : entity xil_defaultlib.sysgensynthfse_xldelay 
  generic map (
    latency => 27,
    reg_retiming => 0,
    reset => 0,
    width => 12
  )
  port map (
    en => '1',
    rst => '1',
    d => asr1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay4_q_net
  );
  register_x0 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => complex_mult_pr_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => complex_mult_pi_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => accumulator_q_net,
    en => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => accumulator1_q_net,
    en => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register3_q_net
  );
  complex_mult : entity xil_defaultlib.sysgen_mcode_block_9962b0dfee 
  port map (
    clr => '0',
    ar => delay_q_net,
    ai => delay4_q_net,
    br => up_sample_q_net,
    bi => up_sample1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    pr => complex_mult_pr_net,
    pi => complex_mult_pi_net
  );
  complex_mult_w_ngtd_bi : entity xil_defaultlib.sysgen_mcode_block_ffc377abf7 
  port map (
    clr => '0',
    ar => asr_q_net,
    ai => asr1_q_net,
    br => sreg_q_net,
    bi => sreg1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    pr => complex_mult_w_ngtd_bi_pr_net,
    pi => complex_mult_w_ngtd_bi_pi_net
  );
  counter : entity xil_defaultlib.sysgen_mcode_block_7ed4b76418 
  port map (
    clr => '0',
    clk => clk_net_x0,
    ce => ce_net,
    cnt => counter_cnt_net,
    rst => counter_rst_net
  );
  sreg : entity xil_defaultlib.sysgen_mcode_block_f123d6727c 
  port map (
    clr => '0',
    din => addsub_s_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => sreg_q_net
  );
  sreg1 : entity xil_defaultlib.sysgen_mcode_block_f123d6727c 
  port map (
    clr => '0',
    din => addsub1_s_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => sreg1_q_net
  );
end structural;
-- Generated from Simulink block sysgenSynthFSE/T_2 FSE/Filters/Synth LMS Filter1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_synth_lms_filter1 is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    err_i : in std_logic_vector( 18-1 downto 0 );
    err_q : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_4 : in std_logic;
    ce_4 : in std_logic;
    i_out : out std_logic_vector( 36-1 downto 0 );
    q_out : out std_logic_vector( 36-1 downto 0 );
    gateway_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out1 : out std_logic_vector( 18-1 downto 0 )
  );
end sysgensynthfse_synth_lms_filter1;
architecture structural of sysgensynthfse_synth_lms_filter1 is 
  signal counter_cnt_net : std_logic_vector( 2-1 downto 0 );
  signal accumulator_q_net : std_logic_vector( 36-1 downto 0 );
  signal complex_mult_w_ngtd_bi_pr_net : std_logic_vector( 36-1 downto 0 );
  signal asr_q_net : std_logic_vector( 12-1 downto 0 );
  signal asr1_q_net : std_logic_vector( 12-1 downto 0 );
  signal accumulator1_q_net : std_logic_vector( 36-1 downto 0 );
  signal delay_q_net : std_logic_vector( 12-1 downto 0 );
  signal complex_mult_w_ngtd_bi_pi_net : std_logic_vector( 36-1 downto 0 );
  signal register_q_net : std_logic_vector( 36-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal register1_q_net : std_logic_vector( 36-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
  signal counter_rst_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay4_q_net : std_logic_vector( 12-1 downto 0 );
  signal complex_mult_pi_net : std_logic_vector( 36-1 downto 0 );
  signal complex_mult_pr_net : std_logic_vector( 36-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 18-1 downto 0 );
  signal sreg_q_net : std_logic_vector( 18-1 downto 0 );
  signal register3_q_net : std_logic_vector( 36-1 downto 0 );
  signal register2_q_net : std_logic_vector( 36-1 downto 0 );
  signal sreg1_q_net : std_logic_vector( 18-1 downto 0 );
  signal up_sample_q_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal ce_net_x0 : std_logic;
  signal down_sample3_q_net : std_logic_vector( 12-1 downto 0 );
  signal clk_net : std_logic;
  signal down_sample2_q_net : std_logic_vector( 12-1 downto 0 );
begin
  i_out <= register2_q_net;
  q_out <= register3_q_net;
  down_sample2_q_net <= i_in;
  down_sample3_q_net <= q_in;
  up_sample_q_net <= err_i;
  up_sample1_q_net <= err_q;
  gateway_out <= sreg_q_net;
  gateway_out1 <= sreg1_q_net;
  clk_net_x0 <= clk_1;
  ce_net <= ce_1;
  clk_net <= clk_4;
  ce_net_x0 <= ce_4;
  asr : entity xil_defaultlib.sysgen_addrsr_f2a1535cba 
  port map (
    clr => '0',
    d => down_sample2_q_net,
    addr => counter_cnt_net,
    clk => clk_net,
    ce => ce_net_x0,
    hw_en => ce_net_x0,
    q => asr_q_net
  );
  asr1 : entity xil_defaultlib.sysgen_addrsr_f2a1535cba 
  port map (
    clr => '0',
    d => down_sample3_q_net,
    addr => counter_cnt_net,
    clk => clk_net,
    ce => ce_net_x0,
    hw_en => ce_net_x0,
    q => asr1_q_net
  );
  accumulator : entity xil_defaultlib.sysgen_accum_ac47251739 
  port map (
    clr => '0',
    b => complex_mult_w_ngtd_bi_pr_net,
    rst => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => accumulator_q_net
  );
  accumulator1 : entity xil_defaultlib.sysgen_accum_ac47251739 
  port map (
    clr => '0',
    b => complex_mult_w_ngtd_bi_pi_net,
    rst => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => accumulator1_q_net
  );
  addsub : entity xil_defaultlib.sysgen_addsub_8a40b637d2 
  port map (
    clr => '0',
    a => register_q_net,
    b => sreg_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sysgen_addsub_8a40b637d2 
  port map (
    clr => '0',
    a => register1_q_net,
    b => sreg1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    s => addsub1_s_net
  );
  delay : entity xil_defaultlib.sysgensynthfse_xldelay 
  generic map (
    latency => 27,
    reg_retiming => 0,
    reset => 0,
    width => 12
  )
  port map (
    en => '1',
    rst => '1',
    d => asr_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.sysgen_delay_061416299d 
  port map (
    clr => '0',
    d => counter_rst_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay1_q_net
  );
  delay4 : entity xil_defaultlib.sysgensynthfse_xldelay 
  generic map (
    latency => 27,
    reg_retiming => 0,
    reset => 0,
    width => 12
  )
  port map (
    en => '1',
    rst => '1',
    d => asr1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => delay4_q_net
  );
  register_x0 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => complex_mult_pr_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => complex_mult_pi_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => accumulator_q_net,
    en => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 36,
    init_value => b"000000000000000000000000000000000000"
  )
  port map (
    rst => "0",
    d => accumulator1_q_net,
    en => delay1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => register3_q_net
  );
  complex_mult : entity xil_defaultlib.sysgen_mcode_block_9962b0dfee 
  port map (
    clr => '0',
    ar => delay_q_net,
    ai => delay4_q_net,
    br => up_sample_q_net,
    bi => up_sample1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    pr => complex_mult_pr_net,
    pi => complex_mult_pi_net
  );
  complex_mult_w_ngtd_bi : entity xil_defaultlib.sysgen_mcode_block_ffc377abf7 
  port map (
    clr => '0',
    ar => asr_q_net,
    ai => asr1_q_net,
    br => sreg_q_net,
    bi => sreg1_q_net,
    clk => clk_net_x0,
    ce => ce_net,
    pr => complex_mult_w_ngtd_bi_pr_net,
    pi => complex_mult_w_ngtd_bi_pi_net
  );
  counter : entity xil_defaultlib.sysgen_mcode_block_7ed4b76418 
  port map (
    clr => '0',
    clk => clk_net_x0,
    ce => ce_net,
    cnt => counter_cnt_net,
    rst => counter_rst_net
  );
  sreg : entity xil_defaultlib.sysgen_mcode_block_c5df6a9ceb 
  port map (
    clr => '0',
    din => addsub_s_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => sreg_q_net
  );
  sreg1 : entity xil_defaultlib.sysgen_mcode_block_f123d6727c 
  port map (
    clr => '0',
    din => addsub1_s_net,
    clk => clk_net_x0,
    ce => ce_net,
    q => sreg1_q_net
  );
end structural;
-- Generated from Simulink block sysgenSynthFSE/T_2 FSE/Filters
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_filters is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    err_i : in std_logic_vector( 18-1 downto 0 );
    err_q : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_2 : in std_logic;
    ce_2 : in std_logic;
    clk_4 : in std_logic;
    ce_4 : in std_logic;
    i_out : out std_logic_vector( 18-1 downto 0 );
    q_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out1 : out std_logic_vector( 18-1 downto 0 )
  );
end sysgensynthfse_filters;
architecture structural of sysgensynthfse_filters is 
  signal delay1_q_net : std_logic_vector( 12-1 downto 0 );
  signal addsub1_s_net : std_logic_vector( 18-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 12-1 downto 0 );
  signal down_sample5_q_net : std_logic_vector( 18-1 downto 0 );
  signal register_q_net : std_logic_vector( 12-1 downto 0 );
  signal mcode_mu_e_i_net : std_logic_vector( 18-1 downto 0 );
  signal mcode_mu_e_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net_x1 : std_logic;
  signal sreg1_q_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net : std_logic;
  signal register2_q_net : std_logic_vector( 36-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal register3_q_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal down_sample_q_net : std_logic_vector( 12-1 downto 0 );
  signal down_sample4_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal register2_q_net_x0 : std_logic_vector( 12-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 12-1 downto 0 );
  signal ce_net_x1 : std_logic;
  signal up_sample_q_net : std_logic_vector( 18-1 downto 0 );
  signal up_sample1_q_net : std_logic_vector( 18-1 downto 0 );
  signal register2_q_net_x1 : std_logic_vector( 36-1 downto 0 );
  signal register3_q_net : std_logic_vector( 36-1 downto 0 );
  signal down_sample2_q_net : std_logic_vector( 12-1 downto 0 );
  signal sreg_q_net : std_logic_vector( 18-1 downto 0 );
  signal down_sample3_q_net : std_logic_vector( 12-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 18-1 downto 0 );
begin
  i_out <= down_sample4_q_net;
  q_out <= down_sample5_q_net;
  register_q_net <= i_in;
  register2_q_net_x0 <= q_in;
  mcode_mu_e_i_net <= err_i;
  mcode_mu_e_q_net <= err_q;
  gateway_out <= sreg_q_net;
  gateway_out1 <= sreg1_q_net;
  clk_net_x1 <= clk_1;
  ce_net_x1 <= ce_1;
  clk_net <= clk_2;
  ce_net <= ce_2;
  clk_net_x0 <= clk_4;
  ce_net_x0 <= ce_4;
  synth_lms_filter : entity xil_defaultlib.sysgensynthfse_synth_lms_filter 
  port map (
    i_in => down_sample_q_net,
    q_in => down_sample1_q_net,
    err_i => up_sample_q_net,
    err_q => up_sample1_q_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    clk_4 => clk_net_x0,
    ce_4 => ce_net_x0,
    i_out => register2_q_net,
    q_out => register3_q_net_x0
  );
  synth_lms_filter1 : entity xil_defaultlib.sysgensynthfse_synth_lms_filter1 
  port map (
    i_in => down_sample2_q_net,
    q_in => down_sample3_q_net,
    err_i => up_sample_q_net,
    err_q => up_sample1_q_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x1,
    clk_4 => clk_net_x0,
    ce_4 => ce_net_x0,
    i_out => register2_q_net_x1,
    q_out => register3_q_net,
    gateway_out => sreg_q_net,
    gateway_out1 => sreg1_q_net
  );
  addsub : entity xil_defaultlib.sysgen_addsub_a3bd783a9f 
  port map (
    clr => '0',
    a => register2_q_net,
    b => register2_q_net_x1,
    clk => clk_net_x1,
    ce => ce_net_x1,
    s => addsub_s_net
  );
  addsub1 : entity xil_defaultlib.sysgen_addsub_a3bd783a9f 
  port map (
    clr => '0',
    a => register3_q_net_x0,
    b => register3_q_net,
    clk => clk_net_x1,
    ce => ce_net_x1,
    s => addsub1_s_net
  );
  delay1 : entity xil_defaultlib.sysgen_delay_165894e142 
  port map (
    clr => '0',
    d => register2_q_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.sysgen_delay_165894e142 
  port map (
    clr => '0',
    d => register_q_net,
    clk => clk_net,
    ce => ce_net,
    q => delay2_q_net
  );
  down_sample : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 12,
    ds_ratio => 2,
    latency => 1,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 12
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => delay2_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample_q_net
  );
  down_sample1 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 12,
    ds_ratio => 2,
    latency => 1,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 12
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => delay1_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample1_q_net
  );
  down_sample2 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 12,
    ds_ratio => 2,
    latency => 2,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 12
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample2_q_net
  );
  down_sample3 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 12,
    ds_ratio => 2,
    latency => 2,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 12
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register2_q_net_x0,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample3_q_net
  );
  down_sample4 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 18,
    ds_ratio => 4,
    latency => 1,
    phase => 3,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 18
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => addsub_s_net,
    src_clk => clk_net_x1,
    src_ce => ce_net_x1,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample4_q_net
  );
  down_sample5 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 10,
    d_width => 18,
    ds_ratio => 4,
    latency => 1,
    phase => 3,
    q_arith => xlSigned,
    q_bin_pt => 10,
    q_width => 18
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => addsub1_s_net,
    src_clk => clk_net_x1,
    src_ce => ce_net_x1,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x0,
    q => down_sample5_q_net
  );
  up_sample : entity xil_defaultlib.sysgensynthfse_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 15,
    d_width => 18,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 15,
    q_width => 18
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => mcode_mu_e_i_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net_x1,
    dest_ce => ce_net_x1,
    q => up_sample_q_net
  );
  up_sample1 : entity xil_defaultlib.sysgensynthfse_xlusamp 
  generic map (
    copy_samples => 1,
    d_arith => xlSigned,
    d_bin_pt => 15,
    d_width => 18,
    latency => 0,
    q_arith => xlSigned,
    q_bin_pt => 15,
    q_width => 18
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    d => mcode_mu_e_q_net,
    src_clk => clk_net_x0,
    src_ce => ce_net_x0,
    dest_clk => clk_net_x1,
    dest_ce => ce_net_x1,
    q => up_sample1_q_net
  );
end structural;
-- Generated from Simulink block sysgenSynthFSE/T_2 FSE
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_t_2_fse is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    i_desired : in std_logic_vector( 10-1 downto 0 );
    q_desired : in std_logic_vector( 10-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_2 : in std_logic;
    ce_2 : in std_logic;
    clk_4 : in std_logic;
    ce_4 : in std_logic;
    i_out : out std_logic_vector( 10-1 downto 0 );
    q_out : out std_logic_vector( 10-1 downto 0 );
    dh_i : out std_logic_vector( 18-1 downto 0 );
    dh_q : out std_logic_vector( 18-1 downto 0 );
    e_i : out std_logic_vector( 18-1 downto 0 );
    e_q : out std_logic_vector( 18-1 downto 0 );
    gateway_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out1 : out std_logic_vector( 18-1 downto 0 )
  );
end sysgensynthfse_t_2_fse;
architecture structural of sysgensynthfse_t_2_fse is 
  signal sreg_q_net : std_logic_vector( 18-1 downto 0 );
  signal sreg1_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal register4_q_net : std_logic_vector( 10-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal mcode_mu_e_q_net : std_logic_vector( 18-1 downto 0 );
  signal register_q_net : std_logic_vector( 12-1 downto 0 );
  signal register5_q_net : std_logic_vector( 10-1 downto 0 );
  signal register3_q_net : std_logic_vector( 10-1 downto 0 );
  signal mcode_e_i_net : std_logic_vector( 18-1 downto 0 );
  signal down_sample4_q_net : std_logic_vector( 18-1 downto 0 );
  signal mcode_mu_e_i_net : std_logic_vector( 18-1 downto 0 );
  signal down_sample5_q_net : std_logic_vector( 18-1 downto 0 );
  signal register2_q_net : std_logic_vector( 12-1 downto 0 );
  signal clk_net_x1 : std_logic;
  signal mcode_e_q_net : std_logic_vector( 18-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal ce_net_x1 : std_logic;
  signal register2_q_net_x0 : std_logic_vector( 10-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net_x0 : std_logic;
  signal imap_v_net : std_logic_vector( 10-1 downto 0 );
  signal down_sample1_q_net : std_logic_vector( 10-1 downto 0 );
  signal qmap_v_net : std_logic_vector( 10-1 downto 0 );
  signal down_sample_q_net : std_logic_vector( 10-1 downto 0 );
begin
  i_out <= register2_q_net_x0;
  q_out <= register3_q_net;
  register_q_net <= i_in;
  register2_q_net <= q_in;
  register4_q_net <= i_desired;
  register5_q_net <= q_desired;
  dh_i <= delay2_q_net;
  dh_q <= delay1_q_net;
  e_i <= mcode_e_i_net;
  e_q <= mcode_e_q_net;
  gateway_out <= sreg_q_net;
  gateway_out1 <= sreg1_q_net;
  clk_net_x1 <= clk_1;
  ce_net_x0 <= ce_1;
  clk_net <= clk_2;
  ce_net <= ce_2;
  clk_net_x0 <= clk_4;
  ce_net_x1 <= ce_4;
  filters : entity xil_defaultlib.sysgensynthfse_filters 
  port map (
    i_in => register_q_net,
    q_in => register2_q_net,
    err_i => mcode_mu_e_i_net,
    err_q => mcode_mu_e_q_net,
    clk_1 => clk_net_x1,
    ce_1 => ce_net_x0,
    clk_2 => clk_net,
    ce_2 => ce_net,
    clk_4 => clk_net_x0,
    ce_4 => ce_net_x1,
    i_out => down_sample4_q_net,
    q_out => down_sample5_q_net,
    gateway_out => sreg_q_net,
    gateway_out1 => sreg1_q_net
  );
  delay1 : entity xil_defaultlib.sysgen_delay_ce254631c3 
  port map (
    clr => '0',
    d => down_sample4_q_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => delay1_q_net
  );
  delay2 : entity xil_defaultlib.sysgen_delay_ce254631c3 
  port map (
    clr => '0',
    d => down_sample5_q_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => delay2_q_net
  );
  imap : entity xil_defaultlib.sysgen_mcode_block_9be8e7d538 
  port map (
    clr => '0',
    i => down_sample4_q_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    v => imap_v_net
  );
  mcode : entity xil_defaultlib.sysgen_mcode_block_f5be8d2ed8 
  port map (
    clr => '0',
    sym_i => down_sample_q_net,
    filt_i => delay1_q_net,
    sym_q => down_sample1_q_net,
    filt_q => delay2_q_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    mu_e_i => mcode_mu_e_i_net,
    e_i => mcode_e_i_net,
    e_q => mcode_e_q_net,
    mu_e_q => mcode_mu_e_q_net
  );
  qmap : entity xil_defaultlib.sysgen_mcode_block_9be8e7d538 
  port map (
    clr => '0',
    i => down_sample5_q_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    v => qmap_v_net
  );
  register2 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => imap_v_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => register2_q_net_x0
  );
  register3 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => qmap_v_net,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => register3_q_net
  );
  down_sample1 : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 8,
    d_width => 10,
    ds_ratio => 2,
    latency => 11,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 8,
    q_width => 10
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register5_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x1,
    q => down_sample1_q_net
  );
  down_sample : entity xil_defaultlib.sysgensynthfse_xldsamp 
  generic map (
    d_arith => xlSigned,
    d_bin_pt => 8,
    d_width => 10,
    ds_ratio => 2,
    latency => 11,
    phase => 1,
    q_arith => xlSigned,
    q_bin_pt => 8,
    q_width => 10
  )
  port map (
    src_clr => '0',
    dest_clr => '0',
    en => "1",
    rst => "0",
    d => register4_q_net,
    src_clk => clk_net,
    src_ce => ce_net,
    dest_clk => clk_net_x0,
    dest_ce => ce_net_x1,
    q => down_sample_q_net
  );
end structural;
-- Generated from Simulink block sysgenSynthFSE_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_struct is
  port (
    i_in : in std_logic_vector( 12-1 downto 0 );
    q_in : in std_logic_vector( 12-1 downto 0 );
    i_desired : in std_logic_vector( 10-1 downto 0 );
    q_desired : in std_logic_vector( 10-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    clk_2 : in std_logic;
    ce_2 : in std_logic;
    clk_4 : in std_logic;
    ce_4 : in std_logic;
    i_out : out std_logic_vector( 10-1 downto 0 );
    q_out : out std_logic_vector( 10-1 downto 0 );
    dh_i : out std_logic_vector( 18-1 downto 0 );
    dh_q : out std_logic_vector( 18-1 downto 0 );
    e_i : out std_logic_vector( 18-1 downto 0 );
    e_q : out std_logic_vector( 18-1 downto 0 );
    gateway_out : out std_logic_vector( 18-1 downto 0 );
    gateway_out1 : out std_logic_vector( 18-1 downto 0 )
  );
end sysgensynthfse_struct;
architecture structural of sysgensynthfse_struct is 
  signal clk_net_x1 : std_logic;
  signal register2_q_net_x0 : std_logic_vector( 10-1 downto 0 );
  signal q_desired_net : std_logic_vector( 10-1 downto 0 );
  signal register5_q_net : std_logic_vector( 10-1 downto 0 );
  signal q_in_net : std_logic_vector( 12-1 downto 0 );
  signal ce_net_x0 : std_logic;
  signal ce_net : std_logic;
  signal ce_net_x1 : std_logic;
  signal i_desired_net : std_logic_vector( 10-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 18-1 downto 0 );
  signal mcode_e_q_net : std_logic_vector( 18-1 downto 0 );
  signal sreg_q_net : std_logic_vector( 18-1 downto 0 );
  signal i_in_net : std_logic_vector( 12-1 downto 0 );
  signal register1_q_net : std_logic_vector( 10-1 downto 0 );
  signal mcode_e_i_net : std_logic_vector( 18-1 downto 0 );
  signal register3_q_net : std_logic_vector( 10-1 downto 0 );
  signal clk_net : std_logic;
  signal clk_net_x0 : std_logic;
  signal register3_q_net_x0 : std_logic_vector( 10-1 downto 0 );
  signal register_q_net : std_logic_vector( 12-1 downto 0 );
  signal register2_q_net : std_logic_vector( 12-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 18-1 downto 0 );
  signal sreg1_q_net : std_logic_vector( 18-1 downto 0 );
  signal register4_q_net : std_logic_vector( 10-1 downto 0 );
begin
  i_in_net <= i_in;
  i_out <= register1_q_net;
  q_in_net <= q_in;
  q_out <= register3_q_net;
  i_desired_net <= i_desired;
  q_desired_net <= q_desired;
  dh_i <= delay2_q_net;
  dh_q <= delay1_q_net;
  e_i <= mcode_e_i_net;
  e_q <= mcode_e_q_net;
  gateway_out <= sreg_q_net;
  gateway_out1 <= sreg1_q_net;
  clk_net <= clk_1;
  ce_net_x0 <= ce_1;
  clk_net_x1 <= clk_2;
  ce_net <= ce_2;
  clk_net_x0 <= clk_4;
  ce_net_x1 <= ce_4;
  t_2_fse : entity xil_defaultlib.sysgensynthfse_t_2_fse 
  port map (
    i_in => register_q_net,
    q_in => register2_q_net,
    i_desired => register4_q_net,
    q_desired => register5_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net_x0,
    clk_2 => clk_net_x1,
    ce_2 => ce_net,
    clk_4 => clk_net_x0,
    ce_4 => ce_net_x1,
    i_out => register2_q_net_x0,
    q_out => register3_q_net_x0,
    dh_i => delay2_q_net,
    dh_q => delay1_q_net,
    e_i => mcode_e_i_net,
    e_q => mcode_e_q_net,
    gateway_out => sreg_q_net,
    gateway_out1 => sreg1_q_net
  );
  register_x0 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 12,
    init_value => b"000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => i_in_net,
    clk => clk_net_x1,
    ce => ce_net,
    q => register_q_net
  );
  register1 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => register2_q_net_x0,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => register1_q_net
  );
  register2 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 12,
    init_value => b"000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => q_in_net,
    clk => clk_net_x1,
    ce => ce_net,
    q => register2_q_net
  );
  register3 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => register3_q_net_x0,
    clk => clk_net_x0,
    ce => ce_net_x1,
    q => register3_q_net
  );
  register4 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => i_desired_net,
    clk => clk_net_x1,
    ce => ce_net,
    q => register4_q_net
  );
  register5 : entity xil_defaultlib.sysgensynthfse_xlregister 
  generic map (
    d_width => 10,
    init_value => b"0000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => q_desired_net,
    clk => clk_net_x1,
    ce => ce_net,
    q => register5_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse_default_clock_driver is
  port (
    sysgensynthfse_sysclk : in std_logic;
    sysgensynthfse_sysce : in std_logic;
    sysgensynthfse_sysclr : in std_logic;
    sysgensynthfse_clk1 : out std_logic;
    sysgensynthfse_ce1 : out std_logic;
    sysgensynthfse_clk2 : out std_logic;
    sysgensynthfse_ce2 : out std_logic;
    sysgensynthfse_clk4 : out std_logic;
    sysgensynthfse_ce4 : out std_logic
  );
end sysgensynthfse_default_clock_driver;
architecture structural of sysgensynthfse_default_clock_driver is 
begin
  clockdriver_x1 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => sysgensynthfse_sysclk,
    sysce => sysgensynthfse_sysce,
    sysclr => sysgensynthfse_sysclr,
    clk => sysgensynthfse_clk1,
    ce => sysgensynthfse_ce1
  );
  clockdriver_x0 : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 2,
    log_2_period => 2
  )
  port map (
    sysclk => sysgensynthfse_sysclk,
    sysce => sysgensynthfse_sysce,
    sysclr => sysgensynthfse_sysclr,
    clk => sysgensynthfse_clk2,
    ce => sysgensynthfse_ce2
  );
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 4,
    log_2_period => 3
  )
  port map (
    sysclk => sysgensynthfse_sysclk,
    sysce => sysgensynthfse_sysce,
    sysclr => sysgensynthfse_sysclr,
    clk => sysgensynthfse_clk4,
    ce => sysgensynthfse_ce4
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity sysgensynthfse is
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
end sysgensynthfse;
architecture structural of sysgensynthfse is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "sysgensynthfse,sysgen_core_2015_1,{,compilation=HDL Netlist,block_icon_display=Pipeline stages,family=artix7,part=xc7a100t,speed=-1,package=csg324,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=1,interface_doc=1,ce_clr=1,clock_period=10,system_simulink_period=1,waveform_viewer=1,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=1780,accum=4,addrsr=4,addsub=6,delay=10,dsamp=8,mcode=13,register=16,usamp=2,}";
  signal ce_4_net : std_logic;
  signal clk_4_net : std_logic;
  signal clk_2_net : std_logic;
  signal ce_2_net : std_logic;
  signal ce_1_net : std_logic;
  signal clk_1_net : std_logic;
begin
  sysgensynthfse_default_clock_driver : entity xil_defaultlib.sysgensynthfse_default_clock_driver 
  port map (
    sysgensynthfse_sysclk => clk,
    sysgensynthfse_sysce => '1',
    sysgensynthfse_sysclr => clr,
    sysgensynthfse_clk1 => clk_1_net,
    sysgensynthfse_ce1 => ce_1_net,
    sysgensynthfse_clk2 => clk_2_net,
    sysgensynthfse_ce2 => ce_2_net,
    sysgensynthfse_clk4 => clk_4_net,
    sysgensynthfse_ce4 => ce_4_net
  );
  sysgensynthfse_struct : entity xil_defaultlib.sysgensynthfse_struct 
  port map (
    i_in => i_in,
    q_in => q_in,
    i_desired => i_desired,
    q_desired => q_desired,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    clk_2 => clk_2_net,
    ce_2 => ce_2_net,
    clk_4 => clk_4_net,
    ce_4 => ce_4_net,
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
