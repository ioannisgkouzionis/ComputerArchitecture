----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:59:42 02/28/2015 
-- Design Name: 
-- Module Name:    Rl_Unit - Behavioral 
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

entity Rl_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Rl : out  STD_LOGIC_VECTOR (31 downto 0));
end Rl_Unit;

architecture Behavioral of Rl_Unit is

signal rl : STD_LOGIC_VECTOR (31 downto 0);

begin

rl(31 downto 1) <= A(30 downto 0);
rl(0) <= A(31);
Out_Rl <= rl;

end Behavioral;

