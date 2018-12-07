----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:11 02/28/2015 
-- Design Name: 
-- Module Name:    Sra_Unit - Behavioral 
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

entity Sra_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sra : out  STD_LOGIC_VECTOR (31 downto 0));
end Sra_Unit;

architecture Behavioral of Sra_Unit is

signal srar : STD_LOGIC_VECTOR (31 downto 0);

begin

srar(30 downto 0) <= A(31 downto 1);
srar(31) <= A(31);
Out_Sra <= srar;

end Behavioral;

