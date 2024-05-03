
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity disp_int is
    Port ( numero : in  INTEGER range 0 to 15;
           saida : out  STD_LOGIC_VECTOR(6 downto 0));
end disp_int;

architecture Behavioral of disp_int is

begin

	with numero select
	saida <= "0000001" when 0,
				"1001111" when 1,
				"0010010" when 2,
				"0000110" when 3,
				"1001100" when 4,
				"0100100" when 5,
				"0100000" when 6,
				"0001111" when 7,
				"0000000" when 8,
				"0000100" when 9,
				"0001000" when 10,
				"1100000" when 11,
				"0110001" when 12,
				"1000010" when 13,
				"0110000" when 14,
				"0111000" when others;

end Behavioral;