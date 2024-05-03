library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Circ4 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           W : out  STD_LOGIC);
end Circ4;

architecture Behavioral of Circ4 is

begin
	W <= (A or B) and (C or D);
	
end Behavioral;