--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:07:31 02/28/2015
-- Design Name:   
-- Module Name:   C:/Users/giannis/Documents/XilinxProjects/Lab1B/Register_File_Test.vhd
-- Project Name:  Lab1B
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY Register_File_Test IS
END Register_File_Test;
 
ARCHITECTURE behavior OF Register_File_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Reset : IN  std_logic;
         Awr : IN  std_logic_vector(4 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic;
         WrEn : IN  std_logic;
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal WrEn : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Reset => Reset,
          Awr => Awr,
          Din => Din,
          Clk => Clk,
          WrEn => WrEn,
          Dout1 => Dout1,
          Dout2 => Dout2
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
      Reset <= '1';
		wait for 100 ns;
		
		Reset <= '0';
		wait for 100 ns;
		
	   Ard1 <= "00000"; 
      Ard2 <= "00001";
      Awr  <= "00000";
      Din  <= "00000000000000000000000000000001";
      WrEn <= '1';
      wait for 100 ns;
		
		Ard1 <= "00000"; 
      Ard2 <= "00010";
      Awr  <= "10000";
      Din  <= "00000000000000000001000000000000";
      WrEn <= '0';
      wait for 100 ns;
		
		Ard1 <= "10000"; 
      Ard2 <= "00000";
      Awr  <= "00001";
      Din  <= "00000000000000000000000000000001";
      WrEn <= '1';
      wait for 100 ns;
		
		Ard1 <= "00001"; 
      Ard2 <= "00100";
      Awr  <= "01000";
      Din  <= "00000000000000000000000000000001";
      WrEn <= '1';
		wait for 100 ns;
		
		Ard1 <= "01000"; 
      Ard2 <= "00011";
      Awr  <= "10000";
      Din  <= "00000000000000000000000000000111";
      WrEn <= '1';
      wait for 100 ns;
		
      Ard1 <= "10000"; 
      Ard2 <= "00110";
      Awr  <= "00110";
      Din  <= "00000000000000000000000000000000";
      WrEn <= '1';
      wait for 100 ns;
		
		Ard1 <= "00110"; 
      Ard2 <= "00100";
      Awr  <= "10000";
      Din  <= "00000000000000000000000011111111";
      WrEn <= '1';
      wait for 100 ns;
		
	   Ard1 <= "10000"; 
      Ard2 <= "01000";
      Awr  <= "00111";
      Din  <= "00000000000000000000000000001111";
      WrEn <= '1';
      wait for 100 ns;
		
	   Ard1 <= "00111"; 
      Ard2 <= "01010";
      Awr  <= "01010";
      Din  <= "00000000001111000000000000001111";
      WrEn <= '0';
      wait for 100 ns;
		
	   Ard1 <= "00000"; 
      Ard2 <= "00000";
      Awr  <= "01111";
      Din  <= "11100000001111000000000000001111";
      WrEn <= '1';
      wait for 100 ns;	

      --wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
