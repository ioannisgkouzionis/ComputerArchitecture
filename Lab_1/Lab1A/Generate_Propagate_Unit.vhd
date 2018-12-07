----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:54 02/28/2015 
-- Design Name: 
-- Module Name:    Generate_Propagate_Unit - Behavioral 
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

entity Generate_Propagate_Unit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           g : out  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC_VECTOR (3 downto 0));
end Generate_Propagate_Unit;

architecture Behavioral of Generate_Propagate_Unit is

begin

g(0) <= a(0) AND b(0);
g(1) <= a(1) AND b(1);
g(2) <= a(2) AND b(2);
g(3) <= a(3) AND b(3);

p(0) <= a(0) XOR b(0);
p(1) <= a(1) XOR b(1);
p(2) <= a(2) XOR b(2);
p(3) <= a(3) XOR b(3);

end Behavioral;

