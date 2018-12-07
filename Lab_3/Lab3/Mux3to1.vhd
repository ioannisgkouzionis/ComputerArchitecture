----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:39 03/25/2015 
-- Design Name: 
-- Module Name:    Mux3to1 - Behavioral 
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

entity Mux3to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux3to1;

architecture Behavioral of Mux3to1 is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin
process(In0,In1,In2,Sel)
	begin
		if(Sel = "00") then
			data <= In0;
		elsif (Sel = "01") then
			data <= In1;
		else
			data <= In2;
		end if;
end process;

Out_Mux <= data;

end Behavioral;

