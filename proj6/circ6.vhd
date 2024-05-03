library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity circ6 is
    Port ( X : out  STD_LOGIC;
           A : in  INTEGER RANGE 0 TO 15);
end circ6;

architecture Behavioral of circ6 is
	signal tmp1 : STD_LOGIC;
	signal tmp2 : STD_LOGIC;
begin
	tmp1 <= '1'  when  A < 3 ELSE
			  '0';
	tmp2 <= '1'  when  A > 12 ELSE
			  '0';	
	X <= tmp1 or tmp2; 

end Behavioral;

