----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:33 02/28/2015 
-- Design Name: 
-- Module Name:    Sl_Unit - Behavioral 
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

entity Sl_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sl : out  STD_LOGIC_VECTOR (31 downto 0));
end Sl_Unit;

architecture Behavioral of Sl_Unit is

signal sl : STD_LOGIC_VECTOR (31 downto 0);

begin

sl(31 downto 1) <= A(30 downto 0);
sl(0) <= '0';
Out_Sl <= sl;

end Behavioral;

