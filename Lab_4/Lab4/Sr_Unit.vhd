----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:24 02/28/2015 
-- Design Name: 
-- Module Name:    Sr_Unit - Behavioral 
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

entity Sr_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sr : out  STD_LOGIC_VECTOR (31 downto 0));
end Sr_Unit;

architecture Behavioral of Sr_Unit is

signal sr : STD_LOGIC_VECTOR (31 downto 0);

begin

sr(30 downto 0) <= A(31 downto 1);
sr(31) <= '0';
Out_Sr <= sr;

end Behavioral;

