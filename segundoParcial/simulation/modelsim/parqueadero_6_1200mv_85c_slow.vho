-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/29/2023 11:38:56"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	parqueadero IS
    PORT (
	Clock : IN std_logic;
	Reset : IN std_logic;
	FRONT_SENSOR : IN std_logic;
	BACK_SENSOR : IN std_logic;
	contra : IN std_logic;
	LED_R : OUT std_logic;
	LED_V : OUT std_logic
	);
END parqueadero;

-- Design Ports Information
-- LED_R	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED_V	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FRONT_SENSOR	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- contra	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BACK_SENSOR	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF parqueadero IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_FRONT_SENSOR : std_logic;
SIGNAL ww_BACK_SENSOR : std_logic;
SIGNAL ww_contra : std_logic;
SIGNAL ww_LED_R : std_logic;
SIGNAL ww_LED_V : std_logic;
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \contra~input_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \LED_R~output_o\ : std_logic;
SIGNAL \LED_V~output_o\ : std_logic;
SIGNAL \BACK_SENSOR~input_o\ : std_logic;
SIGNAL \FRONT_SENSOR~input_o\ : std_logic;
SIGNAL \combinacional~1_combout\ : std_logic;
SIGNAL \combinacional~0_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ant_state.segundo~q\ : std_logic;
SIGNAL \next_state.tercero~0_combout\ : std_logic;
SIGNAL \ant_state.tercero~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \ant_state.aprovado~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \ant_state.ingreso~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \ant_state.inicio~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \ant_state.primero~q\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_Clock <= Clock;
ww_Reset <= Reset;
ww_FRONT_SENSOR <= FRONT_SENSOR;
ww_BACK_SENSOR <= BACK_SENSOR;
ww_contra <= contra;
LED_R <= ww_LED_R;
LED_V <= ww_LED_V;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;

-- Location: IOIBUF_X0_Y24_N15
\contra~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_contra,
	o => \contra~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\Clock~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G4
\Clock~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOOBUF_X0_Y24_N2
\LED_R~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector6~1_combout\,
	devoe => ww_devoe,
	o => \LED_R~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\LED_V~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector5~0_combout\,
	devoe => ww_devoe,
	o => \LED_V~output_o\);

-- Location: IOIBUF_X0_Y25_N15
\BACK_SENSOR~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BACK_SENSOR,
	o => \BACK_SENSOR~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\FRONT_SENSOR~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_FRONT_SENSOR,
	o => \FRONT_SENSOR~input_o\);

-- Location: LCCOMB_X1_Y24_N26
\combinacional~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \combinacional~1_combout\ = (\contra~input_o\ & (!\BACK_SENSOR~input_o\ & \FRONT_SENSOR~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contra~input_o\,
	datac => \BACK_SENSOR~input_o\,
	datad => \FRONT_SENSOR~input_o\,
	combout => \combinacional~1_combout\);

-- Location: LCCOMB_X1_Y24_N12
\combinacional~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \combinacional~0_combout\ = (!\contra~input_o\ & (!\BACK_SENSOR~input_o\ & \FRONT_SENSOR~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contra~input_o\,
	datac => \BACK_SENSOR~input_o\,
	datad => \FRONT_SENSOR~input_o\,
	combout => \combinacional~0_combout\);

-- Location: LCCOMB_X1_Y24_N8
\Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\combinacional~0_combout\ & (((\ant_state.primero~q\)))) # (!\combinacional~0_combout\ & (!\combinacional~1_combout\ & (\ant_state.segundo~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~1_combout\,
	datab => \combinacional~0_combout\,
	datac => \ant_state.segundo~q\,
	datad => \ant_state.primero~q\,
	combout => \Selector2~0_combout\);

-- Location: IOIBUF_X0_Y14_N8
\Reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: CLKCTRL_G2
\Reset~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: FF_X1_Y24_N9
\ant_state.segundo\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector2~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.segundo~q\);

-- Location: LCCOMB_X1_Y24_N4
\next_state.tercero~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \next_state.tercero~0_combout\ = (!\contra~input_o\ & (\FRONT_SENSOR~input_o\ & (!\BACK_SENSOR~input_o\ & \ant_state.segundo~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contra~input_o\,
	datab => \FRONT_SENSOR~input_o\,
	datac => \BACK_SENSOR~input_o\,
	datad => \ant_state.segundo~q\,
	combout => \next_state.tercero~0_combout\);

-- Location: FF_X1_Y24_N5
\ant_state.tercero\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \next_state.tercero~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.tercero~q\);

-- Location: LCCOMB_X1_Y24_N2
\Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (!\ant_state.segundo~q\ & (!\ant_state.primero~q\ & !\ant_state.aprovado~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ant_state.segundo~q\,
	datac => \ant_state.primero~q\,
	datad => \ant_state.aprovado~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X1_Y24_N6
\Selector3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\combinacional~1_combout\ & (((!\combinacional~0_combout\ & \ant_state.tercero~q\)) # (!\Selector3~0_combout\))) # (!\combinacional~1_combout\ & (!\combinacional~0_combout\ & (\ant_state.tercero~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~1_combout\,
	datab => \combinacional~0_combout\,
	datac => \ant_state.tercero~q\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: FF_X1_Y24_N7
\ant_state.aprovado\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector3~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.aprovado~q\);

-- Location: LCCOMB_X1_Y24_N16
\Selector4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\ant_state.ingreso~q\ & (((\FRONT_SENSOR~input_o\) # (\BACK_SENSOR~input_o\)) # (!\contra~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contra~input_o\,
	datab => \FRONT_SENSOR~input_o\,
	datac => \BACK_SENSOR~input_o\,
	datad => \ant_state.ingreso~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X1_Y24_N20
\Selector4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector4~0_combout\) # ((!\combinacional~1_combout\ & \ant_state.aprovado~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~1_combout\,
	datac => \ant_state.aprovado~q\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~1_combout\);

-- Location: FF_X1_Y24_N21
\ant_state.ingreso\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector4~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.ingreso~q\);

-- Location: LCCOMB_X1_Y24_N18
\Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\contra~input_o\ & (!\FRONT_SENSOR~input_o\ & (!\BACK_SENSOR~input_o\ & \ant_state.ingreso~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contra~input_o\,
	datab => \FRONT_SENSOR~input_o\,
	datac => \BACK_SENSOR~input_o\,
	datad => \ant_state.ingreso~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X1_Y24_N28
\Selector0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\Selector0~0_combout\ & ((\combinacional~0_combout\ & (!\ant_state.tercero~q\)) # (!\combinacional~0_combout\ & ((\ant_state.inicio~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~0_combout\,
	datab => \ant_state.tercero~q\,
	datac => \ant_state.inicio~q\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: FF_X1_Y24_N29
\ant_state.inicio\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector0~1_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.inicio~q\);

-- Location: LCCOMB_X1_Y24_N30
\Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\combinacional~0_combout\ & (((!\ant_state.inicio~q\)))) # (!\combinacional~0_combout\ & (!\combinacional~1_combout\ & (\ant_state.primero~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~1_combout\,
	datab => \combinacional~0_combout\,
	datac => \ant_state.primero~q\,
	datad => \ant_state.inicio~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X1_Y24_N31
\ant_state.primero\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \Selector1~0_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ant_state.primero~q\);

-- Location: LCCOMB_X1_Y24_N10
\Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (!\ant_state.primero~q\ & (!\ant_state.tercero~q\ & !\ant_state.segundo~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ant_state.primero~q\,
	datac => \ant_state.tercero~q\,
	datad => \ant_state.segundo~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X1_Y24_N14
\Selector6~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\combinacional~1_combout\ & (((\combinacional~0_combout\ & !\ant_state.inicio~q\)))) # (!\combinacional~1_combout\ & (((\combinacional~0_combout\ & !\ant_state.inicio~q\)) # (!\Selector6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \combinacional~1_combout\,
	datab => \Selector6~0_combout\,
	datac => \combinacional~0_combout\,
	datad => \ant_state.inicio~q\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X1_Y24_N24
\Selector5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\ant_state.ingreso~q\) # ((\combinacional~1_combout\ & ((\ant_state.aprovado~q\) # (!\Selector6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ant_state.ingreso~q\,
	datab => \Selector6~0_combout\,
	datac => \ant_state.aprovado~q\,
	datad => \combinacional~1_combout\,
	combout => \Selector5~0_combout\);

ww_LED_R <= \LED_R~output_o\;

ww_LED_V <= \LED_V~output_o\;
END structure;


