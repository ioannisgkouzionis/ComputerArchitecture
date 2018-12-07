----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:08 02/28/2015 
-- Design Name: 
-- Module Name:    Zero_Unit - Behavioral 
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

entity Zero_Unit is
    Port ( Inz : in  STD_LOGIC_VECTOR (31 downto 0);
           Outz : out  STD_LOGIC);
end Zero_Unit;

architecture Behavioral of Zero_Unit is

signal zero : STD_LOGIC;

begin

process(Inz)
	begin
		if (Inz = "00000000000000000000000000000000") then
			zero <= '1';
		else
			zero <= '0';
		end if;
end process;

Outz <= zero;

end Behavioral;

