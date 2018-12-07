--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:52:09 03/11/2015
-- Design Name:   
-- Module Name:   C:/Users/giannis/Documents/XilinxProjects/Lab2/Test_DECSTAGE.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY Test_DECSTAGE IS
END Test_DECSTAGE;
 
ARCHITECTURE behavior OF Test_DECSTAGE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0);
         Reset : IN  std_logic--;
         --Opcode : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   --signal Opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B,
          Reset => Reset
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
      
		Reset <='1';
		wait for 100 ns;			
		
      Reset <='0';
		Instr <="11100000000000001000111000111000";
      RF_WrEn <='1';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='1';
      RF_B_sel <='0';
		wait for 100 ns;

		Instr <="11100001010000110111000111000111";
      RF_WrEn <='1';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='1';
      RF_B_sel <='1';
		wait for 100 ns;			
		
		Instr <="11001000011101011110001110001110";
      RF_WrEn <='1';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='1';
      RF_B_sel <='0';
		wait for 100 ns;		
		
		Instr <="11001010101001110011100011100011";
      RF_WrEn <='0';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='0';
      RF_B_sel <='0';
		wait for 100 ns;		
		
		Instr <="11111100001111101111011100011100";
      RF_WrEn <='1';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='0';
      RF_B_sel <='0';
		wait for 100 ns;
		
		Instr <="11111110101001000101010101010101";
      RF_WrEn <='0';
      ALU_out <="00110011001100110011001100110011";
      MEM_out <="10001000100010001000100010001000";
      RF_WrData_sel <='0';
      RF_B_sel <='1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
