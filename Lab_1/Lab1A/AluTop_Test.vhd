--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:33:14 02/28/2015
-- Design Name:   
-- Module Name:   C:/Users/giannis/Documents/XilinxProjects/Lab1A/AluTop_Test.vhd
-- Project Name:  Lab1A
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu_Top
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
 
ENTITY AluTop_Test IS
END AluTop_Test;
 
ARCHITECTURE behavior OF AluTop_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu_Top
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Res : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Res : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu_Top PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Res => Res,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		--add
		A<="01100000000000000000000000000101";
		B<="11100000000000000000000000001010";
		Op<="0000";
		wait for 100 ns;
		A<="01000000000000000000000000011001";
		B<="01000000000000000000000000110010";
		Op<="0000";
		wait for 100 ns;
		--sub
		A<="10101010101010101010101010101010";
		B<="01110111011101110111011101110111";	
		Op<="0001";
      wait for 100 ns;
		A<="10101010101010101010101010101010";
		B<="10101010101010101010101010101010";	
		Op<="0001";
      wait for 100 ns;
		--and
		A<="10101010101010101010101010101010";
		B<="11111110000000001010101010101010";	
		Op<="0010";
      wait for 100 ns;
		--or
		A<="10101010101010101010101010101010";
		B<="11111110000000000101010101010101";	
		Op<="0011";
      wait for 100 ns;
		--not
		A<="10101010101010101010101010101010";
		B<="11111110000000000101010101010101";	
		Op<="0100";
      wait for 100 ns;
		--sra
		A<="11010101010101010101010101010101";
		B<="00000000000000000000000000000000";	
		Op<="1000";
      wait for 100 ns;
		--sr
		A<="11010101010101010101010101010101";
		B<="00000000000000000000000000000000";	
		Op<="1001";
      wait for 100 ns;
		--sl
		A<="01010101010101010101010101010101";
		B<="00000000000000000000000000000000";	
		Op<="1010";
      wait for 100 ns;
		--rl
		A<="11010101010101010101010101010000";
		B<="00000000000000000000000000000000";	
		Op<="1100";
      wait for 100 ns;
		--rr
		A<="00010101010101010101010101010101";
		B<="00000000000000000000000000000000";	
		Op<="1101";
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
