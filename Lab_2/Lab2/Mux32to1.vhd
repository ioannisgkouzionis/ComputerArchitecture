----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:02:58 02/28/2015 
-- Design Name: 
-- Module Name:    Mux32to1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux32to1 is
	Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
          In1 : in  STD_LOGIC_VECTOR (31 downto 0);
          In2 : in  STD_LOGIC_VECTOR (31 downto 0);
          In3 : in  STD_LOGIC_VECTOR (31 downto 0);
          In4 : in  STD_LOGIC_VECTOR (31 downto 0);
          In5 : in  STD_LOGIC_VECTOR (31 downto 0);
          In6 : in  STD_LOGIC_VECTOR (31 downto 0);
          In7 : in  STD_LOGIC_VECTOR (31 downto 0);
          In8 : in  STD_LOGIC_VECTOR (31 downto 0);
          In9 : in  STD_LOGIC_VECTOR (31 downto 0);
          In10 : in  STD_LOGIC_VECTOR (31 downto 0);
          In11 : in  STD_LOGIC_VECTOR (31 downto 0);
          In12 : in  STD_LOGIC_VECTOR (31 downto 0);
          In13 : in  STD_LOGIC_VECTOR (31 downto 0);
          In14 : in  STD_LOGIC_VECTOR (31 downto 0);
          In15 : in  STD_LOGIC_VECTOR (31 downto 0);
          In16 : in  STD_LOGIC_VECTOR (31 downto 0);
          In17 : in  STD_LOGIC_VECTOR (31 downto 0);
          In18 : in  STD_LOGIC_VECTOR (31 downto 0);
          In19 : in  STD_LOGIC_VECTOR (31 downto 0);
          In20 : in  STD_LOGIC_VECTOR (31 downto 0);
          In21 : in  STD_LOGIC_VECTOR (31 downto 0);
          In22 : in  STD_LOGIC_VECTOR (31 downto 0);
          In23 : in  STD_LOGIC_VECTOR (31 downto 0);
          In24 : in  STD_LOGIC_VECTOR (31 downto 0);
          In25 : in  STD_LOGIC_VECTOR (31 downto 0);
          In26 : in  STD_LOGIC_VECTOR (31 downto 0);
          In27 : in  STD_LOGIC_VECTOR (31 downto 0);
          In28 : in  STD_LOGIC_VECTOR (31 downto 0);
          In29 : in  STD_LOGIC_VECTOR (31 downto 0);
          In30 : in  STD_LOGIC_VECTOR (31 downto 0);
          In31 : in  STD_LOGIC_VECTOR (31 downto 0);
			 Sel : in  STD_LOGIC_VECTOR (4 downto 0);
          Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux32to1;

architecture Behavioral of Mux32to1 is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin

process(In0,In1,In2,In3,In4,In5,In6,In7,In8,In9,In10,In11,In12,In13,In14,In15,In16,In17,In18,In19,In20,In21,In22,In23,In24,In25,In26,In27,In28,In29,In30,In31,Sel)
	begin
		if(Sel = "00000") then
			data <= In0;
		elsif(Sel = "00001") then
			data <= In1;
		elsif(Sel = "00010") then
			data <= In2;
		elsif(Sel = "00011") then
			data <= In3;
		elsif(Sel = "00100") then
			data <= In4;
		elsif(Sel = "00101") then
			data <= In5;
		elsif(Sel = "00110") then
			data <= In6;
		elsif(Sel = "00111") then
			data <= In7;
		elsif(Sel = "01000") then
			data <= In8;
		elsif(Sel = "01001") then
			data <= In9;
		elsif(Sel = "01010") then
			data <= In10;
		elsif(Sel = "01011") then
			data <= In11;
		elsif(Sel = "01100") then
			data <= In12;
		elsif(Sel = "01101") then
			data <= In13;
		elsif(Sel = "01110") then
			data <= In14;
		elsif(Sel = "01111") then
			data <= In15;
		elsif(Sel = "10000") then
			data <= In16;
		elsif(Sel = "10001") then
			data <= In17;
		elsif(Sel = "10010") then
			data <= In18;
		elsif(Sel = "10011") then
			data <= In19;
		elsif(Sel = "10100") then
			data <= In20;
		elsif(Sel = "10101") then
			data <= In21;
		elsif(Sel = "10110") then
			data <= In22;
		elsif(Sel = "10111") then
			data <= In23;
		elsif(Sel = "11000") then
			data <= In24;
		elsif(Sel = "11001") then
			data <= In25;
		elsif(Sel = "11010") then
			data <= In26;
		elsif(Sel = "11011") then
			data <= In27;
		elsif(Sel = "11100") then
			data <= In28;
		elsif(Sel = "11101") then
			data <= In29;
		elsif(Sel = "11110") then
			data <= In30;
		elsif(Sel = "11111") then
			data <= In31;
		end if;
end process;
	
Out_Mux <= data;

end Behavioral;

