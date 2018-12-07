----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:18 04/24/2015 
-- Design Name: 
-- Module Name:    Mux4to1 - Behavioral 
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

entity Mux4to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           In3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           OutMux : out  STD_LOGIC_VECTOR (7 downto 0));
end Mux4to1;

architecture Behavioral of Mux4to1 is

signal data : STD_LOGIC_VECTOR (7 downto 0);

begin
process(In0,In1,In2,In3,Sel)
	begin
		if(Sel = "00") then
			data <= In0;
		elsif (Sel = "01") then
			data <= In1;
		elsif (Sel = "10") then
			data <= In2;
		else
			data <= In3;
		end if;
end process;

OutMux <= data;

end Behavioral;

