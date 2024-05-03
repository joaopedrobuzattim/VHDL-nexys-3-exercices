library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity circ11 is
    Port ( n : in  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0);
           sel : out  STD_LOGIC_VECTOR (3 downto 0));
end circ11;

architecture Behavioral of circ11 is

component disp is 
	Port ( numero: in std_logic_vector(3 downto 0);
			 saida: out std_logic_vector(6 downto 0));
end component;

begin
	sel <= "1110";
	
	ul : disp port map(n, d);

end Behavioral;

