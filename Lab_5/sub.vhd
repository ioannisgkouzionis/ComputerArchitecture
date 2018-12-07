----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:50:28 05/19/2015 
-- Design Name: 
-- Module Name:    sub - Behavioral 
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
use IEEE.std_logic_unsigned.all;  

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity meion_4 is
  Port ( PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end meion_4;

architecture Behavioral of meion_4 is

begin

PC_out <= PC_in - "00000000000000000000000000000100";

end Behavioral;
