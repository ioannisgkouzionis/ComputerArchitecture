----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:02 05/18/2015 
-- Design Name: 
-- Module Name:    khola - Behavioral 
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

entity khola is Port(
			rd : in  STD_LOGIC_VECTOR (4 downto 0);
			rs : in  STD_LOGIC_VECTOR (4 downto 0);
			rt : in  STD_LOGIC_VECTOR (4 downto 0);
			op : in  STD_LOGIC_VECTOR (5 downto 0);
			lw : in  STD_LOGIC_VECTOR (1 downto 0);
			pc : out  STD_LOGIC;
			mem : out  STD_LOGIC);
end khola;

architecture Behavioral of khola is

begin


process(rd,rs,rt,op,lw)
	begin
		if lw="01" and op="100000" then
			if rd=rs or rd=rt then
				pc<='1';
				mem<='1';
			elsif rd=rs and rd=rt then
				pc<='1';
				mem<='1';
			else
				pc<='0';
				mem<='0';
			end if;
		else
			pc<='0';
			mem<='0';
		end if;
	
end process;

end Behavioral;

