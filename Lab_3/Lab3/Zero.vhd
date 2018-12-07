----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:29 03/25/2015 
-- Design Name: 
-- Module Name:    Zero - Behavioral 
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

entity ZeroFill is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Out0 : out  STD_LOGIC_VECTOR (31 downto 0));
end ZeroFill;

architecture Behavioral of ZeroFill is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin
	
	process(In0)
		begin 

				data(31 downto 8) <= "000000000000000000000000";
				data(7 downto 0) <= In0(7 downto 0);
				
	end process;

	Out0 <= data;

end Behavioral;

