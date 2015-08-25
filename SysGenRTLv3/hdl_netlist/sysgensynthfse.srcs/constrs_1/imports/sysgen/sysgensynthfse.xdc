set rateCesysgensynthfse2 sysgensynthfse_default_clock_driver/clockdriver_x0/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellssysgensynthfse2 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCesysgensynthfse2/Q]] IS_ENABLE]]
set rateCesysgensynthfse4 sysgensynthfse_default_clock_driver/clockdriver/pipelined_ce.ce_pipeline[1].ce_reg/latency_gt_0.fd_array[1].reg_comp/fd_prim_array[0].bit_is_0.fdre_comp
set rateCellssysgensynthfse4 [get_cells -of [filter [all_fanout -flat -endpoints [get_pins $rateCesysgensynthfse4/Q]] IS_ENABLE]]
set_multicycle_path -from $rateCellssysgensynthfse2 -to $rateCellssysgensynthfse2 -setup 2
set_multicycle_path -from $rateCellssysgensynthfse2 -to $rateCellssysgensynthfse2 -hold 1
set_multicycle_path -from $rateCellssysgensynthfse2 -to $rateCellssysgensynthfse4 -setup 2
set_multicycle_path -from $rateCellssysgensynthfse2 -to $rateCellssysgensynthfse4 -hold 1
set_multicycle_path -from $rateCellssysgensynthfse4 -to $rateCellssysgensynthfse2 -setup 2
set_multicycle_path -from $rateCellssysgensynthfse4 -to $rateCellssysgensynthfse2 -hold 1
set_multicycle_path -from $rateCellssysgensynthfse4 -to $rateCellssysgensynthfse4 -setup 4
set_multicycle_path -from $rateCellssysgensynthfse4 -to $rateCellssysgensynthfse4 -hold 3
