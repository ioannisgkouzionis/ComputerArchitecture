----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:39 03/11/2015 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrEn : in  STD_LOGIC;
           ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
           MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_WrData_sel : in  STD_LOGIC;
           RF_B_sel : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : out  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC--;
           --Opcode : in  STD_LOGIC_VECTOR (5 downto 0)
			  );
end DECSTAGE;

architecture Behavioral of DECSTAGE is

component Mux2to1 is
    Port ( In0 : in  STD_LOGIC_VECTOR (31 downto 0);
           In1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Imm16_to_32 is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           Imm : in  STD_LOGIC_VECTOR (15 downto 0);
           Out32bit : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux2to1_5bit is
    Port ( In0 : in  STD_LOGIC_VECTOR (4 downto 0);
           In1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Sel : in  STD_LOGIC;
           Out_Mux : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component Register_File is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Reset : in  STD_LOGIC;
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal muxtoDin : STD_LOGIC_VECTOR (31 downto 0);
signal muxtoArd2 : STD_LOGIC_VECTOR (4 downto 0);

begin

mux_2to1 : Mux2to1 Port map ( In0 => ALU_out,
									   In1 => MEM_out,
									   Sel => RF_WrData_sel,
									   Out_Mux => muxtoDin );
									  
mux_2to1_5bit: Mux2to1_5bit Port map ( In0 => Instr(15 downto 11),
													In1 => Instr(20 downto 16),
													Sel => RF_B_sel,
													Out_Mux => muxtoArd2 );
													
imm_16to32: Imm16_to_32 Port map ( Opcode => Instr(31 downto 26), 
											  Imm => Instr(15 downto 0),
											  Out32bit => Immed );
											  
regfile: Register_File Port map ( Ard1 => Instr(25 downto 21),
											 Ard2 => muxtoArd2,
											 Reset => Reset,
											 Awr => Instr(20 downto 16),
											 Din => muxtoDin,
											 Clk => Clk,
											 WrEn => RF_WrEn,
											 Dout1 => RF_A,
											 Dout2 => RF_B );

end Behavioral;

