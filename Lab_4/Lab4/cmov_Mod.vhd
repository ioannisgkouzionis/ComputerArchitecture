----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:39 04/17/2015 
-- Design Name: 
-- Module Name:    cmov_Mod - Behavioral 
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

entity Cmov_Unit is
    Port ( In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Out1 : out  STD_LOGIC_VECTOR (31 downto 0));
end Cmov_Unit;

architecture Behavioral of Cmov_Unit is

begin

Out1 <= In1;

end Behavioral;

