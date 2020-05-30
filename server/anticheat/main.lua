
local blacklisted = {
    [GetHashKey("hydra")] = true, -- Le true sert à rien
    [GetHashKey("cerberus2")] = true,
    [GetHashKey("cerberus")] = true,
    [GetHashKey("cutter")] = true,
    [GetHashKey("dump")] = true,
    [GetHashKey("apc")] = true,
    [GetHashKey("halftrack")] = true,
    [GetHashKey("khanjali")] = true,
    [GetHashKey("minitank")] = true,
    [GetHashKey("rhino")] = true,
    [GetHashKey("scarab")] = true,
    [GetHashKey("scarab2")] = true,
    [GetHashKey("scarab3")] = true,
    [GetHashKey("thruster")] = true,
    [GetHashKey("trailersmall2")] = true,
    [GetHashKey("oppressor")] = true,
    [GetHashKey("oppressor2")] = true,
    [GetHashKey("blazer5")] = true,
    [GetHashKey("dune2")] = true,
    [GetHashKey("dune3")] = true,
    [GetHashKey("dune4")] = true,
    [GetHashKey("dune5")] = true,
    [GetHashKey("insurgent")] = true,
    [GetHashKey("insurgent3")] = true,
    [GetHashKey("menacer")] = true,
    [GetHashKey("technical")] = true,
    [GetHashKey("technical2")] = true,
    [GetHashKey("technical3")] = true,
    [GetHashKey("cargoplane")] = true,
    [GetHashKey("strikeforce")] = true,
    [GetHashKey("titan")] = true,
    [GetHashKey("volatol")] = true,
    [GetHashKey("freight")] = true,
    [GetHashKey("freightcar")] = true,
    [GetHashKey("freightcont1")] = true,
    [GetHashKey("freightcont2")] = true,
    [GetHashKey("freightgrain")] = true,
    [GetHashKey("metrotrain")] = true,
    [GetHashKey("tankercar")] = true,
    [GetHashKey("blimp2")] = true,
    -- prosp
    [GetHashKey("xs_prop_hamburgher_wl")] = true,
    [GetHashKey("stt_prop_stunt_track_dwslope30")] = true,
    [GetHashKey("prop_streetlight_01")] = true,
    [GetHashKey("stt_prop_stunt_track_dwslope30")] = true,
    [GetHashKey("sr_prop_spec_tube_crn_05a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_30d_05a")] = true,
	[GetHashKey("sr_prop_spec_tube_l_05a")] = true,
	[GetHashKey("sr_prop_spec_tube_m_05a")] = true,
	[GetHashKey("sr_prop_spec_tube_xxs_05a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_15d_05a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_5d_05a")] = true,
	[GetHashKey("sr_prop_stunt_tube_xs_05a")] = true,
	[GetHashKey("sr_prop_special_bblock_lrg11")] = true,
	[GetHashKey("sr_prop_special_bblock_lrg2")] = true,
	[GetHashKey("sr_prop_special_bblock_lrg3")] = true,
	[GetHashKey("sr_prop_special_bblock_mdm1")] = true,
	[GetHashKey("sr_prop_special_bblock_mdm2")] = true,
	[GetHashKey("sr_prop_special_bblock_mdm3")] = true,
	[GetHashKey("sr_prop_special_bblock_sml1")] = true,
	[GetHashKey("sr_prop_special_bblock_sml2")] = true,
	[GetHashKey("sr_prop_special_bblock_sml3")] = true,
	[GetHashKey("sr_prop_special_bblock_xl1")] = true,
	[GetHashKey("sr_prop_special_bblock_xl2")] = true,
	[GetHashKey("sr_prop_special_bblock_xl3")] = true,
	[GetHashKey("sr_prop_special_bblock_xl3_fixed")] = true,
	[GetHashKey("sr_prop_sr_target_1_01a")] = true,
	[GetHashKey("sr_prop_sr_target_2_04a")] = true,
	[GetHashKey("sr_prop_sr_target_3_03a")] = true,
	[GetHashKey("sr_prop_sr_target_5_01a")] = true,
	[GetHashKey("sr_prop_sr_target_large_01a")] = true,
	[GetHashKey("sr_prop_sr_target_long_01a")] = true,
	[GetHashKey("sr_prop_sr_target_small_01a")] = true,
	[GetHashKey("sr_prop_sr_target_small_02a")] = true,
	[GetHashKey("sr_prop_sr_target_small_03a")] = true,
	[GetHashKey("sr_prop_sr_target_small_04a")] = true,
	[GetHashKey("sr_prop_sr_target_small_05a")] = true,
	[GetHashKey("sr_prop_sr_target_small_06a")] = true,
	[GetHashKey("sr_prop_sr_target_small_07a")] = true,
	[GetHashKey("sr_prop_sr_target_trap_01a")] = true,
	[GetHashKey("sr_prop_sr_target_trap_02a")] = true,
	[GetHashKey("sr_prop_sr_track_block_01")] = true,
	[GetHashKey("sr_prop_sr_track_wall")] = true,
	[GetHashKey("sr_prop_sr_tube_end")] = true,
	[GetHashKey("sr_prop_sr_tube_wall")] = true,
	[GetHashKey("sr_prop_spec_target_b_01a")] = true,
	[GetHashKey("sr_prop_spec_target_m_01a")] = true,
	[GetHashKey("sr_prop_spec_target_s_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_refill")] = true,
	[GetHashKey("sr_prop_track_refill")] = true,
	[GetHashKey("sr_prop_track_refill_t1")] = true,
	[GetHashKey("sr_prop_track_refill_t2")] = true,
	[GetHashKey("sr_mp_spec_races_ammu_sign")] = true,
	[GetHashKey("sr_mp_spec_races_blimp_sign")] = true,
	[GetHashKey("sr_mp_spec_races_ron_sign")] = true,
	[GetHashKey("sr_mp_spec_races_xero_sign")] = true,
	[GetHashKey("sr_prop_sr_start_line_02")] = true,
	[GetHashKey("sr_prop_track_straight_l_d15")] = true,
	[GetHashKey("sr_prop_track_straight_l_d30")] = true,
	[GetHashKey("sr_prop_track_straight_l_d45")] = true,
	[GetHashKey("sr_prop_track_straight_l_d5")] = true,
	[GetHashKey("sr_prop_track_straight_l_u15")] = true,
	[GetHashKey("sr_prop_track_straight_l_u30")] = true,
	[GetHashKey("sr_prop_track_straight_l_u45")] = true,
	[GetHashKey("sr_prop_track_straight_l_u5")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_30d_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_l_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_m_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_s_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_xxs_01a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_15d_01a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_5d_01a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn2_01a")] = true,
	[GetHashKey("sr_prop_stunt_tube_xs_01a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_30d_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_l_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_m_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_s_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_xxs_03a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_15d_03a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_5d_03a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn2_03a")] = true,
	[GetHashKey("sr_prop_stunt_tube_xs_03a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_30d_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_l_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_m_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_s_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_xxs_02a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_15d_02a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_5d_02a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn2_02a")] = true,
	[GetHashKey("sr_prop_stunt_tube_xs_02a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_04a")] = true,
	[GetHashKey("sr_prop_spec_tube_crn_30d_04a")] = true,
	[GetHashKey("sr_prop_spec_tube_l_04a")] = true,
	[GetHashKey("sr_prop_spec_tube_m_04a")] = true,
	[GetHashKey("sr_prop_spec_tube_s_04a")] = true,
	[GetHashKey("sr_prop_spec_tube_xxs_04a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_15d_04a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn_5d_04a")] = true,
	[GetHashKey("sr_prop_stunt_tube_crn2_04a")] = true,
	[GetHashKey("sr_prop_stunt_tube_xs_04a")] = true,
	[GetHashKey("stt_prop_race_tannoy")] = true,
	[GetHashKey("stt_prop_speakerstack_01a")] = true,
	[GetHashKey("stt_prop_flagpole_1c")] = true,
	[GetHashKey("stt_prop_flagpole_1e")] = true,
	[GetHashKey("stt_prop_flagpole_1d")] = true,
	[GetHashKey("stt_prop_flagpole_1f")] = true,
	[GetHashKey("stt_prop_flagpole_1a")] = true,
	[GetHashKey("stt_prop_flagpole_1b")] = true,
	[GetHashKey("stt_prop_flagpole_2a")] = true,
	[GetHashKey("stt_prop_flagpole_2b")] = true,
	[GetHashKey("stt_prop_flagpole_2c")] = true,
	[GetHashKey("stt_prop_flagpole_2d")] = true,
	[GetHashKey("stt_prop_flagpole_2e")] = true,
	[GetHashKey("stt_prop_flagpole_2f")] = true,
	[GetHashKey("stt_prop_corner_sign_01")] = true,
	[GetHashKey("stt_prop_corner_sign_02")] = true,
	[GetHashKey("stt_prop_corner_sign_03")] = true,
	[GetHashKey("stt_prop_corner_sign_04")] = true,
	[GetHashKey("stt_prop_corner_sign_05")] = true,
	[GetHashKey("stt_prop_corner_sign_06")] = true,
	[GetHashKey("stt_prop_corner_sign_07")] = true,
	[GetHashKey("stt_prop_corner_sign_08")] = true,
	[GetHashKey("stt_prop_corner_sign_09")] = true,
	[GetHashKey("stt_prop_corner_sign_10")] = true,
	[GetHashKey("stt_prop_corner_sign_11")] = true,
	[GetHashKey("stt_prop_corner_sign_12")] = true,
	[GetHashKey("stt_prop_corner_sign_13")] = true,
	[GetHashKey("stt_prop_corner_sign_14")] = true,
	[GetHashKey("stt_prop_hoop_constraction_01a")] = true,
	[GetHashKey("stt_prop_hoop_small_01")] = true,
	[GetHashKey("stt_prop_hoop_tyre_01a")] = true,
	[GetHashKey("stt_prop_race_gantry_01")] = true,
	[GetHashKey("stt_prop_race_start_line_01")] = true,
	[GetHashKey("stt_prop_race_start_line_01b")] = true,
	[GetHashKey("stt_prop_race_start_line_02")] = true,
	[GetHashKey("stt_prop_race_start_line_02b")] = true,
	[GetHashKey("stt_prop_race_start_line_03")] = true,
	[GetHashKey("stt_prop_race_start_line_03b")] = true,
	[GetHashKey("stt_prop_ramp_adj_flip_m")] = true,
	[GetHashKey("stt_prop_ramp_adj_flip_mb")] = true,
	[GetHashKey("stt_prop_ramp_adj_flip_s")] = true,
	[GetHashKey("stt_prop_ramp_adj_flip_sb")] = true,
	[GetHashKey("stt_prop_ramp_adj_hloop")] = true,
	[GetHashKey("stt_prop_ramp_adj_loop")] = true,
	[GetHashKey("stt_prop_ramp_jump_l")] = true,
	[GetHashKey("stt_prop_ramp_jump_m")] = true,
	[GetHashKey("stt_prop_ramp_jump_s")] = true,
	[GetHashKey("stt_prop_ramp_jump_xl")] = true,
	[GetHashKey("stt_prop_ramp_jump_xs")] = true,
	[GetHashKey("stt_prop_ramp_jump_xxl")] = true,
	[GetHashKey("stt_prop_ramp_multi_loop_rb")] = true,
	[GetHashKey("stt_prop_ramp_spiral_l")] = true,
	[GetHashKey("stt_prop_ramp_spiral_l_l")] = true,
	[GetHashKey("stt_prop_ramp_spiral_l_m")] = true,
	[GetHashKey("stt_prop_ramp_spiral_l_s")] = true,
	[GetHashKey("stt_prop_ramp_spiral_l_xxl")] = true,
	[GetHashKey("stt_prop_ramp_spiral_m")] = true,
	[GetHashKey("stt_prop_ramp_spiral_s")] = true,
	[GetHashKey("stt_prop_ramp_spiral_xxl")] = true,
	[GetHashKey("stt_prop_sign_circuit_01")] = true,
	[GetHashKey("stt_prop_sign_circuit_02")] = true,
	[GetHashKey("stt_prop_sign_circuit_03")] = true,
	[GetHashKey("stt_prop_sign_circuit_04")] = true,
	[GetHashKey("stt_prop_sign_circuit_05")] = true,
	[GetHashKey("stt_prop_sign_circuit_06")] = true,
	[GetHashKey("stt_prop_sign_circuit_07")] = true,
	[GetHashKey("stt_prop_sign_circuit_08")] = true,
	[GetHashKey("stt_prop_sign_circuit_09")] = true,
	[GetHashKey("stt_prop_sign_circuit_10")] = true,
	[GetHashKey("stt_prop_sign_circuit_11")] = true,
	[GetHashKey("stt_prop_sign_circuit_11b")] = true,
	[GetHashKey("stt_prop_sign_circuit_12")] = true,
	[GetHashKey("stt_prop_sign_circuit_13")] = true,
	[GetHashKey("stt_prop_sign_circuit_13b")] = true,
	[GetHashKey("stt_prop_sign_circuit_14")] = true,
	[GetHashKey("stt_prop_sign_circuit_14b")] = true,
	[GetHashKey("stt_prop_sign_circuit_15")] = true,
	[GetHashKey("stt_prop_slow_down")] = true,
	[GetHashKey("stt_prop_startline_gantry")] = true,
	[GetHashKey("stt_prop_stunt_bblock_huge_01")] = true,
	[GetHashKey("stt_prop_stunt_bblock_huge_02")] = true,
	[GetHashKey("stt_prop_stunt_bblock_huge_03")] = true,
	[GetHashKey("stt_prop_stunt_bblock_huge_04")] = true,
	[GetHashKey("stt_prop_stunt_bblock_huge_05")] = true,
	[GetHashKey("stt_prop_stunt_bblock_hump_01")] = true,
	[GetHashKey("stt_prop_stunt_bblock_hump_02")] = true,
	[GetHashKey("stt_prop_stunt_bblock_lrg1")] = true,
	[GetHashKey("stt_prop_stunt_bblock_lrg2")] = true,
	[GetHashKey("stt_prop_stunt_bblock_lrg3")] = true,
	[GetHashKey("stt_prop_stunt_bblock_mdm1")] = true,
	[GetHashKey("stt_prop_stunt_bblock_mdm2")] = true,
	[GetHashKey("stt_prop_stunt_bblock_mdm3")] = true,
	[GetHashKey("stt_prop_stunt_bblock_qp")] = true,
	[GetHashKey("stt_prop_stunt_bblock_qp2")] = true,
	[GetHashKey("stt_prop_stunt_bblock_qp3")] = true,
	[GetHashKey("stt_prop_stunt_bblock_sml1")] = true,
	[GetHashKey("stt_prop_stunt_bblock_sml2")] = true,
	[GetHashKey("stt_prop_stunt_bblock_sml3")] = true,
	[GetHashKey("stt_prop_stunt_bblock_xl1")] = true,
	[GetHashKey("stt_prop_stunt_bblock_xl2")] = true,
	[GetHashKey("stt_prop_stunt_bblock_xl3")] = true,
	[GetHashKey("stt_prop_stunt_bowling_ball")] = true,
	[GetHashKey("stt_prop_stunt_bowling_pin")] = true,
	[GetHashKey("stt_prop_stunt_bowlpin_stand")] = true,
	[GetHashKey("stt_prop_stunt_domino")] = true,
	[GetHashKey("stt_prop_stunt_jump15")] = true,
	[GetHashKey("stt_prop_stunt_jump30")] = true,
	[GetHashKey("stt_prop_stunt_jump45")] = true,
	[GetHashKey("stt_prop_stunt_jump_l")] = true,
	[GetHashKey("stt_prop_stunt_jump_lb")] = true,
	[GetHashKey("stt_prop_stunt_jump_loop")] = true,
	[GetHashKey("stt_prop_stunt_jump_m")] = true,
	[GetHashKey("stt_prop_stunt_jump_mb")] = true,
	[GetHashKey("stt_prop_stunt_jump_s")] = true,
	[GetHashKey("stt_prop_stunt_jump_sb")] = true,
	[GetHashKey("stt_prop_stunt_landing_zone_01")] = true,
	[GetHashKey("stt_prop_stunt_ramp")] = true,
	[GetHashKey("stt_prop_stunt_soccer_ball")] = true,
	[GetHashKey("stt_prop_stunt_soccer_goal")] = true,
	[GetHashKey("stt_prop_stunt_soccer_lball")] = true,
	[GetHashKey("stt_prop_stunt_soccer_sball")] = true,
	[GetHashKey("stt_prop_stunt_target")] = true,
	[GetHashKey("stt_prop_stunt_target_small")] = true,
	[GetHashKey("stt_prop_stunt_track_bumps")] = true,
	[GetHashKey("stt_prop_stunt_track_cutout")] = true,
	[GetHashKey("stt_prop_stunt_track_dwlink")] = true,
	[GetHashKey("stt_prop_stunt_track_dwlink_02")] = true,
	[GetHashKey("stt_prop_stunt_track_dwsh15")] = true,
	[GetHashKey("stt_prop_stunt_track_dwshort")] = true,
	[GetHashKey("stt_prop_stunt_track_dwslope15")] = true,
	[GetHashKey("stt_prop_stunt_track_dwslope30")] = true,
	[GetHashKey("stt_prop_stunt_track_dwslope45")] = true,
	[GetHashKey("stt_prop_stunt_track_dwturn")] = true,
	[GetHashKey("stt_prop_stunt_track_dwuturn")] = true,
	[GetHashKey("stt_prop_stunt_track_exshort")] = true,
	[GetHashKey("stt_prop_stunt_track_fork")] = true,
	[GetHashKey("stt_prop_stunt_track_funlng")] = true,
	[GetHashKey("stt_prop_stunt_track_funnel")] = true,
	[GetHashKey("stt_prop_stunt_track_hill")] = true,
	[GetHashKey("stt_prop_stunt_track_hill2")] = true,
	[GetHashKey("stt_prop_stunt_track_jump")] = true,
	[GetHashKey("stt_prop_stunt_track_link")] = true,
	[GetHashKey("stt_prop_stunt_track_otake")] = true,
	[GetHashKey("stt_prop_stunt_track_sh15")] = true,
	[GetHashKey("stt_prop_stunt_track_sh30")] = true,
	[GetHashKey("stt_prop_stunt_track_sh45")] = true,
	[GetHashKey("stt_prop_stunt_track_sh45_a")] = true,
	[GetHashKey("stt_prop_stunt_track_short")] = true,
	[GetHashKey("stt_prop_stunt_track_slope15")] = true,
	[GetHashKey("stt_prop_stunt_track_slope30")] = true,
	[GetHashKey("stt_prop_stunt_track_slope45")] = true,
	[GetHashKey("stt_prop_stunt_track_start")] = true,
	[GetHashKey("stt_prop_stunt_track_start_02")] = true,
	[GetHashKey("stt_prop_stunt_track_straight")] = true,
	[GetHashKey("stt_prop_stunt_track_straightice")] = true,
	[GetHashKey("stt_prop_stunt_track_st_01")] = true,
	[GetHashKey("stt_prop_stunt_track_st_02")] = true,
	[GetHashKey("stt_prop_stunt_track_turn")] = true,
	[GetHashKey("stt_prop_stunt_track_turnice")] = true,
	[GetHashKey("stt_prop_stunt_track_uturn")] = true,
	[GetHashKey("stt_prop_stunt_tube_crn")] = true,
	[GetHashKey("stt_prop_stunt_tube_crn2")] = true,
	[GetHashKey("stt_prop_stunt_tube_crn_15d")] = true,
	[GetHashKey("stt_prop_stunt_tube_crn_30d")] = true,
	[GetHashKey("stt_prop_stunt_tube_crn_5d")] = true,
	[GetHashKey("stt_prop_stunt_tube_cross")] = true,
	[GetHashKey("stt_prop_stunt_tube_end")] = true,
	[GetHashKey("stt_prop_stunt_tube_ent")] = true,
	[GetHashKey("stt_prop_stunt_tube_fn_01")] = true,
	[GetHashKey("stt_prop_stunt_tube_fn_02")] = true,
	[GetHashKey("stt_prop_stunt_tube_fn_03")] = true,
	[GetHashKey("stt_prop_stunt_tube_fn_04")] = true,
	[GetHashKey("stt_prop_stunt_tube_fn_05")] = true,
	[GetHashKey("stt_prop_stunt_tube_fork")] = true,
	[GetHashKey("stt_prop_stunt_tube_gap_01")] = true,
	[GetHashKey("stt_prop_stunt_tube_gap_02")] = true,
	[GetHashKey("stt_prop_stunt_tube_gap_03")] = true,
	[GetHashKey("stt_prop_stunt_tube_hg")] = true,
	[GetHashKey("stt_prop_stunt_tube_jmp")] = true,
	[GetHashKey("stt_prop_stunt_tube_jmp2")] = true,
	[GetHashKey("stt_prop_stunt_tube_l")] = true,
	[GetHashKey("stt_prop_stunt_tube_m")] = true,
	[GetHashKey("stt_prop_stunt_tube_qg")] = true,
	[GetHashKey("stt_prop_stunt_tube_s")] = true,
	[GetHashKey("stt_prop_stunt_tube_speed")] = true,
	[GetHashKey("stt_prop_stunt_tube_speeda")] = true,
	[GetHashKey("stt_prop_stunt_tube_speedb")] = true,
	[GetHashKey("stt_prop_stunt_tube_xs")] = true,
	[GetHashKey("stt_prop_stunt_tube_xxs")] = true,
	[GetHashKey("stt_prop_stunt_wideramp")] = true,
	[GetHashKey("stt_prop_track_bend2_bar_l")] = true,
	[GetHashKey("stt_prop_track_bend2_bar_l_b")] = true,
	[GetHashKey("stt_prop_track_bend2_l")] = true,
	[GetHashKey("stt_prop_track_bend2_l_b")] = true,
	[GetHashKey("stt_prop_track_bend_15d")] = true,
	[GetHashKey("stt_prop_track_bend_15d_bar")] = true,
	[GetHashKey("stt_prop_track_bend_180d")] = true,
	[GetHashKey("stt_prop_track_bend_180d_bar")] = true,
	[GetHashKey("stt_prop_track_bend_30d")] = true,
	[GetHashKey("stt_prop_track_bend_30d_bar")] = true,
	[GetHashKey("stt_prop_track_bend_5d")] = true,
	[GetHashKey("stt_prop_track_bend_5d_bar")] = true,
	[GetHashKey("stt_prop_track_bend_bar_l")] = true,
	[GetHashKey("stt_prop_track_bend_bar_l_b")] = true,
	[GetHashKey("stt_prop_track_bend_bar_m")] = true,
	[GetHashKey("stt_prop_track_bend_l")] = true,
	[GetHashKey("stt_prop_track_bend_l_b")] = true,
	[GetHashKey("stt_prop_track_bend_m")] = true,
	[GetHashKey("stt_prop_track_block_01")] = true,
	[GetHashKey("stt_prop_track_block_02")] = true,
	[GetHashKey("stt_prop_track_block_03")] = true,
	[GetHashKey("stt_prop_track_chicane_l")] = true,
	[GetHashKey("stt_prop_track_chicane_l_02")] = true,
	[GetHashKey("stt_prop_track_chicane_r")] = true,
	[GetHashKey("stt_prop_track_chicane_r_02")] = true,
	[GetHashKey("stt_prop_track_cross")] = true,
	[GetHashKey("stt_prop_track_cross_bar")] = true,
	[GetHashKey("stt_prop_track_fork")] = true,
	[GetHashKey("stt_prop_track_fork_bar")] = true,
	[GetHashKey("stt_prop_track_funnel")] = true,
	[GetHashKey("stt_prop_track_funnel_ads_01a")] = true,
	[GetHashKey("stt_prop_track_funnel_ads_01b")] = true,
	[GetHashKey("stt_prop_track_funnel_ads_01c")] = true,
	[GetHashKey("stt_prop_track_jump_01a")] = true,
	[GetHashKey("stt_prop_track_jump_01b")] = true,
	[GetHashKey("stt_prop_track_jump_01c")] = true,
	[GetHashKey("stt_prop_track_jump_02a")] = true,
	[GetHashKey("stt_prop_track_jump_02b")] = true,
	[GetHashKey("stt_prop_track_jump_02c")] = true,
	[GetHashKey("stt_prop_track_link")] = true,
	[GetHashKey("stt_prop_track_slowdown")] = true,
	[GetHashKey("stt_prop_track_slowdown_t1")] = true,
	[GetHashKey("stt_prop_track_slowdown_t2")] = true,
	[GetHashKey("stt_prop_track_speedup")] = true,
	[GetHashKey("stt_prop_track_speedup_t1")] = true,
	[GetHashKey("stt_prop_track_speedup_t2")] = true,
	[GetHashKey("stt_prop_track_start")] = true,
	[GetHashKey("stt_prop_track_start_02")] = true,
	[GetHashKey("stt_prop_track_stop_sign")] = true,
	[GetHashKey("stt_prop_track_straight_bar_l")] = true,
	[GetHashKey("stt_prop_track_straight_bar_m")] = true,
	[GetHashKey("stt_prop_track_straight_bar_s")] = true,
	[GetHashKey("stt_prop_track_straight_l")] = true,
	[GetHashKey("stt_prop_track_straight_lm")] = true,
	[GetHashKey("stt_prop_track_straight_lm_bar")] = true,
	[GetHashKey("stt_prop_track_straight_m")] = true,
	[GetHashKey("stt_prop_track_straight_s")] = true,
	[GetHashKey("stt_prop_track_tube_01")] = true,
	[GetHashKey("stt_prop_track_tube_02")] = true,
	[GetHashKey("stt_prop_tyre_wall_01")] = true,
	[GetHashKey("stt_prop_tyre_wall_010")] = true,
	[GetHashKey("stt_prop_tyre_wall_011")] = true,
	[GetHashKey("stt_prop_tyre_wall_012")] = true,
	[GetHashKey("stt_prop_tyre_wall_013")] = true,
	[GetHashKey("stt_prop_tyre_wall_014")] = true,
	[GetHashKey("stt_prop_tyre_wall_015")] = true,
	[GetHashKey("stt_prop_tyre_wall_02")] = true,
	[GetHashKey("stt_prop_tyre_wall_03")] = true,
	[GetHashKey("stt_prop_tyre_wall_04")] = true,
	[GetHashKey("stt_prop_tyre_wall_05")] = true,
	[GetHashKey("stt_prop_tyre_wall_06")] = true,
	[GetHashKey("stt_prop_tyre_wall_07")] = true,
	[GetHashKey("stt_prop_tyre_wall_08")] = true,
	[GetHashKey("stt_prop_tyre_wall_09")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l010")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l012")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l013")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l014")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l015")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l018")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l019")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l020")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l04")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l05")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l06")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l07")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l08")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l1")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l16")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l17")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l2")] = true,
	[GetHashKey("stt_prop_tyre_wall_0l3")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r010")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r011")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r012")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r013")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r014")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r015")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r016")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r017")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r018")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r019")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r04")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r05")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r06")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r07")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r08")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r09")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r1")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r2")] = true,
	[GetHashKey("stt_prop_tyre_wall_0r3")] = true,
	[GetHashKey("stt_prop_wallride_01")] = true,
	[GetHashKey("stt_prop_wallride_01b")] = true,
	[GetHashKey("stt_prop_wallride_02")] = true,
	[GetHashKey("stt_prop_wallride_02b")] = true,
	[GetHashKey("stt_prop_wallride_04")] = true,
	[GetHashKey("stt_prop_wallride_05")] = true,
	[GetHashKey("stt_prop_wallride_05b")] = true,
	[GetHashKey("stt_prop_wallride_45l")] = true,
	[GetHashKey("stt_prop_wallride_45la")] = true,
	[GetHashKey("stt_prop_wallride_45r")] = true,
	[GetHashKey("stt_prop_wallride_45ra")] = true,
	[GetHashKey("stt_prop_wallride_90l")] = true,
	[GetHashKey("stt_prop_wallride_90lb")] = true,
	[GetHashKey("stt_prop_wallride_90r")] = true,
	[GetHashKey("stt_prop_wallride_90rb")] = true,

	[GetHashKey("prop_gas_tank_01a")] = true,
	[GetHashKey("prop_gascyl_01a")] = true,
	[GetHashKey("p_spinning_anus_s")] = true,
	[GetHashKey("prop_cs_dildo_01")] = true,
	[GetHashKey("prop_ld_toilet_01")] = true,
	[GetHashKey("prop_ld_bomb_anim")] = true,
	[GetHashKey("prop_ld_farm_couch01")] = true,
	[GetHashKey("p_crahsed_heli_s")] = true,
	[GetHashKey("prop_rock_4_big2")] = true,
	[GetHashKey("prop_beachflag_le")] = true,
	[GetHashKey("stt_prop_stunt_track_uturn")] = true,
	[GetHashKey("stt_prop_stunt_track_turnice")] = true,
	[GetHashKey("stt_prop_stunt_track_hill")] = true,
}

DetectionCache = {}


AddEventHandler("entityCreating", function(entity)
    if DoesEntityExist(entity) then
        if blacklisted[GetEntityModel(entity)] then
            print("^1ENTITY ERROR:^7 An blacklisted entity tried to be spawned by the ID ["..NetworkGetEntityOwner(entity).."]")
            CancelEvent()
            AddPlayerLog(NetworkGetEntityOwner(entity), "AC: Tentative de spawn d'entité blacklist", 2)
        end
    end
end)