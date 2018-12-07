----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:30 02/28/2015 
-- Design Name: 
-- Module Name:    Carry_Unit - Behavioral 
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

entity Carry_Unit is
    Port ( g : in  STD_LOGIC_VECTOR (3 downto 0);
           p : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           c : out  STD_LOGIC_VECTOR (3 downto 0));
end Carry_Unit;

architecture Behavioral of Carry_Unit is

begin

c(0) <= g(0) OR (p(0) AND cin);
c(1) <= g(1) OR (p(1) AND g(0)) OR (p(1) AND p(0) AND cin);
c(2) <= g(2) OR (p(2) AND g(1)) OR (p(2) AND p(1) AND g(0)) OR (p(2) AND p(1) AND p(0) AND cin);
c(3) <= g(3) OR (p(3) AND g(2)) OR (p(3) AND p(2) AND g(1)) OR (p(3) AND p(2) AND p(1) AND g(0)) OR (p(3) AND p(2) AND p(1) AND p(0) AND cin); 

end Behavioral;

