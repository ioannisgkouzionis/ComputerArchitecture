----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:07 05/16/2015 
-- Design Name: 
-- Module Name:    pipe_control - Behavioral 
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

entity pipe_control is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC_VECTOR (1 downto 0);
           ALU_Bin_sel : out  STD_LOGIC;
           ALU_func : out  STD_LOGIC_VECTOR (3 downto 0);
           Mem_WrEn : out  STD_LOGIC;
           Mem_DataIn_sel : out  STD_LOGIC;
           Mem_DataOut_sel : out  STD_LOGIC);
end pipe_control;

architecture Behavioral of pipe_control is


begin

process(Instr)
	begin
	
           RF_B_sel <='0';
           RF_WrEn <='0';
           RF_WrData_sel <="00";
           ALU_Bin_sel <='0';
           ALU_func <= "0000";
           Mem_WrEn <='0';
           Mem_DataIn_sel <='0';
           Mem_DataOut_sel <='0';
	
	if(Instr(31 downto 26)="100000" and Instr(5 downto 0)="110000") then --add
						RF_B_sel<='0';
						Alu_Bin_sel<='0';
						Alu_func<=Instr(3 downto 0);
						RF_WrData_sel<="00";
						RF_WrEn<='1';
	elsif(Instr(31 downto 26)="111000" and Instr(20 downto 16)/="00000") then --li
						RF_B_sel<='0';
						RF_WrData_sel<="10";
					   RF_WrEn<='1';
	elsif(Instr(31 downto 26)="001111") then --lw
						RF_B_sel<='0';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						Mem_DataOut_sel <= '0';
						RF_WrData_sel<="01";
						RF_WrEn<='1';
	elsif(Instr(31 downto 26)="011111") then --sw
						RF_B_sel<='1';
						ALU_Bin_sel <= '1';
						ALU_func <= "0000";
						Mem_DataOut_sel <= '0';
						Mem_DataIn_sel <= '0';
						Mem_WrEn<='1';
	end if;
end process;
end Behavioral;

