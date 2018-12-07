----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:36 03/11/2015 
-- Design Name: 
-- Module Name:    IF_MEM - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IF_MEM is
port (
	clk : in std_logic;
	addr : in std_logic_vector(9 downto 0);
	dout : out std_logic_vector(31 downto 0));
end IF_MEM;

architecture syn of IF_MEM is

type rom_type is array (1023 downto 0) of std_logic_vector (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return rom_type is
FILE romfile : text is in RomFileName;
variable RomFileLine : line;
variable rom : rom_type;
begin
	for i in 0 to 1023 loop
		readline(romfile, RomFileLine);
		read (RomFileLine, rom(i));
	end loop;
return rom;
end function;

signal ROM : rom_type := InitRomFromFile("rom.data");

begin
	process(clk)
	begin
		if clk'event and clk = '1' then
			dout <= ROM(conv_integer(addr)) ;
		end if;
	end process;


end syn;


