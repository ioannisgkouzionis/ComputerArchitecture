----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:01 02/28/2015 
-- Design Name: 
-- Module Name:    Rr_Unit - Behavioral 
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

entity Rr_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Rr : out  STD_LOGIC_VECTOR (31 downto 0));
end Rr_Unit;

architecture Behavioral of Rr_Unit is

signal rr : STD_LOGIC_VECTOR (31 downto 0);

begin

rr(31) <= A(0);
rr(30 downto 0) <= A(31 downto 1);
Out_Rr <= rr;

end Behavioral;

