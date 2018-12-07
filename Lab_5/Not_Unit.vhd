----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:55:35 02/28/2015 
-- Design Name: 
-- Module Name:    Not_Unit - Behavioral 
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

entity Not_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Not : out  STD_LOGIC_VECTOR (31 downto 0));
end Not_Unit;

architecture Behavioral of Not_Unit is

begin

Out_Not <= NOT A;

end Behavioral;

