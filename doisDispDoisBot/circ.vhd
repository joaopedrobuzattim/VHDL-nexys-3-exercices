library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity circ is
    Port ( clk, bUp, bDown : in  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0));
end circ;

architecture Behavioral of circ is
	signal bUpLimpo,bUpLimpoAnt ,bDownLimpoAnt, bDownLimpo : std_logic;
	signal cont : integer range 0 to 20;
	signal numero : integer range 0 to 15;
	
	component disp_int is
    Port ( numero : in  INTEGER range 0 to 15;
           saida : out  STD_LOGIC_VECTOR(6 downto 0));
	end component;
	
	component debounce is
    Port ( clk : in  STD_LOGIC;
           botao : in  STD_LOGIC;
           result : out  STD_LOGIC);
	end component;
begin
	u1 : disp_int port map(numero,d);
	u2 : debounce port map(clk, bUp, bUpLimpo);
	u3 : debounce port map(clk, bDown, bDownLimpo);
	
	process(clk)
		variable contDisp : integer range 0 to 1_000_000;
	begin
		if rising_edge(clk) then
			bUpLimpoAnt <= bUpLimpo;
			bDownLimpoAnt <= bDownLimpo;
			
			if bUpLimpo = '1' and bUpLimpoAnt = '0' -- presionaram o botao up  
				then if cont < 20 then cont <= cont +1;
									  else cont <= 0;
						end if;
			end if;
			
			if bDownLimpo = '1' and bDownLimpoAnt = '0' -- presionaram o botao down  
				then if cont > 0 then cont <= cont - 1;
									  else cont <= 20;
						end if;
			end if;
			
			
			if contDisp < 1_000_000 then contDisp :=contDisp +1;
					else contDisp := 0; 
			end if; -- if do contDisp
				
			if contDisp < 500_000
				then sel <= "1110"; 
						if cont < 10 then numero <= cont;
						elsif cont = 20 then numero <= 0;
						else numero <= cont - 10;
						end if;
			else 
					sel <= "1101";
					if cont < 10 then numero <= 0;
					elsif cont = 20 then  numero <= 2;
					else numero <= 1;
					end if;
			end if;

		
		end if; -- rising edge
	end process;

end Behavioral;

