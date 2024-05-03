library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Circ2 is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           c : inout  STD_LOGIC;
           y : out  STD_LOGIC);
end Circ2;

architecture Behavioral of Circ2 is

begin
	c <= a(0) xor a(1);
	y <= (not c) or (a(1) and a(2)) or (not a(2));
end Behavioral;

