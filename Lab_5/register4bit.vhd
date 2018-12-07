----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:38 05/16/2015 
-- Design Name: 
-- Module Name:    register4bit - Behavioral 
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

entity register4bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (3 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (3 downto 0));
end register4bit;

architecture Behavioral of register4bit is

signal data : STD_LOGIC_VECTOR (3 downto 0);

begin

process
	begin
		wait until(clk'event and clk = '1');
			if (Reset = '1') then
				data <= "0000";
			elsif (WE = '1') then
				data <= Din;
			else
				data <= data;
			end if;
end process;

Dout <= data;

end Behavioral;

