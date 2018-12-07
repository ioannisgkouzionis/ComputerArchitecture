----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:52 02/28/2015 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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

entity Register_File is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reset : in  STD_LOGIC;
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

component And_Unit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Out_And : out  STD_LOGIC);
end component;

component Compare_Module is
    Port ( We : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Out_Compare : out  STD_LOGIC);
end component;

component Dec5to32 is
    Port ( Awr_Dec : in  STD_LOGIC_VECTOR (4 downto 0);
           Out_Dec : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux32to1 is
	Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
          In1 : in  STD_LOGIC_VECTOR (31 downto 0);
          In2 : in  STD_LOGIC_VECTOR (31 downto 0);
          In3 : in  STD_LOGIC_VECTOR (31 downto 0);
          In4 : in  STD_LOGIC_VECTOR (31 downto 0);
          In5 : in  STD_LOGIC_VECTOR (31 downto 0);
          In6 : in  STD_LOGIC_VECTOR (31 downto 0);
          In7 : in  STD_LOGIC_VECTOR (31 downto 0);
          In8 : in  STD_LOGIC_VECTOR (31 downto 0);
          In9 : in  STD_LOGIC_VECTOR (31 downto 0);
          In10 : in  STD_LOGIC_VECTOR (31 downto 0);
          In11 : in  STD_LOGIC_VECTOR (31 downto 0);
          In12 : in  STD_LOGIC_VECTOR (31 downto 0);
          In13 : in  STD_LOGIC_VECTOR (31 downto 0);
          In14 : in  STD_LOGIC_VECTOR (31 downto 0);
          In15 : in  STD_LOGIC_VECTOR (31 downto 0);
          In16 : in  STD_LOGIC_VECTOR (31 downto 0);
          In17 : in  STD_LOGIC_VECTOR (31 downto 0);
          In18 : in  STD_LOGIC_VECTOR (31 downto 0);
          In19 : in  STD_LOGIC_VECTOR (31 downto 0);
          In20 : in  STD_LOGIC_VECTOR (31 downto 0);
          In21 : in  STD_LOGIC_VECTOR (31 downto 0);
          In22 : in  STD_LOGIC_VECTOR (31 downto 0);
          In23 : in  STD_LOGIC_VECTOR (31 downto 0);
          In24 : in  STD_LOGIC_VECTOR (31 downto 0);
          In25 : in  STD_LOGIC_VECTOR (31 downto 0);
          In26 : in  STD_LOGIC_VECTOR (31 downto 0);
          In27 : in  STD_LOGIC_VECTOR (31 downto 0);
          In28 : in  STD_LOGIC_VECTOR (31 downto 0);
          In29 : in  STD_LOGIC_VECTOR (31 downto 0);
          In30 : in  STD_LOGIC_VECTOR (31 downto 0);
          In31 : in  STD_LOGIC_VECTOR (31 downto 0);
			 Sel : in  STD_LOGIC_VECTOR (4 downto 0);
          Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register32bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal MuxtoMux1 : STD_LOGIC_VECTOR (31 downto 0);
signal MuxtoMux2 : STD_LOGIC_VECTOR (31 downto 0);
signal DectoReg : STD_LOGIC_VECTOR (31 downto 0);
signal ComptoSel1 : STD_LOGIC;
signal ComptoSel2 : STD_LOGIC;
signal RegDout0 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout1 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout2 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout3 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout4 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout5 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout6 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout7 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout8 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout9 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout10 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout11 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout12 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout13 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout14 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout15 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout16 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout17 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout18 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout19 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout20 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout21 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout22 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout23 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout24 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout25 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout26 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout27 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout28 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout29 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout30 : STD_LOGIC_VECTOR (31 downto 0);
signal RegDout31 : STD_LOGIC_VECTOR (31 downto 0);
signal AndOut0 : STD_LOGIC;
signal AndOut1 : STD_LOGIC;
signal AndOut2 : STD_LOGIC;
signal AndOut3 : STD_LOGIC;
signal AndOut4 : STD_LOGIC;
signal AndOut5 : STD_LOGIC;
signal AndOut6 : STD_LOGIC;
signal AndOut7 : STD_LOGIC;
signal AndOut8 : STD_LOGIC;
signal AndOut9 : STD_LOGIC;
signal AndOut10 : STD_LOGIC;
signal AndOut11 : STD_LOGIC;
signal AndOut12 : STD_LOGIC;
signal AndOut13 : STD_LOGIC;
signal AndOut14 : STD_LOGIC;
signal AndOut15 : STD_LOGIC;
signal AndOut16 : STD_LOGIC;
signal AndOut17 : STD_LOGIC;
signal AndOut18 : STD_LOGIC;
signal AndOut19 : STD_LOGIC;
signal AndOut20 : STD_LOGIC;
signal AndOut21 : STD_LOGIC;
signal AndOut22 : STD_LOGIC;
signal AndOut23 : STD_LOGIC;
signal AndOut24 : STD_LOGIC;
signal AndOut25 : STD_LOGIC;
signal AndOut26 : STD_LOGIC;
signal AndOut27 : STD_LOGIC;
signal AndOut28 : STD_LOGIC;
signal AndOut29 : STD_LOGIC;
signal AndOut30 : STD_LOGIC;
signal AndOut31 : STD_LOGIC;

begin

addrDec_Mod : Dec5to32  Port Map ( Awr_Dec => Awr,
											  Out_Dec => DectoReg );
and0_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(0),
										 Out_And => AndOut0 );			  
and1_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(1),
										 Out_And => AndOut1 );
and2_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(2),
										 Out_And => AndOut2 );
and3_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(3),
										 Out_And => AndOut3 );
and4_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(4),
										 Out_And => AndOut4 );
and5_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(5),
										 Out_And => AndOut5 );
and6_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(6),
										 Out_And => AndOut6 );
and7_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(7),
										 Out_And => AndOut7 );
and8_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(8),
										 Out_And => AndOut8 );
and9_Mod : And_Unit Port Map ( A => WrEn,
										 B => DectoReg(9),
										 Out_And => AndOut9 );
and10_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(10),
										  Out_And => AndOut10 );
and11_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(11),
										  Out_And => AndOut11 );
and12_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(12),
										  Out_And => AndOut12 );
and13_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(13),
										  Out_And => AndOut13 );
and14_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(14),
										  Out_And => AndOut14 );
and15_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(15),
										  Out_And => AndOut15 );
and16_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(16),
										  Out_And => AndOut16 );
and17_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(17),
										  Out_And => AndOut17 );
and18_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(18),
										  Out_And => AndOut18 );
and19_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(19),
										  Out_And => AndOut19 );
and20_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(20),
										  Out_And => AndOut20 );
and21_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(21),
										  Out_And => AndOut21);
and22_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(22),
										  Out_And => AndOut22 );
and23_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(23),
										  Out_And => AndOut23 );
and24_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(24),
										  Out_And => AndOut24 );
and25_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(25),
										  Out_And => AndOut25 );
and26_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(26),
										  Out_And => AndOut26 );
and27_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(27),
										  Out_And => AndOut27 );
and28_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(28),
										  Out_And => AndOut28 );
and29_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(29),
										  Out_And => AndOut29 );
and30_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(30),
										  Out_And => AndOut30 );
and31_Mod : And_Unit Port Map ( A => WrEn,
										  B => DectoReg(31),
										  Out_And => AndOut31 );
reg0_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din, --(others=>'0')
											  Dout => RegDout0,
											  WE => AndOut0 );
reg1_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout1,
											  WE => AndOut1 );
reg2_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout2,
											  WE => AndOut2 );
reg3_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout3,
											  WE => AndOut3 );
reg4_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout4,
											  WE => AndOut4 );
reg5_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout5,
											  WE => AndOut5 );
reg6_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout6,
											  WE => AndOut6 );
reg7_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout7,
											  WE => AndOut7 );
reg8_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout8,
											  WE => AndOut8 );
reg9_Mod : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => Din,
											  Dout => RegDout9,
											  WE => AndOut9 );
reg10_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout10,
											   WE => AndOut10 );
reg11_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout11,
											   WE => AndOut11 );
reg12_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout12,
											   WE => AndOut12 );
reg13_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout13,
											   WE => AndOut13 );
reg14_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout14,
											   WE => AndOut14 );
reg15Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout15,
											   WE => AndOut15 );
reg16_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout16,
											   WE => AndOut16 );
reg17_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout17,
											   WE => AndOut17 );
reg18_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout18,
											   WE => AndOut18 );
reg19_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout19,
											   WE => AndOut19 );
reg20_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout20,
											   WE => AndOut20 );
reg21_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout21,
											   WE => AndOut21 );
reg22_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout22,
											   WE => AndOut22 );
reg23_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout23,
											   WE => AndOut23 );
reg24_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout24,
											   WE => AndOut24 );
reg25_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout25,
											   WE => AndOut25 );
reg26_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout26,
											   WE => AndOut26 );
reg27_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout27,
											   WE => AndOut27 );
reg28_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout28,
											   WE => AndOut28 );
reg29_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout29,
											   WE => AndOut29 );
reg30_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout30,
											   WE => AndOut30 );
reg31_Mod : Register32bit Port Map( Reset => Reset,
											   Clk => Clk,
											   Din => Din,
											   Dout => RegDout31,
											   WE => AndOut31 );
mux32a_Mod : Mux32to1 Port Map ( In0 => RegDout0,
										   In1 => RegDout1,
										   In2 => RegDout2,
										   In3 => RegDout3,
										   In4 => RegDout4,
										   In5 => RegDout5,
										   In6 => RegDout6,
										   In7 => RegDout7,
										   In8 => RegDout8,
										   In9 => RegDout9,
										   In10 => RegDout10,
										   In11 => RegDout11,
										   In12 => RegDout12,
										   In13 => RegDout13,
										   In14 => RegDout14,
										   In15 => RegDout15,
										   In16 => RegDout16,
										   In17 => RegDout17,
										   In18 => RegDout18,
										   In19 => RegDout19,
										   In20 => RegDout20,
										   In21 => RegDout21,
										   In22 => RegDout22,
										   In23 => RegDout23,
										   In24 => RegDout24,
										   In25 => RegDout25,
										   In26 => RegDout26,
										   In27 => RegDout27,
										   In28 => RegDout28,
										   In29 => RegDout29,
										   In30 => RegDout30,
										   In31 => RegDout31,
										   Sel => Ard1,
										   Out_Mux => MuxtoMux1 );
mux32b_Mod : Mux32to1 Port Map ( In0 => RegDout0,
										   In1 => RegDout1,
										   In2 => RegDout2,
										   In3 => RegDout3,
										   In4 => RegDout4,
										   In5 => RegDout5,
										   In6 => RegDout6,
										   In7 => RegDout7,
										   In8 => RegDout8,
										   In9 => RegDout9,
										   In10 => RegDout10,
										   In11 => RegDout11,
										   In12 => RegDout12,
										   In13 => RegDout13,
										   In14 => RegDout14,
										   In15 => RegDout15,
										   In16 => RegDout16,
										   In17 => RegDout17,
										   In18 => RegDout18,
										   In19 => RegDout19,
										   In20 => RegDout20,
										   In21 => RegDout21,
										   In22 => RegDout22,
										   In23 => RegDout23,
										   In24 => RegDout24,
										   In25 => RegDout25,
										   In26 => RegDout26,
										   In27 => RegDout27,
										   In28 => RegDout28,
										   In29 => RegDout29,
										   In30 => RegDout30,
										   In31 => RegDout31,
										   Sel => Ard2,
										   Out_Mux => MuxtoMux2 );
compa_Mod : Compare_Module Port Map ( We => WrEn,
												  In0 => Awr,
												  In1 => Ard1,
												  Out_Compare => ComptoSel1);

compb_Mod : Compare_Module Port Map ( We => WrEn,
												  In0 => Awr,
												  In1 => Ard2,
												  Out_Compare => ComptoSel2);
mux2a_Mod : Mux2to1 Port Map ( In0 => MuxtoMux1,
										 In1 => Din,
										 Sel => ComptoSel1,
										 Out_Mux => Dout1);

mux2b_Mod : Mux2to1 port map ( In0 => MuxtoMux2,
										 In1 => Din,
										 Sel => ComptoSel2,
										 Out_Mux => Dout2);

end Behavioral;

