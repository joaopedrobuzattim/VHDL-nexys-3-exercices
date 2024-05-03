library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity circ9 is
    Port ( a : in  INTEGER RANGE 0 TO 15;
           b : out INTEGER RANGE 0 TO 3);
end circ9;

architecture Behavioral of circ9 is

begin
	b <= 0 when  a = 0 ELSE
	 1 when  a = 1 ELSE
	 2 when  a = 2 ELSE
	 3 when  a = 3 ELSE
	 3 when  a = 4 ELSE
	 3 when  a = 5 ELSE
	 1 when  a = 6 ELSE
	 2 when  a = 7 ELSE
	 3 when  a = 8 ELSE
	 1 when  a = 9 ELSE
	 2 when  a = 10 ELSE
	 3 when  a = 11 ELSE
	 0  when  a = 12 ELSE
	 3 when a = 13 ELSE
	 3 when  a = 14 ELSE
	 1;
	
end Behavioral;

