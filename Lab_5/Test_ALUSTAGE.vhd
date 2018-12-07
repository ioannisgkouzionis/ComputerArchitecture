--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:58 03/11/2015
-- Design Name:   
-- Module Name:   C:/Users/giannis/Documents/XilinxProjects/Lab2/Test_ALUSTAGE.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUSTAGE
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
 
ENTITY Test_ALUSTAGE IS
END Test_ALUSTAGE;
 
ARCHITECTURE behavior OF Test_ALUSTAGE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALUSTAGE
    PORT(
         RF_A : IN  std_logic_vector(31 downto 0);
         RF_B : IN  std_logic_vector(31 downto 0);
         Immed : IN  std_logic_vector(31 downto 0);
         ALU_Bin_sel : IN  std_logic;
         ALU_func : IN  std_logic_vector(3 downto 0);
         ALU_out : OUT  std_logic_vector(31 downto 0);
         Zero : OUT  std_logic;
         Cout : OUT  std_logic;
         Ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RF_A : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_B : std_logic_vector(31 downto 0) := (others => '0');
   signal Immed : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_Bin_sel : std_logic := '0';
   signal ALU_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_out : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALUSTAGE PORT MAP (
          RF_A => RF_A,
          RF_B => RF_B,
          Immed => Immed,
          ALU_Bin_sel => ALU_Bin_sel,
          ALU_func => ALU_func,
          ALU_out => ALU_out,
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
      RF_A<="01100000000000000000000000000101";
		RF_B<="11100000000000000000000000001010";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="0000";
		wait for 100 ns;
		RF_A<="01100000000000000000000000000101";
		RF_B<="11100000000000000000000000001010";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='1';
		ALU_func<="0000";
		wait for 100 ns;
		
		--sub
		RF_A<="10101010101010101010101010101010";
		RF_B<="01110111011101110111011101110111";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="0001";
      wait for 100 ns;
		RF_A<="10101010101010101010101010101010";
		RF_B<="10101010101010101010101010101010";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='1';
		ALU_func<="0001";
      wait for 100 ns;
		
		--and
		RF_A<="10101010101010101010101010101010";
		RF_B<="11111110000000001010101010101010";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='1';
		ALU_func<="0010";
      wait for 100 ns;
		
		--or
		RF_A<="10101010101010101010101010101010";
		RF_B<="11111110000000000101010101010101";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='1';
		ALU_func<="0011";
      wait for 100 ns;
		
		--not
		RF_A<="10101010101010101010101010101010";
		RF_B<="11111110000000000101010101010101";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='1';
		ALU_func<="0100";
      wait for 100 ns;
		
		--sra
		RF_A<="11010101010101010101010101010101";
		RF_B<="00000000000000000000000000000000";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="1000";
      wait for 100 ns;
		
		--sr
		RF_A<="11010101010101010101010101010101";
		RF_B<="00000000000000000000000000000000";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="1001";
      wait for 100 ns;
		
		--sl
		RF_A<="01010101010101010101010101010101";
		RF_B<="00000000000000000000000000000000";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="1010";
      wait for 100 ns;
		
		--rl
		RF_A<="11010101010101010101010101010000";
		RF_B<="00000000000000000000000000000000";
		Immed<="00000000000000000000000000000001";
		ALU_Bin_sel<='0';
		ALU_func<="1100";
      wait for 100 ns;
		
		--rr
		RF_A<="00010101010101010101010101010101";
		RF_B<="00000000000000000000000000000000";
		ALU_Bin_sel<='1';
		Immed<="00000000000000000000000000000001";
		ALU_func<="1101";
		wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
