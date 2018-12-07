----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:40 03/25/2015 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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

entity DATAPATH is
    Port ( PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
			  PC_Imm_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           RF_WrEn : in  STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  Choose_Byte_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  ALU_A_Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  RegEn1 : in  STD_LOGIC;
			  RegEn2 : in  STD_LOGIC;
			  RegEn3 : in  STD_LOGIC;
			  RegEn4 : in  STD_LOGIC;
			  baseaddr_En : in  STD_LOGIC;
			  Mem_Addr_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Mem_WrEn : in  STD_LOGIC;
           Mem_DataIn_sel : in  STD_LOGIC;
			  Mem_DataIn2_sel : in  STD_LOGIC;
           Mem_DataOut_sel : in  STD_LOGIC;
			  reg1mem_En : in  STD_LOGIC;
			  RegMemEn1 : in  STD_LOGIC;
			  RegMemEn2 : in  STD_LOGIC;
			  RegMemEn3 : in  STD_LOGIC;
			  RegMemEn4 : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0);
			  Zero : out  STD_LOGIC);
end DATAPATH;

architecture Behavioral of DATAPATH is

component mem_dt_in_ext is
 Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
        Out32bit : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register32bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Concatenate is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           In3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Out0 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register8bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Zero7to32 is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           Out0 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux4to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (7 downto 0);
           In1 : in  STD_LOGIC_VECTOR (7 downto 0);
           In2 : in  STD_LOGIC_VECTOR (7 downto 0);
           In3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           OutMux : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Mux8to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           In3 : in  STD_LOGIC_VECTOR (31 downto 0);
           In4 : in  STD_LOGIC_VECTOR (31 downto 0);
           In5 : in  STD_LOGIC_VECTOR (31 downto 0);
           In6 : in  STD_LOGIC_VECTOR (31 downto 0);
           In7 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  ZeroBIn : in  STD_LOGIC_VECTOR (31 downto 0);
			  MemtoAlu : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (31 downto 0);
			  Zero : out  STD_LOGIC;
			  Cout : out  STD_LOGIC;
			  Ovf : out  STD_LOGIC );
end component;

component Mux2to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  Coco_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  Coco_out_Mem : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC
			  );
end component;

component IFSTAGE is
    Port ( PC_Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MEMSTAGE is
    Port ( clk : in  STD_LOGIC;
           Mem_WrEn : in  STD_LOGIC;
           ALU_MEM_Addr : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ZeroFill is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           Out0 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal Instr_IftoDec : STD_LOGIC_VECTOR (31 downto 0);
signal Immed_signal : STD_LOGIC_VECTOR (31 downto 0);
signal AluOut : STD_LOGIC_VECTOR (31 downto 0);
signal RFA_Out : STD_LOGIC_VECTOR (31 downto 0);
signal alu_rfa : STD_LOGIC_VECTOR (31 downto 0);
signal RFB_out : STD_LOGIC_VECTOR (31 downto 0);
signal MemOut : STD_LOGIC_VECTOR (31 downto 0);
signal Zero1Out : STD_LOGIC_VECTOR (31 downto 0);
signal Zero2Out : STD_LOGIC_VECTOR (31 downto 0);
signal Mux1Out : STD_LOGIC_VECTOR (31 downto 0);
signal Mux2Out : STD_LOGIC_VECTOR (31 downto 0);
signal ZeroA : STD_LOGIC_VECTOR (7 downto 0);
signal ZeroB : STD_LOGIC_VECTOR (7 downto 0);
signal ZeroOutA : STD_LOGIC_VECTOR (31 downto 0);
signal ZeroOutB : STD_LOGIC_VECTOR (31 downto 0);
signal re1out : STD_LOGIC_VECTOR (7 downto 0);
signal re2out : STD_LOGIC_VECTOR (7 downto 0);
signal re3out : STD_LOGIC_VECTOR (7 downto 0);
signal re4out : STD_LOGIC_VECTOR (7 downto 0);
signal cocoOut : STD_LOGIC_VECTOR (31 downto 0);
signal mem_addr : STD_LOGIC_VECTOR (31 downto 0);
signal PCoutmux : STD_LOGIC_VECTOR (31 downto 0);
signal reg1memout : STD_LOGIC_VECTOR (31 downto 0);
signal baseaddrout : STD_LOGIC_VECTOR (31 downto 0);
signal regmemout1 : STD_LOGIC_VECTOR (7 downto 0);
signal regmemout2 : STD_LOGIC_VECTOR (7 downto 0);
signal regmemout3 : STD_LOGIC_VECTOR (7 downto 0);
signal regmemout4 : STD_LOGIC_VECTOR (7 downto 0);
signal cocoOutMem : STD_LOGIC_VECTOR (31 downto 0);
signal muxmemdatain_out : STD_LOGIC_VECTOR (31 downto 0);
signal ext_memmux : STD_LOGIC_VECTOR (31 downto 0);

begin

alu_stage : ALUSTAGE Port map ( RF_A => alu_rfa, 
										  RF_B => RFB_Out,
										  Immed => Immed_signal,
										  ZeroBIn => ZeroOutB,
										  MemtoAlu => MemOut,
										  ALU_Bin_sel => ALU_Bin_sel,
										  ALU_func => ALU_func,
										  ALU_out => AluOut,
										  Zero => Zero);
										  
dec_stage : DECSTAGE Port map ( Instr => Instr_IftoDec,
										  RF_WrEn => RF_WrEn,
										  ALU_out => AluOut,
										  MEM_out => Mux2Out,
										  Coco_out => cocoOut,
										  Coco_out_Mem => cocoOutMem,
										  RF_WrData_sel => RF_WrData_sel,
										  RF_B_sel => RF_B_sel,
										  Clk => Clk,
										  Immed => Immed_signal,
										  RF_A => RFA_Out,
										  RF_B => RFB_Out,
										  Reset => Reset);
										  
if_stage : IFSTAGE Port map ( PC_Immed => PCoutmux,
										PC_sel => PC_sel,
										PC_LdEn => PC_LdEn,
										Reset => Reset,
										Clk => Clk,
										Instr => Instr_IftoDec);
										
mem_stage : MEMSTAGE Port map ( clk => Clk,
										  Mem_WrEn => Mem_WrEn,
										  ALU_MEM_Addr => mem_addr,
										  MEM_DataIn => muxmemdatain_out,
										  MEM_DataOut => MemOut);
										
mux1_2to1 : Mux2to1 Port map ( In0 => RFB_Out,
										 In1 => Zero1Out,
										 Sel => Mem_DataIn_sel,
										 Out_Mux => Mux1Out);
										 
mux2_2to1 : Mux2to1 Port map ( In0 => MemOut,
										 In1 => Zero2Out,
										 Sel => Mem_DataOut_sel,
										 Out_Mux => Mux2Out);
										 
zero1 : ZeroFill Port map ( In0 => RFB_Out,
								Out0 => Zero1Out);
								
zero2 : ZeroFill Port map ( In0 => MemOut,
								Out0 => Zero2Out);

mux_8to1 : Mux8to1 Port map ( In0 => RFA_Out,
									   In1 => "00000000000000000000000000000000",
										In2 => ZeroOutA,
										In3 => MemOut,
										In4 => reg1memout,
										In5 => baseaddrout,
										In6 => "00000000000000000000000000000000",
										In7 => "00000000000000000000000000000000",
									   Sel => ALU_A_Sel,
									   Out_Mux => alu_rfa );
				
muxA_4to1 : Mux4to1 Port map ( In0 => RFA_Out(31 downto 24),
									   In1 => RFA_Out(23 downto 16),
										In2 => RFA_Out(15 downto 8),
										In3 => RFA_Out(7 downto 0),
									   Sel => Choose_Byte_sel,
									   OutMux =>ZeroA );
										
muxB_4to1 : Mux4to1 Port map ( In0 => RFB_Out(31 downto 24),
									   In1 => RFB_Out(23 downto 16),
										In2 => RFB_Out(15 downto 8),
										In3 => RFB_Out(7 downto 0),
									   Sel => Choose_Byte_sel,
									   OutMux =>ZeroB );
										
zero_A : Zero7to32 Port map ( In0 => ZeroA,
								     Out0 => ZeroOutA);
					
zero_B : Zero7to32 Port map ( In0 => ZeroB,
								     Out0 => ZeroOutB);
									  
r1 : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => AluOut(7 downto 0),
										 WE => RegEn1,
										 Dout => re1out);
				
r2 : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => AluOut(7 downto 0),
										 WE => RegEn2,
										 Dout => re2out);
									
r3 : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => AluOut(7 downto 0),
										 WE => RegEn3,
										 Dout => re3out);
										
r4 : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => AluOut(7 downto 0),
										 WE => RegEn4,
										 Dout => re4out);
										 
coco : Concatenate Port map (In0 =>re1out,
										 In1 =>re2out,
										 In2 =>re3out,
										 In3 =>re4out,
										 Out0 =>cocoOut);

mux_Mem_Addr : Mux8to1 Port map ( In0 => AluOut,
									   In1 => Immed_signal,
										In2 => RFA_Out,
										In3 => RFB_Out,
										In4 => baseaddrout,
										In5 => "00000000000000000000000000000000",
										In6 => "00000000000000000000000000000000",
										In7 => "00000000000000000000000000000000",
									   Sel => Mem_Addr_sel,
									   Out_Mux => mem_addr );
									
muxPC_Imm : Mux2to1 Port map ( In0 => Immed_signal,
										 In1 => RFA_Out,
										 Sel => PC_Imm_sel,
										 Out_Mux => PCoutmux);
										 
reg1Mem : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => MemOut,
											  Dout => reg1memout,
											  WE => reg1mem_En );
											  
baseaddr : Register32bit Port Map( Reset => Reset,
											  Clk => Clk,
											  Din => AluOut,
											  Dout => baseaddrout,
											  WE => baseaddr_En);
											  
reg2Mem : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => MemOut(7 downto 0),
										 WE => RegMemEn1,
										 Dout => regmemout1);
				
reg3Mem : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => MemOut(7 downto 0),
										 WE => RegMemEn2,
										 Dout => regmemout2);
									
reg4Mem : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => MemOut(7 downto 0),
										 WE => RegMemEn3,
										 Dout => regmemout3);
										
reg5Mem : Register8bit Port map (Clk => Clk,
										 Reset => Reset,
										 Din => MemOut(7 downto 0),
										 WE => RegMemEn4,
										 Dout => regmemout4);
										 
cocoMem : Concatenate Port map (In0 =>regmemout4,
										 In1 =>regmemout3,
										 In2 =>regmemout2,
										 In3 =>regmemout1,
										 Out0 =>cocoOutMem);
									
muxmemdatain : Mux2to1 Port map ( In0 => Mux1Out,
										 In1 => ext_memmux,
										 Sel => Mem_DataIn2_sel,
										 Out_Mux => muxmemdatain_out);
										 
mem_extender : mem_dt_in_ext Port map ( In0 => ZeroB,
													Out32bit => ext_memmux);
								
Instr <= Instr_IftoDec;

end Behavioral;

