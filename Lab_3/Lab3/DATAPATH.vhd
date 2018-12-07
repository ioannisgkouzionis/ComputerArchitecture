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
           RF_B_sel : in  STD_LOGIC;
           RF_WrEn : in  STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           Mem_WrEn : in  STD_LOGIC;
           Mem_DataIn_sel : in  STD_LOGIC;
           Mem_DataOut_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0);
			  Zero : out  STD_LOGIC);
end DATAPATH;

architecture Behavioral of DATAPATH is

component ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
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

begin

alu_stage : ALUSTAGE Port map ( RF_A => RFA_Out, 
										  RF_B => RFB_Out,
										  Immed => Immed_signal,
										  ALU_Bin_sel => ALU_Bin_sel,
										  ALU_func => ALU_func,
										  ALU_out => AluOut,
										  Zero => Zero);
										  --Cout =>
										  --Ovf => );
										  
dec_stage : DECSTAGE Port map ( Instr => Instr_IftoDec,
										  RF_WrEn => RF_WrEn,
										  ALU_out => AluOut,
										  MEM_out => Mux2Out,
										  RF_WrData_sel => RF_WrData_sel,
										  RF_B_sel => RF_B_sel,
										  Clk => Clk,
										  Immed => Immed_signal,
										  RF_A => RFA_Out,
										  RF_B => RFB_Out,
										  Reset => Reset);
										  
if_stage : IFSTAGE Port map ( PC_Immed => Immed_signal,
										PC_sel => PC_sel,
										PC_LdEn => PC_LdEn,
										Reset => Reset,
										Clk => Clk,
										Instr => Instr_IftoDec);
										
mem_stage : MEMSTAGE Port map ( clk => Clk,
										  Mem_WrEn => Mem_WrEn,
										  ALU_MEM_Addr => AluOut,
										  MEM_DataIn => Mux1Out,
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
								
Instr <= Instr_IftoDec;

end Behavioral;

