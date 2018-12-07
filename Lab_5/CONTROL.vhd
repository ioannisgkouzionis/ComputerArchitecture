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
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : out  STD_LOGIC;
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           Mem_WrEn : out  STD_LOGIC;
           Mem_DataIn_sel : out  STD_LOGIC;
           Mem_DataOut_sel : out  STD_LOGIC);
end CONTROL;

architecture Behavioral of CONTROL is

type state is (start,Rtype1,Rtype2,Rtype3,Ltype,Itype,Btype,Btype1,Beqtype,Beqtype1,Bnetype,Bnetype1,Lbtype,Lwtype,Sbtype,Swtype,Stype);
signal Fsm : state;

begin

process
	begin
		wait until(Clk'event and Clk='1');
		if(Reset = '1') then
			Rst <= '1';
			PC_sel <= '0';
			PC_LdEn <= '0';
			RF_B_sel <= '0';
			RF_WrEn <= '0';
			RF_WrData_sel <= "00";
			ALU_Bin_sel <= '0';
			ALU_func <= "0000";
			Mem_DataIn_sel <= '0';
			Mem_WrEn <= '0';
			Mem_DataOut_sel <= '0';
			Fsm <= start;
		else
			case Fsm is
				when start => 
					Rst<='0';	
					PC_LdEn<='0';
					Mem_WrEn<='0';
					RF_WrEn<='0';
					
					if(Instruction(31 downto 26)="100000") then
						RF_B_sel<='0';
						RF_WrEn<='0';
						PC_sel<='0';
						PC_LdEn<='0';
						Fsm<=Rtype1;
					elsif ((Instruction(31 downto 26)="111000" or Instruction(31 downto 26)="111001") and Instruction(20 downto 16)/="00000") then --li,lui
						RF_B_sel<='0';
						RF_WrEn<='0';
						RF_WrData_sel<="10";
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Ltype;
					elsif(Instruction(31 downto 26)="110000") then --addi
						RF_B_sel<='0';
						RF_WrEn<='0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0000";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="110010") then --andi
						RF_B_sel<='0';
						RF_WrEn<='0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0010";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="110011") then --ori
						RF_B_sel<='0';
						RF_WrEn<='0';
						PC_sel<='0';
						PC_LdEn<='0';
						ALU_func <= "0011";
						Fsm<=Itype;
					elsif(Instruction(31 downto 26)="111111") then --b
						PC_sel<='1';
						PC_LdEn<='1';
						Fsm<=Btype;
					elsif(Instruction(31 downto 26)="000000" and Instruction/="00000000000000000000000000000000") then --beq
						RF_B_sel<='1';
						ALU_Bin_sel <= '0';
						ALU_func <= "0001";
						Fsm<=Beqtype;
					elsif(Instruction(31 downto 26)="000001") then --bne
						RF_B_sel<='1';
						ALU_Bin_sel <= '0';
						ALU_func <= "0001";
						Fsm<=Bnetype;
					elsif(Instruction(31 downto 26)="000011") then --lb
						RF_B_sel<='0';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Lbtype;
					elsif(Instruction(31 downto 26)="001111") then --lw
						RF_B_sel<='0';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Lwtype;
					elsif(Instruction(31 downto 26)="000111") then --sb
						RF_B_sel<='1';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						PC_sel<='0';
						PC_LdEn<='1';
						Mem_DataOut_sel <= '0';
						Fsm<=Sbtype;
					elsif(Instruction(31 downto 26)="011111") then --sw
						RF_B_sel<='1';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						PC_sel<='0';
						PC_LdEn<='1';
						Mem_DataOut_sel <= '0';
						Fsm<=Swtype;
					else
						PC_sel<='0';
						PC_LdEn<='1';
						Fsm<=Btype;
					end if;
				when Rtype1 =>
					PC_LdEn<='1';
					Alu_Bin_sel<='0';
					Alu_func<=Instruction(3 downto 0);
					Fsm<=Rtype2;
				when Rtype2 =>
					RF_WrData_sel<="00";
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
					Alu_Bin_sel<='1';
					Fsm<=Rtype2;
				when Btype =>
					PC_sel<='0';
					PC_LdEn<='0';
					Fsm<=Btype1;
				when Btype1 =>
					Fsm<=start;
				when Beqtype =>
					Fsm<=Beqtype1;
				when Beqtype1 =>
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
					RF_WrData_sel<="01";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when 	Lwtype =>
					Mem_DataOut_sel <= '0';
					RF_WrData_sel<="01";
					RF_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Rtype3;
				when 	Sbtype =>
					Mem_DataIn_sel <= '1';
					Mem_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Stype;
				when 	Swtype =>
					Mem_DataIn_sel <= '0';
					Mem_WrEn<='1';
					PC_LdEn<='0';
					Fsm<=Stype;
				when 	Stype =>
					Mem_WrEn<='0';
					Fsm<=start;
				end case;
			end if;
		end process;

end Behavioral;

