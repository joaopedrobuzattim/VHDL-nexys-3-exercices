library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circ3 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : out  STD_LOGIC;
           E : out  STD_LOGIC);
end circ3;

architecture Behavioral of circ3 is
	signal tmp0 : STD_LOGIC;
	signal tmp1 : STD_LOGIC;
	signal tmp2 : STD_LOGIC;
	signal tmp3 : STD_LOGIC;
begin
	D <= A or B;
	tmp0 <= (not A) and (not B) and c;
	tmp1 <= B and (not C);
	tmp2 <= A and (not C);
	tmp3 <= A and B;
	
	E <= tmp0 or tmp1 or tmp2 or tmp3;

end Behavioral;

