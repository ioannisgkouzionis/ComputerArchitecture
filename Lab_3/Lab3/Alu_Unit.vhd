----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:11 02/28/2015 
-- Design Name: 
-- Module Name:    Alu_Unit - Behavioral 
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

entity Alu_Unit is
    Port ( Adder : in  STD_LOGIC_VECTOR (31 downto 0);
           Subber : in  STD_LOGIC_VECTOR (31 downto 0);
           Andd : in  STD_LOGIC_VECTOR (31 downto 0);
           Orr : in  STD_LOGIC_VECTOR (31 downto 0);
           Nott : in  STD_LOGIC_VECTOR (31 downto 0);
           Srar : in  STD_LOGIC_VECTOR (31 downto 0);
           Sr : in  STD_LOGIC_VECTOR (31 downto 0);
           Sl : in  STD_LOGIC_VECTOR (31 downto 0);
           Rl : in  STD_LOGIC_VECTOR (31 downto 0);
           Rr : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Out_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu_Unit;

architecture Behavioral of Alu_Unit is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin

process(Adder,Subber,Andd,Orr,Nott,Srar,Sr,Sl,Rl,Rr,Op)
	begin
		if (Op = "0000") then
			data <= Adder;
		elsif (Op = "0001") then
			data <= Subber;
		elsif (Op = "0010") then
			data <= Andd;
		elsif (Op = "0011") then
			data <= Orr;
		elsif (Op = "0100") then
			data <= Nott;
		elsif (Op = "1000") then
			data <= Srar;
		elsif (Op = "1001") then
			data <= Sr;
		elsif (Op = "1010") then
			data <= Sl;
		elsif (Op = "1100") then
			data <= Rl;
		elsif (Op = "1101") then
			data <= Rr;
		else 
			data <= "00000000000000000000000000000000";
		end if;
end process;

Out_Alu <= data;

end Behavioral;

