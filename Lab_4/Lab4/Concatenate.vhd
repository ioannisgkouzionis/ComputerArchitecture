----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:35 04/24/2015 
-- Design Name: 
-- Module Name:    Concatenate - Behavioral 
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

entity Concatenate is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           In3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Out0 : out  STD_LOGIC_VECTOR (31 downto 0));
end Concatenate;

architecture Behavioral of Concatenate is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin
	process(In0,In1,In2,In3)
			begin
				data(31 downto 24) <= In0;
				data(23 downto 16) <= In1;
				data(15 downto 8) <= In2;
				data(7 downto 0) <= In3;
			end process;

	Out0 <= data;

end Behavioral;

