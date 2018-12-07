--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:03:02 05/17/2015
-- Design Name:   
-- Module Name:   C:/Users/George/Desktop/Lab2/test1.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: forward
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
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forward
    PORT(
         rd : IN  std_logic_vector(4 downto 0);
         rd2 : IN  std_logic_vector(4 downto 0);
         en1 : IN  std_logic;
         en2 : IN  std_logic;
         li1 : IN  std_logic_vector(1 downto 0);
         li2 : IN  std_logic_vector(1 downto 0);
         rs : IN  std_logic_vector(4 downto 0);
         rt : IN  std_logic_vector(4 downto 0);
         Rfa : OUT  std_logic;
         Rfb : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rd2 : std_logic_vector(4 downto 0) := (others => '0');
   signal en1 : std_logic := '0';
   signal en2 : std_logic := '0';
   signal li1 : std_logic_vector(1 downto 0) := (others => '0');
   signal li2 : std_logic_vector(1 downto 0) := (others => '0');
   signal rs : std_logic_vector(4 downto 0) := (others => '0');
   signal rt : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal Rfa : std_logic;
   signal Rfb : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forward PORT MAP (
          rd => rd,
          rd2 => rd2,
          en1 => en1,
          en2 => en2,
          li1 => li1,
          li2 => li2,
          rs => rs,
          rt => rt,
          Rfa => Rfa,
          Rfb => Rfb
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rd <= "00001";
		rd2<= "00001";
		en1 <= '0';
		en2 <= '0';
		li1<= "00";
		li2<= "00";
		rs <= "00001";
		rt <= "00001";
		wait for 100 ns;	
		rd <= "00001";
		rd2 <= "00001";
		en1 <= '0';
		en2<= '1';
		li1 <= "00";
		li2 <= "10";
		rs <= "00001";
		rt <= "00001";
		wait for 100 ns;
		rd <="00001";
		rd2 <= "00001";
		en1 <= '0';
		en2 <= '1';
		li1 <= "00";
		li2 <= "01";
		rs <="00001";
		rt <="00001";
		wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
