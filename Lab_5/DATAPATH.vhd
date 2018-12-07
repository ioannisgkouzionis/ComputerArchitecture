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
    Port ( Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC);
end DATAPATH;

architecture Behavioral of DATAPATH is


component Mux4to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           In3 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component khola is Port(
			rd : in  STD_LOGIC_VECTOR (4 downto 0);
			rs : in  STD_LOGIC_VECTOR (4 downto 0);
			rt : in  STD_LOGIC_VECTOR (4 downto 0);
			op : in  STD_LOGIC_VECTOR (5 downto 0);
			lw : in  STD_LOGIC_VECTOR (1 downto 0);
			pc : out  STD_LOGIC;
			mem : out  STD_LOGIC);
end component;

component Mux3to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           In2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component forward is Port(
			rd : in  STD_LOGIC_VECTOR (4 downto 0);
			rd2 : in  STD_LOGIC_VECTOR (4 downto 0);
			en1 : in  STD_LOGIC;
			en2 : in  STD_LOGIC;
			li1 : in  STD_LOGIC_VECTOR (1 downto 0);
			li2 : in  STD_LOGIC_VECTOR (1 downto 0);
			rs : in  STD_LOGIC_VECTOR (4 downto 0);
			rt : in  STD_LOGIC_VECTOR (4 downto 0);
			Rfa : out STD_LOGIC_VECTOR (1 downto 0);
			Rfb : out STD_LOGIC_VECTOR (1 downto 0));
end component;

component register1bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC);
end component;

component register2bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (1 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component register4bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (3 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component register5bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (4 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Register32bit is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pipe_control is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : out  STD_LOGIC;
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           Mem_WrEn : out  STD_LOGIC;
           Mem_DataIn_sel : out  STD_LOGIC;
           Mem_DataOut_sel : out  STD_LOGIC);
end component;

component ALUSTAGE is
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
			  Immed_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  rd_out : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
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
			  PC_sel_2 : in  STD_LOGIC;
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
signal RFB_out : STD_LOGIC_VECTOR (31 downto 0);
signal MemOut : STD_LOGIC_VECTOR (31 downto 0);
signal Zero1Out : STD_LOGIC_VECTOR (31 downto 0);
signal Zero2Out : STD_LOGIC_VECTOR (31 downto 0);
signal Mux1Out : STD_LOGIC_VECTOR (31 downto 0);
signal Mux2Out : STD_LOGIC_VECTOR (31 downto 0);

signal dec_RF_B_sel_sig : STD_LOGIC;
signal dec_RF_WrEn_sig : STD_LOGIC;
signal dec_RF_WrData_sel_sig : STD_LOGIC_VECTOR (1 downto 0);
signal dec_ALU_Bin_sel_sig : STD_LOGIC;
signal dec_ALU_func_sig : STD_LOGIC_VECTOR (3 downto 0);
signal dec_Mem_WrEn_sig : STD_LOGIC;
signal dec_Mem_DataIn_sel_sig : STD_LOGIC;
signal dec_Mem_DataOut_sel_sig : STD_LOGIC;

signal alu_RF_WrEn_sig : STD_LOGIC;
signal alu_RF_WrData_sel_sig : STD_LOGIC_VECTOR (1 downto 0);
signal alu_ALU_Bin_sel_sig : STD_LOGIC;
signal alu_ALU_func_sig : STD_LOGIC_VECTOR (3 downto 0);
signal alu_Mem_WrEn_sig : STD_LOGIC;
signal alu_Mem_DataIn_sel_sig : STD_LOGIC;
signal alu_Mem_DataOut_sel_sig : STD_LOGIC;
signal alu_Immed_signal : STD_LOGIC_VECTOR (31 downto 0);
signal alu_rd : STD_LOGIC_VECTOR (4 downto 0);

signal mem_RF_WrEn_sig : STD_LOGIC;
signal mem_RF_WrData_sel_sig : STD_LOGIC_VECTOR (1 downto 0);
signal mem_Mem_WrEn_sig : STD_LOGIC;
signal mem_Mem_DataIn_sel_sig : STD_LOGIC;
signal mem_Mem_DataOut_sel_sig : STD_LOGIC;
signal mem_AluOut : STD_LOGIC_VECTOR (31 downto 0);
signal mem_rd : STD_LOGIC_VECTOR (4 downto 0);
signal mem_RFB : STD_LOGIC_VECTOR (31 downto 0);
signal mem_Immed_signal : STD_LOGIC_VECTOR (31 downto 0);

signal wb_RF_WrEn_sig : STD_LOGIC;
signal wb_RF_WrData_sel_sig : STD_LOGIC_VECTOR (1 downto 0);
signal wb_AluOut : STD_LOGIC_VECTOR (31 downto 0);
signal wb_MemOut : STD_LOGIC_VECTOR (31 downto 0);
signal wb_rd : STD_LOGIC_VECTOR (4 downto 0);
signal wb_Immed_signal : STD_LOGIC_VECTOR (31 downto 0);

signal rs_signal : STD_LOGIC_VECTOR (4 downto 0);
signal rt_signal : STD_LOGIC_VECTOR (4 downto 0);
signal rfa_signal : STD_LOGIC_VECTOR (1 downto 0);
signal rfb_signal : STD_LOGIC_VECTOR (1 downto 0);
signal rfaMux_toAlu_signal : STD_LOGIC_VECTOR (31 downto 0);

signal instrpc_todec_signal : STD_LOGIC_VECTOR (31 downto 0);
signal PC_sel_2_sig : STD_LOGIC;
signal mem_muxPC_sig : STD_LOGIC;

begin

alu_stage : ALUSTAGE Port map ( RF_A => rfaMux_toAlu_signal, 
										  RF_B => RFB_Out,
										  Immed => alu_Immed_signal,
										  ALU_Bin_sel => alu_ALU_Bin_sel_sig,
										  ALU_func => alu_ALU_func_sig,
										  AluOut_In => mem_AluOut,
										  AluOut_In2 => wb_AluOut,
										  MemOut2 => wb_MemOut,
										  Mux_RFB_sel => rfb_signal,
										  ALU_out => AluOut);
										  
dec_stage : DECSTAGE Port map ( Instr => Instr_IftoDec,
										  RF_WrEn => wb_RF_WrEn_sig,
										  ALU_out => wb_AluOut,
										  MEM_out => MemOut,
										  Immed_out => wb_Immed_signal,
										  rd_out => wb_rd,
										  RF_WrData_sel => wb_RF_WrData_sel_sig,
										  RF_B_sel => dec_RF_B_sel_sig,
										  Clk => Clk,
										  Immed => Immed_signal,
										  RF_A => RFA_Out,
										  RF_B => RFB_Out,
										  Reset => Reset);
										  
if_stage : IFSTAGE Port map ( PC_Immed => Immed_signal,
										PC_sel => '0',
										PC_sel_2 => PC_sel_2_sig,
										PC_LdEn => '1',
										Reset => Reset,
										Clk => Clk,
										Instr => Instr_IftoDec);
										
mem_stage : MEMSTAGE Port map ( clk => Clk,
										  Mem_WrEn => mem_Mem_WrEn_sig,
										  ALU_MEM_Addr => mem_AluOut,
										  MEM_DataIn => Mux1Out,
										  MEM_DataOut => MemOut);
										
mux1_2to1 : Mux2to1 Port map ( In0 => mem_RFB,
										 In1 => Zero1Out,
										 Sel => mem_Mem_DataIn_sel_sig,
										 Out_Mux => Mux1Out);
										 
mux2_2to1 : Mux2to1 Port map ( In0 => MemOut,
										 In1 => Zero2Out,
										 Sel => mem_Mem_DataOut_sel_sig,
										 Out_Mux => Mux2Out);
										 
zero1 : ZeroFill Port map ( In0 => mem_RFB,
								Out0 => Zero1Out);
								
zero2 : ZeroFill Port map ( In0 => MemOut,
								Out0 => Zero2Out);
								
control : pipe_control Port map(Instr => Instr_IftoDec,
										  RF_B_sel => dec_RF_B_sel_sig,
										  RF_WrEn => dec_RF_WrEn_sig,
										  RF_WrData_sel => dec_RF_WrData_sel_sig,
										  ALU_Bin_sel => dec_ALU_Bin_sel_sig,
										  ALU_func => dec_ALU_func_sig,
										  Mem_WrEn => dec_Mem_WrEn_sig,
										  Mem_DataIn_sel => dec_Mem_DataIn_sel_sig,
										  Mem_DataOut_sel => dec_Mem_DataOut_sel_sig);
										  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------										  
											  
dec1_RF_WrEn: register1bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_RF_WrEn_sig,
											  WE => '1',
											  Dout => alu_RF_WrEn_sig);
											  
dec2_RF_WrData_sel: register2bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_RF_WrData_sel_sig,
											  WE => '1',
											  Dout => alu_RF_WrData_sel_sig);											  
				
dec3_ALU_Bin_sel: register1bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_ALU_Bin_sel_sig,
											  WE => '1',
											  Dout => alu_ALU_Bin_sel_sig);
											  
dec4_ALU_func: register4bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_ALU_func_sig,
											  WE => '1',
											  Dout => alu_ALU_func_sig);
											  
dec5_Mem_WrEn: register1bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_Mem_WrEn_sig,
											  WE => '1',
											  Dout => alu_Mem_WrEn_sig);	

dec6_Mem_DataIn_sel: register1bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_Mem_DataIn_sel_sig,
											  WE => '1',
											  Dout => alu_Mem_DataIn_sel_sig);	

dec7_Mem_DataOut_sel: register1bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => dec_Mem_DataOut_sel_sig,
											  WE => '1',
											  Dout => alu_Mem_DataOut_sel_sig);	

dec8_rd: register5bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => Instr_IftoDec(20 downto 16),
											  WE => '1',
											  Dout => alu_rd);		

dec9_Immed: Register32bit Port map( Clk => Clk,
											  Reset => mem_muxPC_sig,
											  Din => Immed_signal,
											  WE => '1',
											  Dout => alu_Immed_signal);											  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
										  
alu1_RF_WrEn: register1bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_RF_WrEn_sig,
											  WE => '1',
											  Dout => mem_RF_WrEn_sig);
											  
alu2_RF_WrData_sel: register2bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_RF_WrData_sel_sig,
											  WE => '1',
											  Dout => mem_RF_WrData_sel_sig);
											  
alu3_Mem_WrEn: register1bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_Mem_WrEn_sig,
											  WE => '1',
											  Dout => mem_Mem_WrEn_sig);	

alu4_Mem_DataIn_sel: register1bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_Mem_DataIn_sel_sig,
											  WE => '1',
											  Dout => mem_Mem_DataIn_sel_sig);	

alu5_Mem_DataOut_sel: register1bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_Mem_DataOut_sel_sig,
											  WE => '1',
											  Dout => mem_Mem_DataOut_sel_sig);	

alu6_rd: register5bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_rd,
											  WE => '1',
											  Dout => mem_rd);		
											  
alu7_AluOut: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => AluOut,
											  WE => '1',
											  Dout => mem_AluOut);	
											  
alu8_RF_B: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => RFB_Out,
											  WE => '1',
											  Dout => mem_RFB);	
											  
alu9_Immed: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => alu_Immed_signal,
											  WE => '1',
											  Dout => mem_Immed_signal);												  

----------------------------------------------------------------------------------------------------------------------------------------------------------------------											  
										  
mem1_RF_WrEn: register1bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => mem_RF_WrEn_sig,
											  WE => '1',
											  Dout => wb_RF_WrEn_sig);
											  
mem2_RF_WrData_sel: register2bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => mem_RF_WrData_sel_sig,
											  WE => '1',
											  Dout => wb_RF_WrData_sel_sig);

mem3_rd: register5bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => mem_rd,
											  WE => '1',
											  Dout => wb_rd);		
											  
mem4_AluOut: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => mem_AluOut,
											  WE => '1',
											  Dout => wb_AluOut);	
											  
mem5_MemOut: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => Mux2Out,
											  WE => '1',
											  Dout => wb_MemOut);	

mem6_Immed: Register32bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => mem_Immed_signal,
											  WE => '1',
											  Dout => wb_Immed_signal);		

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

kutsogolo: forward Port map(
			rd => mem_rd,
			rd2 => wb_rd,
			en1 => mem_RF_WrEn_sig,
			en2 => wb_RF_WrEn_sig,
			li1 => mem_RF_WrData_sel_sig,
			li2 => wb_RF_WrData_sel_sig,
			rs => rs_signal,
			rt => rt_signal,
			Rfa => rfa_signal,
			Rfb => rfb_signal);		

kutsogolo_rs: register5bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => Instr_IftoDec(25 downto 21),
											  WE => '1',
											  Dout => rs_signal);		

kutsogolo_rt: register5bit Port map( Clk => Clk,
											  Reset => Reset,
											  Din => Instr_IftoDec(15 downto 11),
											  WE => '1',
											  Dout => rt_signal);	

mux_rfa_2to1 : Mux4to1 Port map ( In0 => RFA_Out,
										 In1 => mem_AluOut,
										 In2 => wb_AluOut,
										 In3 => wb_MemOut,
										 Sel => rfa_signal,
										 Out_Mux => rfaMux_toAlu_signal);
										 
uloanumaanu : khola Port map (
			rd => alu_rd,
			rs => Instr_IftoDec(25 downto 21),
			rt => Instr_IftoDec(15 downto 11),
			op => Instr_IftoDec(31 downto 26),
			lw => alu_RF_WrData_sel_sig,
			pc => PC_sel_2_sig,
			mem => mem_muxPC_sig);
											  
end Behavioral;


