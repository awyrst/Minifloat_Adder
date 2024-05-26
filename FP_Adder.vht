-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/01/2024 13:21:13"
                                                            
-- Vhdl Test Bench template for design  :  FP_Adder
-- 
-- Simulation tool : Questa Intel FPGA (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.numeric_std.all;
ENTITY FP_Adder_vhd_tst IS
END FP_Adder_vhd_tst;
ARCHITECTURE FP_Adder_arch OF FP_Adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Sum : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT FP_Adder
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : FP_Adder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Sum => Sum
	);
                                           
always : PROCESS                                                                                    
BEGIN                                                         
          -- code executes for every event on sensitivity list  
       FOR i IN 0 to 256 LOOP -- loop over all S values

A <= std_logic_vector(to_unsigned(i,8)); -- convert the loop variable i to std_logic_vector

FOR j IN 0 to 256 LOOP -- loop over all X values

B <= std_logic_vector(to_unsigned(j,8)); -- convert the loop variable i to std_logic_vector

WAIT FOR 1 ns ; -- suspend process for 10 nanoseconds at the start of each loop

END LOOP; -- end the j loop

END LOOP; -- end the i loop
WAIT;                                                        
END PROCESS always;                                          
END FP_Adder_arch;
