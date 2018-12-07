----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:04 03/25/2015 
-- Design Name: 
-- Module Name:    YOLO - Behavioral 
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

entity YOLO is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end YOLO;

architecture Behavioral of YOLO is

component DATAPATH is
    Port ( PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
			  PC_Imm_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           RF_WrEn : in  STD_LOGIC;
           RF_WrData_sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  Choose_Byte_sel : in  STD_LOGIC_VECTOR (1 downto 0);
			  ALU_A_Sel : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Bin_sel : in  STD_LOGIC_VECTOR (2 downto 0);
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
end component;

component CONTROL is
    Port ( Zero : in  STD_LOGIC;
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  Rst : out STD_LOGIC;
			  PC_sel : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
			  PC_Imm_sel : out  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (2 downto 0);
			  Choose_Byte_sel : out  STD_LOGIC_VECTOR (1 downto 0);
			  ALU_A_Sel : out  STD_LOGIC_VECTOR (2 downto 0);
           ALU_Bin_sel : out  STD_LOGIC_VECTOR (2 downto 0);
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
			  RegEn1 : out  STD_LOGIC;
			  RegEn2 : out  STD_LOGIC;
			  RegEn3 : out  STD_LOGIC;
			  RegEn4 : out  STD_LOGIC;
			  baseaddr_En : out  STD_LOGIC;
			  Mem_Addr_sel : out  STD_LOGIC_VECTOR (2 downto 0);
           Mem_WrEn : out  STD_LOGIC;
           Mem_DataIn_sel : out  STD_LOGIC;
			  Mem_DataIn2_sel : out  STD_LOGIC;
           Mem_DataOut_sel : out  STD_LOGIC;
			  reg1mem_En : out  STD_LOGIC;
			  RegMemEn1 : out  STD_LOGIC;
			  RegMemEn2 : out  STD_LOGIC;
			  RegMemEn3 : out  STD_LOGIC;
			  RegMemEn4 : out  STD_LOGIC);
end component;

		  signal	     SInstruction :   STD_LOGIC_VECTOR (31 downto 0);
		  signal      Szero :   STD_LOGIC;
		  signal		  SRst :  STD_LOGIC;
		  signal      SPC_Sel :   STD_LOGIC;
		  signal      SPC_Len :  STD_LOGIC;
		  signal      SPC_Imm_sel :  STD_LOGIC;
		  signal      SRF_B_Sel :   STD_LOGIC;
		  signal      SRF_WrEn :  STD_LOGIC;
		  signal      SRF_WrData_sel :  STD_LOGIC_VECTOR (2 downto 0);
		  signal      SChoose_Byte_sel :  STD_LOGIC_VECTOR (1 downto 0);
		  signal      SALU_A_Sel :   STD_LOGIC_VECTOR (2 downto 0);
		  signal      SALU_Bin_sel :  STD_LOGIC_VECTOR (2 downto 0);
		  signal      SALU_func :  STD_LOGIC_VECTOR (3 downto 0);
		  signal      SRegEn1 :  STD_LOGIC;
		  signal      SRegEn2 :  STD_LOGIC;
		  signal      SRegEn3 :  STD_LOGIC;
		  signal      SRegEn4 :  STD_LOGIC;
		  signal      Sbaseaddr_En :  STD_LOGIC;
		  signal      SMem_Addr_sel :  STD_LOGIC_VECTOR (2 downto 0);
		  signal      SMEM_Din_sel :   STD_LOGIC;
		  signal      SMEM_Din2_sel :   STD_LOGIC;
		  signal      SMEM_WrEn :  STD_LOGIC;
		  signal      SMEM_Dout_sel :  STD_LOGIC;
		  signal      Sreg1mem_En :  STD_LOGIC;
		  signal		  SRegMemEn1 :  STD_LOGIC;
		  signal		  SRegMemEn2 :  STD_LOGIC;
		  signal		  SRegMemEn3 :  STD_LOGIC;
		  signal		  SRegMemEn4 :  STD_LOGIC;

begin
	
	d: DATAPATH Port map (
			  PC_sel => SPC_Sel,
           PC_LdEn => SPC_Len,
			  PC_Imm_sel => SPC_Imm_sel,
           RF_B_sel => SRF_B_Sel,
           RF_WrEn => SRF_WrEn,
           RF_WrData_sel => SRF_WrData_sel,
			  Choose_Byte_sel => SChoose_Byte_sel,
			  ALU_A_Sel => SALU_A_Sel,
           ALU_Bin_sel => SALU_Bin_sel,
           ALU_func => SALU_func,
			  RegEn1 => SRegEn1,
			  RegEn2 => SRegEn2,
			  RegEn3 => SRegEn3,
			  RegEn4 => SRegEn4,
			  baseaddr_En => Sbaseaddr_En,
			  Mem_Addr_sel => SMem_Addr_sel,
           Mem_WrEn => SMEM_WrEn,
           Mem_DataIn_sel => SMEM_Din_sel,
			  Mem_DataIn2_sel => SMEM_Din2_sel,
           Mem_DataOut_sel => SMEM_Dout_sel,
			  reg1mem_En => Sreg1mem_En,
			  RegMemEn1 => SRegMemEn1,
			  RegMemEn2 => SRegMemEn2,
			  RegMemEn3 => SRegMemEn3,
			  RegMemEn4 => SRegMemEn4,
           Clk => Clk,
			  Reset => SRst,
           Instr => SInstruction,
			  Zero => Szero);
			  
	c: CONTROL Port map (
		     Zero => Szero,
           Instruction => SInstruction,
           Clk => Clk,
           Reset => Reset,
			  Rst => SRst,
			  PC_sel => SPC_Sel,
           PC_LdEn => SPC_Len,
			  PC_Imm_sel => SPC_Imm_sel,
           RF_B_sel => SRF_B_Sel,
           RF_WrEn => SRF_WrEn,
           RF_WrData_sel => SRF_WrData_sel,
			  Choose_Byte_sel => SChoose_Byte_sel,
			  ALU_A_Sel => SALU_A_Sel,
           ALU_Bin_sel => SALU_Bin_sel,
           ALU_func => SALU_func,
			  RegEn1 => SRegEn1,
			  RegEn2 => SRegEn2,
			  RegEn3 => SRegEn3,
			  RegEn4 => SRegEn4,
			  baseaddr_En => Sbaseaddr_En,
			  Mem_Addr_sel => SMem_Addr_sel,
           Mem_WrEn => SMEM_WrEn,
           Mem_DataIn_sel => SMEM_Din_sel,
			  Mem_DataIn2_sel => SMEM_Din2_sel,
           Mem_DataOut_sel => SMEM_Dout_sel,
			  reg1mem_En => Sreg1mem_En,
			  RegMemEn1 => SRegMemEn1,
			  RegMemEn2 => SRegMemEn2,
			  RegMemEn3 => SRegMemEn3,
			  RegMemEn4 => SRegMemEn4);


end Behavioral;

