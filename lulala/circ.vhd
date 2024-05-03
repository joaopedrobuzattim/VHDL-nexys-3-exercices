----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:48:35 10/25/2022 
-- Design Name: 
-- Module Name:    circ - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity circ is
    Port ( clk : in  STD_LOGIC;
			  switch: in STD_LOGIC;	
           sel : out  STD_LOGIC_VECTOR (3 downto 0);
           d : out  STD_LOGIC_VECTOR (6 downto 0));
end circ;

architecture Behavioral of circ is
	component disp_lula is
    Port ( numero : in  INTEGER range 0 to 4;
           saida : out  STD_LOGIC_VECTOR(6 downto 0));
	end component;
	signal dez, uni, numero, centena, mil : integer range 0 to 12;
begin
	
	u1 : disp_lula port map(numero, d);
	dez <= 0;
	uni <= 1;
	mil <= 0;
	centena <= 2;
	
	process(clk)
		variable cont : integer range 0 to 1_000_000;
	begin
		if rising_edge(clk)
			then 
				if cont < 1_000_000 then cont := cont +1;
					else cont := 0; 
				end if; -- if do cont
				
				if switch = '0'  then
					if cont < 250_000
						then sel <= "0111"; --liga display da dezena
							  numero <= mil;
					elsif( cont < 500_000 )
						then
							sel <= "1011";
							numero <= centena;
					elsif( cont < 750_000 )
						then
							sel <= "1101";
							numero <= dez;
					else 
							sel <= "1110";
							numero <= uni;
					end if;
				else
					if cont < 500_000
						then sel <= "1110"; --liga display da dezena
							  numero <= 4;
					else 
						sel <= "1101"; --liga display da dezena
							  numero <= 3;
					end if;
				end if;	
		end if; --if do rising edge
	end process;

end Behavioral;

