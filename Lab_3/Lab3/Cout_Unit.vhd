----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:44 02/28/2015 
-- Design Name: 
-- Module Name:    Cout_Unit - Behavioral 
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

entity Cout_Unit is
    Port ( Add : in  STD_LOGIC;
           Sub : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Carry_Out : out  STD_LOGIC);
end Cout_Unit;

architecture Behavioral of Cout_Unit is

signal mux : STD_LOGIC;

begin

process(Add,Sub,Op)
	begin 
		if (Op = "0000") then
			mux <= Add;
		elsif (Op = "0001") then
			mux <= Sub;
		else
			mux <= '0';
		end if;
end process;

Carry_Out <= mux;

end Behavioral;

