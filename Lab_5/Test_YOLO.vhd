--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:04 03/25/2015
-- Design Name:   
-- Module Name:   C:/Users/George/Desktop/Lab2/Test_YOLO.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: YOLO
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_YOLO IS
END Test_YOLO;
 
ARCHITECTURE behavior OF Test_YOLO IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT YOLO
    PORT(
         Reset : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: YOLO PORT MAP (
          Reset => Reset,
          Clk => Clk
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     Reset<='1';
	  wait for 100 ns;
	  Reset<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
