----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:29 02/28/2015 
-- Design Name: 
-- Module Name:    Compare_Module - Behavioral 
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

entity Compare_Module is
    Port ( We : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Out_Compare : out  STD_LOGIC);
end Compare_Module;

architecture Behavioral of Compare_Module is

signal data : STD_LOGIC;

begin

process(We,In0,In1)
	begin
		if (We = '1') then
			if (In0 = In1) And (In0/="00000" Or In1/="00000") then
				data <= '1';
			else
				data <= '0';
			end if;
		else
			data <= '0';
		end if;
end process;

Out_Compare <= data;	

end Behavioral;

