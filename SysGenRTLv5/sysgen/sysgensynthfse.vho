  sysgen_dut : entity xil_defaultlib.sysgensynthfse 
  port map (
    i_desired => i_desired,
    i_in => i_in,
    q_desired => q_desired,
    q_in => q_in,
    clk => clk,
    clr => clr,
    i_out => i_out,
    q_out => q_out,
    dh_i => dh_i,
    dh_q => dh_q,
    e_i => e_i,
    e_q => e_q,
    coeff_i => coeff_i,
    coeff_q => coeff_q
  );
