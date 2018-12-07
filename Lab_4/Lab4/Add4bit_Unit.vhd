----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:10 02/28/2015 
-- Design Name: 
-- Module Name:    Add4bit_Unit - Behavioral 
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

entity Add4bit_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           Cout_1 : out  STD_LOGIC;
           Cout_2 : out  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0));
end Add4bit_Unit;

architecture Behavioral of Add4bit_Unit is

component Generate_Propagate_Unit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           g : out  STD_LOGIC_VECTOR (3 downto 0);
           p : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Carry_Unit is
    Port ( g : in  STD_LOGIC_VECTOR (3 downto 0);
           p : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           c : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Sum_Unit is
    Port ( p : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal gen,prop,carry : STD_LOGIC_VECTOR (3 downto 0);

begin

gp_Mod : Generate_Propagate_Unit Port Map ( a => A, 
														  b => B, 
														  g => gen, 
														  p => prop );
car_Mod : Carry_Unit Port Map ( g => gen, 
										  p => prop, 
										  cin => Cin, 
										  c => carry );
sum_Mod : Sum_Unit Port Map ( p => prop, 
										c => carry, 
										cin => Cin, 
										s => Sum );

Cout_1 <= carry(3);
Cout_2 <= carry(2);

end Behavioral;

