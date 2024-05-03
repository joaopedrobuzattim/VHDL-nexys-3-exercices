library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity circ is
    Port ( clk : in  STD_LOGIC;
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0));
end circ;

architecture Behavioral of circ is
	signal posMinhoca : integer range 0 to 11;
begin

	process (clk)
		variable cont : integer range 0 to 50_000_000; -- conta meio segundo
		variable mi, ce, de, un : std_logic_vector(6 downto 0);
		variable contMux : integer range 0 to  1_000_000;
	begin
		if rising_edge(clk) then
			if cont < 50_000_000  then cont := cont +1;
			else cont := 0;
			end if; -- if do cont
			
			if cont = 0 then  -- quer dizer que deu meio segundo
				if posMinhoca < 11 then posMinhoca <= posMinhoca +1;
				else posMinhoca <= 0;
				end if;
			end if; -- if do fim do contador
			
			if posMinhoca = 0 
				then  mi := "1111111";
						ce := "1111111";
						de := "1111111";
						un := "0000111";
			elsif posMinhoca = 1
				then  mi := "1111111";
						ce := "1111111";
						de := "1110111";
						un := "1000111";
			elsif posMinhoca = 2
				then  mi := "1111111";
						ce := "1110111";
						de := "1110111";
						un := "1100111";
			elsif posMinhoca = 3
				then  mi := "1110111";
						ce := "1110111";
						de := "1110111";
						un := "1100111";
			elsif posMinhoca = 4
				then  mi := "1110011";
						ce := "1110111";
						de := "1110111";
						un := "1111111";
			elsif posMinhoca = 5
				then  mi := "1110001";
						ce := "1110111";
						de := "1111111";
						un := "1111111";
			elsif posMinhoca = 6
				then  mi := "0110001";
						ce := "1111111";
						de := "1111111";
						un := "1111111";
			elsif posMinhoca = 7
				then  mi := "0111001";
						ce := "0111111";
						de := "1111111";
						un := "1111111";
			elsif posMinhoca = 8
				then  mi := "0111101";
						ce := "0111111";
						de := "0111111";
						un := "1111111";
			elsif posMinhoca = 9
				then  mi := "0111111";
						ce := "0111111";
						de := "0111111";
						un := "0111111";
			elsif posMinhoca = 10
				then  mi := "1111111";
						ce := "0111111";
						de := "0111111";
						un := "0011111";
			else 
						mi := "1111111";
						ce := "1111111";
						de := "0111111";
						un := "0000111";
			end if; --pos minhoca
			
			
			if contMux < 1_000_000
				then contMux := contMux + 1;
				else contMux  := 0;
			end if;
			
			if contMux < 250_000
				then d <= mi; -- disp recebe milhar
					  sel <= "0111"; --liga disp do milhar
			elsif contMux < 500_000
				then d <= ce; -- disp recebe milhar
					  sel <= "1011"; --liga disp do milhar
			elsif contMux < 750_000
				then d <= de; -- disp recebe milhar
					  sel <= "1101"; --liga disp do milhar
			else
				     d <= un; -- disp recebe milhar
					  sel <= "1110"; --liga disp do milhar
			end if;
					  
		end if; --rising edge		
	end process;

end Behavioral;

