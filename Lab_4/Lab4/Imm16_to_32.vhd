----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:02:43 03/11/2015 
-- Design Name: 
-- Module Name:    Imm16_to_32 - Behavioral 
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
use IEEE.std_logic_unsigned.all;    

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Imm16_to_32 is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           Imm : in  STD_LOGIC_VECTOR (15 downto 0);
           Out32bit : out  STD_LOGIC_VECTOR (31 downto 0));
end Imm16_to_32;

architecture Behavioral of Imm16_to_32 is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin

process(Opcode,Imm)
	begin 
		if(Opcode = "111000" or Opcode = "110000" or Opcode = "000011" or Opcode = "000111" or Opcode = "001111" or Opcode = "011111" or Opcode= "111100" or Opcode= "111110") then
			if(Imm(15) = '1') then
				data(31 downto 16) <= "1111111111111111";
				data(15 downto 0) <= Imm;
			else
				data(31 downto 16) <= "0000000000000000";
				data(15 downto 0) <= Imm;
			end if;
		elsif(Opcode = "110010" or Opcode = "110011" or Opcode = "101111") then
			data(31 downto 16) <= "0000000000000000";
			data(15 downto 0) <= Imm;
		elsif(Opcode = "111111" or Opcode = "000000" or Opcode = "000001" or Opcode = "100111") then
			if(Imm(15) = '1') then
				data(31 downto 18) <= "11111111111111";
				data(17 downto 2) <= Imm;
				data(1 downto 0) <= "00";
			else
				data(31 downto 18) <= "00000000000000";
				data(17 downto 2) <= Imm;
				data(1 downto 0) <= "00";
			end if;
		elsif (Opcode = "111001") then
			data(31 downto 16) <= Imm;
			data(15 downto 0) <= "0000000000000000";
		end if;
	end process;
	
	Out32bit <= data;

end Behavioral;

