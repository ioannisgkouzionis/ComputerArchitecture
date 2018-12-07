----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:58:38 03/11/2015 
-- Design Name: 
-- Module Name:    Mux2to1_5bit - Behavioral 
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

entity Mux2to1_5bit is
    Port ( In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (4 downto 0));
end Mux2to1_5bit;

architecture Behavioral of Mux2to1_5bit is

signal data : STD_LOGIC_VECTOR (4 downto 0);

begin

process(In0,In1,Sel)
	begin
		if(Sel = '0') then
			data <= In0;
		else
			data <= In1;
		end if;
end process;

Out_Mux <= data;

end Behavioral;
