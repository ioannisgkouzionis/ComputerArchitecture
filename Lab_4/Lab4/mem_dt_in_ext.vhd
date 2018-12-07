----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:56 04/27/2015 
-- Design Name: 
-- Module Name:    mem_dt_in_ext - Behavioral 
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

entity mem_dt_in_ext is
 Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
        Out32bit : out  STD_LOGIC_VECTOR (31 downto 0));
end mem_dt_in_ext;

architecture Behavioral of mem_dt_in_ext is
signal data : STD_LOGIC_VECTOR (31 downto 0);

begin

process(In0)
	begin 
			if(In0(7) = '1') then
				data(31 downto 8) <= "111111111111111111111111";
				data(7 downto 0) <= In0;
			else
				data(31 downto 8) <= "000000000000000000000000";
				data(7 downto 0) <= In0;
			end if;
	end process;
	
	Out32bit <= data;

end Behavioral;

