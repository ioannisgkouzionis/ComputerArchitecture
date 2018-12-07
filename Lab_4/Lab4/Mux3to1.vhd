----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:39 03/25/2015 
-- Design Name: 
-- Module Name:    Mux8to1 - Behavioral 
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

entity Mux8to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           In3 : in  STD_LOGIC_VECTOR (31 downto 0);
           In4 : in  STD_LOGIC_VECTOR (31 downto 0);
           In5 : in  STD_LOGIC_VECTOR (31 downto 0);
           In6 : in  STD_LOGIC_VECTOR (31 downto 0);
           In7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux8to1;

architecture Behavioral of Mux8to1 is

signal data : STD_LOGIC_VECTOR (31 downto 0);

begin
process(In0,In1,In2,In3,In4,In5,In6,In7,Sel)
	begin
		if(Sel = "000") then
			data <= In0;
		elsif (Sel = "001") then
			data <= In1;
		elsif (Sel = "010") then
			data <= In2;
		elsif (Sel = "011") then
			data <= In3;
		elsif (Sel = "100") then
			data <= In4;
		elsif (Sel = "101") then
			data <= In5;
		elsif (Sel = "110") then
			data <= In6;
		else
			data <= In7;
		end if;
end process;

Out_Mux <= data;

end Behavioral;

