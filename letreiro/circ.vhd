library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circ is
    Port ( clk : in  STD_LOGIC;
			  switch: in STD_LOGIC;	
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0));
end circ;

architecture Behavioral of circ is
	type array1Du is array (natural range <>) of integer range 0 to 7;
	component disp_lula is
    Port ( numero : in  INTEGER range 0 to 4;
           saida : out  STD_LOGIC_VECTOR(6 downto 0));
	end component;
	signal dez, uni, numero, centena, mil : integer range 0 to 12;
	signal arr : array1Du (1 to 5);
begin
	
	u1 : disp_lula port map(numero, d);
	arr <= (0, 1, 2, 3, 4);
	dez <= 0;
	uni <= 1;
	mil <= 0;
	centena <= 2;
	
	process(clk)
		variable cont : integer range 0 to 1_000_000;
		variable cont2 : integer range 0 to 5;
	begin
		if rising_edge(clk)
			then 
				if cont < 1_000_000 then cont := cont +1;
					else cont := 0; 
				end if; -- if do cont
				if cont = 0 then  -- quer dizer que deu meio segundo
					if cont2 < 5 then cont2 <= cont2 +1;
					else cont2 <= 0;
				end if;
				
				if switch = '0'  then
					if cont < 250_000
						then sel <= "0111"; --liga display da dezena
							  numero <= mil;
					elsif( cont < 500_000 )
						then
							sel <= "1011";
							numero <= centena;
					elsif( cont < 700_000 )
						then
							sel <= "1101";
							numero <= dez;
					else 
							sel <= "1110";
							numero <= uni;
					end if;
				else
					if cont < 500_000
						then sel <= "1110"; 
							  numero <= 4;
					else 
						sel <= "1101"; 
							  numero <= 3;
					end if;
				end if;	
		end if; --if do rising edge
	end process;

end Behavioral;

