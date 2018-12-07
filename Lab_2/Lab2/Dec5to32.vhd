----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:41 02/28/2015 
-- Design Name: 
-- Module Name:    Dec5to32 - Behavioral 
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

entity Dec5to32 is
    Port ( Awr_Dec : in  STD_LOGIC_VECTOR (4 downto 0);
           Out_Dec : out  STD_LOGIC_VECTOR (31 downto 0));
end Dec5to32;

architecture Behavioral of Dec5to32 is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin

process(Awr_Dec)
	begin
		if (Awr_Dec = "00000") then
			data <= "00000000000000000000000000000000";
		elsif (Awr_Dec = "00001") then
			data <= "00000000000000000000000000000010";
		elsif(Awr_Dec = "00010") then
			data <= "00000000000000000000000000000100";
		elsif(Awr_Dec = "00011") then
			data <= "00000000000000000000000000001000";
		elsif(Awr_Dec = "00100") then
			data <= "00000000000000000000000000010000";
		elsif(Awr_Dec = "00101") then
			data <= "00000000000000000000000000100000";
		elsif(Awr_Dec = "00110") then
			data <= "00000000000000000000000001000000";
		elsif(Awr_Dec = "00111") then
			data <= "00000000000000000000000010000000";
		elsif(Awr_Dec = "01000") then
			data <= "00000000000000000000000100000000";
		elsif(Awr_Dec = "01001") then
			data <= "00000000000000000000001000000000";
		elsif(Awr_Dec = "01010") then
			data <= "00000000000000000000010000000000";
		elsif(Awr_Dec = "01011") then
			data <= "00000000000000000000100000000000";
		elsif(Awr_Dec = "01100") then
			data <= "00000000000000000001000000000000";
		elsif(Awr_Dec = "01101") then
			data <= "00000000000000000010000000000000";
		elsif(Awr_Dec = "01110") then
			data <= "00000000000000000100000000000000";
		elsif(Awr_Dec = "01111") then
			data <= "00000000000000001000000000000000";
		elsif(Awr_Dec = "10000") then
			data <= "00000000000000010000000000000000";
		elsif(Awr_Dec = "10001") then
			data <= "00000000000000100000000000000000";
		elsif(Awr_Dec = "10010") then
			data <= "00000000000001000000000000000000";
		elsif(Awr_Dec = "10011") then
			data <= "00000000000010000000000000000000";
		elsif(Awr_Dec = "10100") then
			data <= "00000000000100000000000000000000";
		elsif(Awr_Dec = "10101") then
			data <= "00000000001000000000000000000000";
		elsif(Awr_Dec = "10110") then
			data <= "00000000010000000000000000000000";
		elsif(Awr_Dec = "10111") then
			data <= "00000000100000000000000000000000";
		elsif(Awr_Dec = "11000") then
			data <= "00000001000000000000000000000000";
		elsif(Awr_Dec = "11001") then
			data <= "00000010000000000000000000000000";
		elsif(Awr_Dec = "11010") then
			data <= "00000100000000000000000000000000";
		elsif(Awr_Dec = "11011") then
			data <= "00001000000000000000000000000000";
		elsif(Awr_Dec = "11100") then
			data <= "00010000000000000000000000000000";
		elsif(Awr_Dec = "11101") then
			data <= "00100000000000000000000000000000";
		elsif (Awr_Dec = "11110") then
			data <= "01000000000000000000000000000000";
		elsif (Awr_Dec = "11111") then
			data <= "10000000000000000000000000000000";
		end if;
end process;

Out_Dec <= data;

end Behavioral;

