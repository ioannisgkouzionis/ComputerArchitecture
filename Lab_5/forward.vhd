----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:49 05/17/2015 
-- Design Name: 
-- Module Name:    forward - Behavioral 
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

entity forward is Port(
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
end forward;

architecture Behavioral of forward is

begin

process(rd,rd2,rs,rt,en1,en2,li1,li2)
	begin

if li2="01" and li1/="01" and li1/="10" then
				If rd2=rs and rd2=rt Then
					Rfa<="11";
					Rfb<="11";
				elsif rd2=rt Then
					Rfa<="00";
					Rfb<="11";
				elsif rd2=rs then
					Rfa<="11";
					Rfb<="00";
				else
					Rfa<="00";
					Rfb<="00";
				end if;
end if;

if en1='1' and li1/="10" and li1/="01" then
		if rd=rs and rd=rt Then
			Rfa<="01";
			Rfb<="01";
		elsif rd=rt Then
			Rfa<="00";
			Rfb<="01";
		elsif rd=rs then
			Rfa<="01";
			Rfb<="00";
		elsif en2='1' and li2/="10" and li2/="01" then
			if rd2=rs and rd2=rt Then
				Rfa<="10";
				Rfb<="10";
			elsif rd2=rt Then
				Rfa<="00";
				Rfb<="10";
			elsif rd2=rs then
				Rfa<="10";
				Rfb<="00";
			else
				Rfa<="00";
				Rfb<="00";
			end if;
		else
			Rfa<="00";
			Rfb<="00";
		end if;
elsif en2='1' and li2/="10" and (en1='0' or li1="10") and li2/="01" then
			if rd2=rs and rd2=rt Then
				Rfa<="10";
				Rfb<="10";
			elsif rd2=rt Then
				Rfa<="00";
				Rfb<="10";
			elsif rd2=rs then
				Rfa<="10";
				Rfb<="00";
			else
				Rfa<="00";
				Rfb<="00";
			end if;
else
	Rfa<="00";
	Rfb<="00";
end if;

If en2='1' and li2/="10" and en1='1' and li1/="10" and rd2/=rd and li2/="01" and li1/="01" then
			if rd2=rs and rd=rt Then
				Rfa<="10";
				Rfb<="01";
			elsif rd=rs and rd2=rt Then
				Rfa<="01";
				Rfb<="10";
			end if;
end if;




end process;

end Behavioral;

