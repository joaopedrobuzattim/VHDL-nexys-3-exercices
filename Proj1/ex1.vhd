library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ex1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
			  -- nao colocar ; na ultuma linha, antes do parentese
           saida : out  STD_LOGIC);
end ex1;

architecture Behavioral of ex1 is
  signal tmp : std_logic; 
begin
	tmp <= not(not A or (B and C));
	saida <= tmp and a and b;
end Behavioral;

