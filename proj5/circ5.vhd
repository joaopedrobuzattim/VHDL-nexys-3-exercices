library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circ5 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           x : out  STD_LOGIC);
end circ5;

architecture Behavioral of circ5 is

begin
	x <= (a and b) or ( b and c)

end Behavioral;

