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
