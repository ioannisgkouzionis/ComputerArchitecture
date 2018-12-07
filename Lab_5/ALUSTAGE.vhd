----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:12:04 03/11/2015 
-- Design Name: 
-- Module Name:    ALUSTAGE - Behavioral 
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

entity ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  AluOut_In : in  STD_LOGIC_VECTOR (31 downto 0);
			  AluOut_In2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  MemOut2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Mux_RFB_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Zero : out  STD_LOGIC;
			  Cout : out  STD_LOGIC;
			  Ovf : out  STD_LOGIC );
end ALUSTAGE;

architecture Behavioral of ALUSTAGE is

component Mux4to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           In3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux3to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Alu_Top is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Res : out  STD_LOGIC_VECTOR (31 downto 0);
           Zero : out  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Ovf : out  STD_LOGIC);
end component;

signal muxtomux2 : STD_LOGIC_VECTOR (31 downto 0);
signal mux2toAlu : STD_LOGIC_VECTOR (31 downto 0);

begin

mux_2to1 : Mux2to1 Port map ( In0 => RF_B,
									   In1 => Immed,
									   Sel => ALU_Bin_sel,
									   Out_Mux => muxtomux2 );
										
alu : Alu_Top Port map ( A => RF_A, 
								 B => mux2toAlu, 
								 Op => ALU_func,
								 Res => ALU_out,
								 Zero => Zero,
								 Cout => Cout,
								 Ovf => Ovf );
								 
mux_rfb_3to1 : Mux4to1 Port map (In0 => muxtomux2,
											In1 => AluOut_In,
											In2 => AluOut_In2,
											In3 => MemOut2,
											Sel => Mux_RFB_sel,
											Out_Mux => mux2toAlu);


end Behavioral;

