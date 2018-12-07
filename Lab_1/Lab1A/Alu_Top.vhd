----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:44 02/28/2015 
-- Design Name: 
-- Module Name:    Alu_Top - Behavioral 
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

entity Alu_Top is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Res : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end Alu_Top;

architecture Behavioral of Alu_Top is

component Add32bit_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component Sub32_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Sum : out  STD_LOGIC_VECTOR (31 downto 0);
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

component And_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_And : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Or_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Or : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Not_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Not : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Sra_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sra : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Sr_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Sl_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Sl : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Rl_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Rl : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Rr_Unit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Rr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Cout_Unit is
    Port ( Add : in  STD_LOGIC;
           Sub : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Carry_Out : out  STD_LOGIC);
end component;

component Overflow_Unit is
    Port ( Add : in  STD_LOGIC;
           Sub : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Ovf_Out : out  STD_LOGIC);
end component;

component Alu_Unit is
    Port ( Adder : in  STD_LOGIC_VECTOR (31 downto 0);
           Subber : in  STD_LOGIC_VECTOR (31 downto 0);
           Andd : in  STD_LOGIC_VECTOR (31 downto 0);
           Orr : in  STD_LOGIC_VECTOR (31 downto 0);
           Nott : in  STD_LOGIC_VECTOR (31 downto 0);
           Srar : in  STD_LOGIC_VECTOR (31 downto 0);
           Sr : in  STD_LOGIC_VECTOR (31 downto 0);
           Sl : in  STD_LOGIC_VECTOR (31 downto 0);
           Rl : in  STD_LOGIC_VECTOR (31 downto 0);
           Rr : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Out_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Zero_Unit is
    Port ( Inz : in  STD_LOGIC_VECTOR (31 downto 0);
           Outz : out  STD_LOGIC);
end component;

signal add,sub,andd,orr,nott,srar,sr,sl,rl,rr,mux : STD_LOGIC_VECTOR (31 downto 0);
signal add_Carry,sub_Carry,ovf_Add,ovf_Sub : STD_LOGIC;

begin

add_Mod : Add32bit_Unit Port Map ( A => A, 
											  B => B, 
											  Sum => add, 
											  Cout => add_Carry, 
											  Ovf => ovf_Add );
sub_Mod : Sub32_Unit Port Map ( A => A, 
										  B => B, 
										  Sum => sub, 
										  Cout => sub_Carry, 
										  Ovf => ovf_Sub );
and_Mod : And_Unit Port Map ( A => A, 
										B => B, 
										Out_And => andd );
or_Mod : Or_Unit Port Map ( A => A, 
									 B => B, 
									 Out_Or => orr );
not_Mod : Not_Unit Port Map ( A => A, 
										Out_Not => nott );
sra_Mod : Sra_Unit Port Map ( A => A, 
										Out_Sra => srar );
sr_Mod : Sr_Unit Port Map ( A => A, 
									 Out_Sr => sr );
sl_Mod : Sl_Unit Port Map ( A => A, 
									 Out_Sl => sl );
rl_Mod : Rl_Unit Port Map ( A => A, 
									 Out_Rl => rl );
rr_Mod : Rr_Unit Port Map ( A => A, 
									 Out_Rr => rr );
cout_Mod : Cout_Unit Port Map ( Add => add_Carry, 
										  Sub => sub_Carry, 
										  Op => Op, 
										  Carry_Out => Cout );
ovf_Mod : Overflow_Unit Port Map ( Add => ovf_Add, 
											  Sub => ovf_Sub, 
											  Op => Op, 
											  Ovf_Out => Ovf );
alu_Mod : Alu_Unit Port Map ( Adder => add, 
									   Subber => sub, 
										Andd => andd, 
										Orr => orr, 
										Nott => nott, 
										Srar => srar, 
										Sr => sr, 
										Sl => sl, 
										Rl => rl, 
										Rr => rr, 
										Op => Op, 
										Out_Alu => mux );
zero_Mod : Zero_Unit Port Map ( Inz => mux, 
									     Outz => Zero );

Res <= mux;

end Behavioral;

