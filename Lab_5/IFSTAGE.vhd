----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:47 03/11/2015 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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

entity IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
			  PC_sel_2 : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is

component meion_4 is
  Port ( PC_in : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IF_MEM is
port ( clk : in std_logic;
	    addr : in std_logic_vector(9 downto 0);
	    dout : out std_logic_vector(31 downto 0));
end component;

component Register32bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component AdderPC4 is
    Port ( Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component AdderPC4_Imm is
    Port ( Din1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Din2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal MuxtoPC : STD_LOGIC_VECTOR (31 downto 0);
signal MuxtoMux : STD_LOGIC_VECTOR (31 downto 0);
signal PCto4_Imem : STD_LOGIC_VECTOR (31 downto 0);
signal four_Immed : STD_LOGIC_VECTOR (31 downto 0);
signal Immed_Mux : STD_LOGIC_VECTOR (31 downto 0);
signal four : STD_LOGIC_VECTOR (31 downto 0);

begin

pc : Register32bit Port map ( Clk => Clk,
									   Reset => Reset,
									   Din => MuxtoPC,
									   WE => PC_LdEn,
									   Dout => PCto4_Imem);
									  
mux_2to1 : Mux2to1 Port map ( In0 => four_Immed,
									  In1 => Immed_Mux,
									  Sel => PC_Sel,
									  Out_Mux => MuxtoMux);
									 
adder_PC4 : AdderPC4 Port map ( Din => PCto4_Imem,
										 Dout => four_Immed);
										
adderPC_Immed : AdderPC4_Imm Port map ( Din1 => PC_Immed,
													 Din2 => four_Immed, 
													 Dout => Immed_Mux);
													 
imem : IF_MEM Port map ( clk => Clk,
								 addr => PCto4_Imem(11 downto 2),
								 dout => Instr);
								 
mux_2to1_madafaka : Mux2to1 Port map ( In0 => MuxtoMux,
									  In1 => four,
									  Sel => PC_Sel_2,
									  Out_Mux => MuxtoPC);
									 
sub4: meion_4 Port map( PC_in => PCto4_Imem,
							  PC_out => four);

end Behavioral;

