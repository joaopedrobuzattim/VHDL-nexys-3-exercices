library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.std_logic_arith.ALL;


entity circ10 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           o : out  STD_LOGIC_VECTOR (4 downto 0));
end circ10;

architecture Behavioral of circ10 is
		signal tmp : STD_LOGIC_VECTOR(4 downto 0);
begin
	tmp <= ('0' & A );
	o <= (tmp + B) WHEN op = "00" ELSE
			 ( tmp and B) WHEN op = "01" ELSE
			 ((tmp) or B) WHEN op = "10" ELSE 
			 not(tmp);		
end Behavioral;

