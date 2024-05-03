library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity circ8 is
    Port ( a : in  STD_LOGIC;
           s1 : out  STD_LOGIC;
           s2 : out  STD_LOGIC);
end circ8;

architecture Behavioral of circ8 is

begin
	x <= a xor b;

end Behavioral;

