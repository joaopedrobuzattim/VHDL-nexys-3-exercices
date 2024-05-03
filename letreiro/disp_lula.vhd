
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity disp_lula is
    Port ( numero : in  INTEGER range 0 to 4;
           saida : out  STD_LOGIC_VECTOR(6 downto 0));
end disp_lula;

architecture Behavioral of disp_lula is

begin

	with numero select
	saida <= "1110001" when 0, -- L
				"0001000" when 1, -- A
				"1000001" when 2, -- U
				"1001111" when 3, -- 1;
				"0000110" when others; -- 3
end Behavioral;