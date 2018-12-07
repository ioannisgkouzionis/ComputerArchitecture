----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:07 03/25/2015 
-- Design Name: 
-- Module Name:    CONTROL - Behavioral 
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

entity CONTROL is
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
end CONTROL;

architecture Behavioral of CONTROL is

type state is (start,Rtype1,Rtype2,Rtype3,Ltype,Itype,Btype,Btype1,Beqtype,Beqtype1,Bnetype,Bnetype1,Lbtype,Lwtype,Sbtype,Swtype,Stype,Cmovtype,Cmovtype1,Mmxtype,Mmxtype1,Mmxtype2,Mmxtype3,Mmxtype4,Bermtype,Bermtype1,Bnemtype,Bnemtype1,Bnemtype2,Bpmtype,Bpmtype1,Bpmtype2,Bpmtype3,Bpmtype4,Bpmtype5,Bpmtype6,Bpmtype7,Bpmtype0,Bpmtype01,Bpmtype02,Bpmtype03,Bumtype,Bumtype1,Bumtype2,Bumtype3,Bumtype4,Bumtype5,Bumtype6);
signal Fsm : state;

begin

process
	begin
		wait until(Clk'event and Clk='1');
		if(Reset = '1') then
			Rst <= '1';
			PC_sel <= '0';
			PC_LdEn <= '0';
			PC_Imm_sel <= '0';
			RF_B_sel <= '0';
			RF_WrEn <= '0';
			RF_WrData_sel <= "000";
			Choose_Byte_sel <= "00";
			ALU_A_Sel <= "000";
			ALU_Bin_sel <= "000";
			ALU_func <= "0000";
			RegEn1 <= '0';
			RegEn2 <= '0';
			RegEn3 <= '0';
			RegEn4 <= '0';
			baseaddr_En <= '0';
			Mem_Addr_sel <= "000";
			Mem_DataIn_sel <= '0';
			Mem_DataIn2_sel <= '0';
			Mem_WrEn <= '0';
			Mem_DataOut_sel <= '0';
			reg1mem_En <= '0';
			RegMemEn1 <= '0';
			RegMemEn2 <= '0';
			RegMemEn3 <= '0';
			RegMemEn4 <= '0';
			Fsm <= start;
		else
			case Fsm is
				when start => 
					Rst<='0';	
					PC_LdEn<='0';
					Mem_WrEn<='0';
					RF_WrEn<='0';
					RegEn1 <= '0';
					RegEn2 <= '0';
					RegEn3 <= '0';
					RegEn4 <= '0';
					reg1mem_En <= '0';
					baseaddr_En <= '0';
					RegMemEn1 <= '0';
					RegMemEn2 <= '0';
					RegMemEn3 <= '0';
					RegMemEn4 <= '0';
					
					if(Instruction(31 downto 26)="100000") then
						RF_B_sel<='0';
						RF_WrEn<='0';
						ALU_A_Sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='0';
						Fsm<=Rtype1;
					elsif ((Instruction(31 downto 26)="111000" or Instruction(31 downto 26)="111001") and Instruction(20 downto 16)/="00000") then --li,lui
						RF_B_sel<='0';
						RF_WrEn<='0';
						RF_WrData_sel<="010";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Ltype;
					elsif(Instruction(31 downto 26)="110000") then --addi
						RF_B_sel<='0';
						RF_WrEn<='0';
						ALU_A_Sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0000";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="110010") then --andi
						RF_B_sel<='0';
						RF_WrEn<='0';
						ALU_A_Sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0010";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="110011") then --ori
						RF_B_sel<='0';
						RF_WrEn<='0';
						ALU_A_Sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0011";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="111111") then --b
						PC_Imm_sel <= '0';
						PC_sel<='1';
						PC_LdEn<='1';
						Fsm<=Btype;
					elsif(Instruction(31 downto 26)="000000" and Instruction/="00000000000000000000000000000000") then --beq
						RF_B_sel<='1';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "000";
						ALU_func <= "0001";
						Fsm<=Beqtype;
					elsif(Instruction(31 downto 26)="000001") then --bne
						RF_B_sel<='1';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "000";
						ALU_func <= "0001";
						Fsm<=Bnetype;
					elsif(Instruction(31 downto 26)="000011") then --lb
						RF_B_sel<='0';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						Mem_Addr_sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Lbtype;
					elsif(Instruction(31 downto 26)="001111") then --lw
						RF_B_sel<='0';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						Mem_Addr_sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Lwtype;
					elsif(Instruction(31 downto 26)="000111") then --sb
						RF_B_sel<='1';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						Mem_Addr_sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Mem_DataOut_sel <= '0';
						Fsm<=Sbtype;
					elsif(Instruction(31 downto 26)="011111") then --sw
						RF_B_sel<='1';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						Mem_Addr_sel <= "000";
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Mem_DataOut_sel <= '0';
						Fsm<=Swtype;
					elsif(Instruction(31 downto 26)="100001") then --cmov
						RF_B_sel<='0';
						Fsm<=Cmovtype;
					elsif(Instruction(31 downto 26)="100011") then --add_MMX_byte
						RF_B_sel<='0';
						Fsm<=Mmxtype;
					elsif(Instruction(31 downto 26)="100111") then --branch_equal_reg_mem
						RF_B_sel<='1';
						Mem_Addr_sel <= "001";
						Fsm<=Bermtype;
					elsif(Instruction(31 downto 26)="101111") then --branch_not_equal_mem
						RF_B_sel<='1';
						Mem_Addr_sel <= "010";
						Fsm<=Bnemtype;
					elsif(Instruction(31 downto 26)="111100") then --byte_pack_mem
						RF_B_sel<='0';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						baseaddr_En <= '1';
						Fsm<=Bpmtype;
					elsif(Instruction(31 downto 26)="111110") then --byte_unpack_mem
						RF_B_sel<='1';
						ALU_A_Sel <= "000";
						ALU_Bin_sel <= "001";
						ALU_func <= "0000";
						baseaddr_En <= '1';
						Fsm<=Bumtype;
					else
						PC_Imm_sel <= '0';
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Btype;
					end if;
				when Rtype1 =>
					PC_LdEn<='1';
					Alu_Bin_sel<= "000";
					Alu_func<=Instruction(3 downto 0);
					Fsm<=Rtype2;
				when Rtype2 =>
					RF_WrData_sel<="000";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when Rtype3 =>
					RF_WrEn<='0';
					Fsm<=start;
				when Ltype =>
					PC_LdEn<='0';
					RF_WrEn<='1';
					Fsm<=Rtype3;
				when Itype =>
					PC_LdEn<='1';
					Alu_Bin_sel<= "001";
					Fsm<=Rtype2;
				when Btype =>
					PC_sel<='0';
					PC_LdEn<='0';
					Fsm<=Btype1;
				when Btype1 =>
					PC_Imm_sel <= '0';
					Fsm<=start;
				when Beqtype =>
					Fsm<=Beqtype1;
				when Beqtype1 =>
					PC_Imm_sel <= '0';
					if(Zero='1') then
						PC_sel<='1';
						PC_LdEn<='1';
					else
						PC_sel<='0';
						PC_LdEn<='1';
					end if;
					Fsm<=Btype;
				when Bnetype =>
					Fsm<=Bnetype1;
				when Bnetype1 =>
					PC_Imm_sel <= '0';
					if(Zero='1') then
						PC_sel<='0';
						PC_LdEn<='1';
					else
						PC_sel<='1';
						PC_LdEn<='1';
					end if;
					Fsm<=Btype;
				when 	Lbtype =>
					Mem_DataOut_sel <= '1';
					RF_WrData_sel<="001";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when 	Lwtype =>
					Mem_DataOut_sel <= '0';
					RF_WrData_sel<="001";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when 	Sbtype =>
					Mem_DataIn_sel <= '1';
					Mem_DataIn2_sel <= '0';
					Mem_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Stype;
				when 	Swtype =>
					Mem_DataIn_sel <= '0';
					Mem_DataIn2_sel <= '0';
					Mem_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Stype;
				when 	Stype =>
					Mem_WrEn<='0';
					Fsm<=start;
				when Cmovtype =>
					ALU_A_Sel <= "001";
					ALU_Bin_sel <= "000";
					ALU_func <= "0000";
					PC_Imm_sel <= '0';
					if(Zero='1') then
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Btype;
					else
						RF_WrData_sel<="011";
						RF_WrEn<='1';
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Cmovtype1;
					end if;
				when Cmovtype1 =>
					RF_WrEn<='0';
					PC_LdEn<='0';
					Fsm<=Btype1;
				when Mmxtype =>
					Choose_Byte_sel <= "00";
					ALU_A_Sel <= "010";
					ALU_Bin_sel <= "010";
					ALU_func <= "0000";
					RegEn1 <= '1';
					Fsm<=Mmxtype1;
				when Mmxtype1 =>
					RegEn1 <= '0';
					Choose_Byte_sel <= "01";
					RegEn2 <= '1';
					Fsm<=Mmxtype2;
				when Mmxtype2 =>
					RegEn2 <= '0';
					Choose_Byte_sel <= "10";
					RegEn3 <= '1';
					Fsm<=Mmxtype3;
				when Mmxtype3 =>
					RegEn3 <= '0';
					Choose_Byte_sel <= "11";
					RegEn4 <= '1';
					PC_Imm_sel <= '0';
					PC_sel<='0';
					PC_LdEn<='1';
					Fsm<=Mmxtype4;
				when Mmxtype4 =>
					RegEn4 <= '0';
					RF_WrData_sel <= "100";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when Bermtype =>
					ALU_A_Sel <= "011";
					ALU_Bin_sel <= "000";
					ALU_func <= "0001";
					PC_Imm_sel <= '1';
					Fsm<=Bermtype1;
				when Bermtype1 =>
					if(Zero='1') then
						PC_sel<='1';
						PC_LdEn<='1';
						Fsm<=Btype;
					else
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Btype;
					end if;
				when Bnemtype =>
					reg1mem_En <= '1';
					Mem_Addr_sel <= "011";
					Fsm<=Bnemtype1;
				when Bnemtype1 =>
					reg1mem_En <= '0';
					ALU_func <= "0001";
					ALU_A_Sel <= "100";
					ALU_Bin_sel <= "011";
					PC_Imm_sel <= '0';
					Fsm<=Bnemtype2;
				when Bnemtype2 =>
					if(Zero='0') then
						PC_sel<='1';
						PC_LdEn<='1';
						Fsm<=Btype;
					else
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Btype;
					end if;
				when Bpmtype =>
					baseaddr_En <= '0';
					Mem_Addr_sel <= "100";
					RegMemEn1 <= '1';
					ALU_A_Sel <= "101";
					ALU_Bin_sel <= "100";
					Fsm<=Bpmtype0;
				when Bpmtype0 =>
					Fsm<=Bpmtype1;
				when Bpmtype1 =>
					baseaddr_En <= '1';
					RegMemEn1 <= '0';
					Fsm<=Bpmtype2;
				when Bpmtype2 =>
					baseaddr_En <= '0';
					RegMemEn2 <= '1';
					Fsm<=Bpmtype01;
				when Bpmtype01 =>
					Fsm<=Bpmtype3;
				when Bpmtype3 =>
					baseaddr_En <= '1';
					RegMemEn2 <= '0';
					Fsm<=Bpmtype4;
				when Bpmtype4 =>
					baseaddr_En <= '0';
					RegMemEn3 <= '1';
					Fsm<=Bpmtype02;
				when Bpmtype02 =>
					Fsm<=Bpmtype5;
				when Bpmtype5 =>
					baseaddr_En <= '1';
					RegMemEn3 <= '0';
					Fsm<=Bpmtype6;
				when Bpmtype6 =>
					baseaddr_En <= '0';
					RegMemEn4 <= '1';
					Fsm<=Bpmtype03;
				when Bpmtype03 =>
					PC_Imm_sel <= '0';
					PC_sel<='0';
					PC_LdEn<='1';
					Fsm<=Bpmtype7;
				when Bpmtype7 =>
					RegMemEn4 <= '0';
					RF_WrData_sel <= "101";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when Bumtype =>
					baseaddr_En <= '0';
					Mem_Addr_sel <= "100";
					Choose_Byte_sel <= "11";
					Mem_DataIn2_sel <= '1';
					Mem_WrEn<='1';
					Fsm<=Bumtype1;
				when Bumtype1 =>
					Mem_WrEn<='0';
					ALU_A_Sel <= "101";
					ALU_Bin_sel <= "100";
					baseaddr_En <= '1';
					Fsm<=Bumtype2;
				when Bumtype2 =>
					baseaddr_En <= '0';
					Choose_Byte_sel <= "10";
					Mem_WrEn<='1';
					Fsm<=Bumtype3;
				when Bumtype3 =>
					Mem_WrEn<='0';
					baseaddr_En <= '1';
					Fsm<=Bumtype4;
				when Bumtype4 =>
					baseaddr_En <= '0';
					Choose_Byte_sel <= "01";
					Mem_WrEn<='1';
					Fsm<=Bumtype5;
				when Bumtype5 =>
					Mem_WrEn<='0';
					baseaddr_En <= '1';
					PC_Imm_sel <= '0';
					PC_sel<='0';
					PC_LdEn<='1';
					Fsm<=Bumtype6;
				when Bumtype6 =>
					baseaddr_En <= '0';
					Choose_Byte_sel <= "00";
					Mem_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Stype;
				end case;
			end if;
		end process;

end Behavioral;

