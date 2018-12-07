----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:34 02/28/2015 
-- Design Name: 
-- Module Name:    Add32bit_Unit - Behavioral 
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

entity Add32bit_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end Add32bit_Unit;

architecture Behavioral of Add32bit_Unit is

component Add4bit_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Cout_1 : out  STD_LOGIC;
           Cout_2 : out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal carry : STD_LOGIC_VECTOR (8 downto 0);

begin

add3to0 : Add4bit_Unit Port Map ( A => A(3 downto 0), 
											 B => B(3 downto 0), 
											 Cin => '0', 
											 Cout_1 => carry(0), 
											 Sum => Sum(3 downto 0) );
add7to4 : Add4bit_Unit Port Map ( A => A(7 downto 4), 
											 B => B(7 downto 4), 
											 Cin => carry(0), 
											 Cout_1 => carry(1), 
											 Sum => Sum(7 downto 4) );
add11to8 : Add4bit_Unit Port Map ( A => A(11 downto 8), 
											  B => B(11 downto 8), 
											  Cin => carry(1), 
											  Cout_1 => carry(2), 
											  Sum => Sum(11 downto 8) );
add15to12 : Add4bit_Unit Port Map ( A => A(15 downto 12), 
												B => B(15 downto 12), 
												Cin => carry(2), 
												Cout_1 => carry(3), 
												Sum => Sum(15 downto 12) );
add19to16 : Add4bit_Unit Port Map ( A => A(19 downto 16), 
												B => B(19 downto 16), 
												Cin => carry(3), 
												Cout_1 => carry(4), 
												Sum => Sum(19 downto 16) );
add23to20 : Add4bit_Unit Port Map ( A => A(23 downto 20), 
											   B => B(23 downto 20), 
												Cin => carry(4), 
												Cout_1 => carry(5), 
												Sum => Sum(23 downto 20) );
add27to24 : Add4bit_Unit Port Map ( A => A(27 downto 24), 
											   B => B(27 downto 24), 
												Cin => carry(5), 
												Cout_1 => carry(6), 
												Sum => Sum(27 downto 24) );
add31to28 : Add4bit_Unit Port Map ( A => A(31 downto 28), 
											   B => B(31 downto 28), 
												Cin => carry(6), 
												Cout_1 => carry(7), 
												Cout_2 => carry(8), 
												Sum => Sum(31 downto 28) );

Cout <= carry(7);
Ovf <= carry(7) XOR carry(8);

end Behavioral;

