library IEEE;
use IEEE.STD_LOGIC_1164.all;	   
USE ieee.std_logic_arith.ALL;

entity soma is
	 port(
		 a : in unsigned(7 downto 0);
		 b : in unsigned(7 downto 0);
		 c : out unsigned(8 downto 0)
	     );
end soma;

architecture arq_soma of soma is
begin
  p: process (a,b)
  begin
	  c <= ('0' & a) + b;
  --           + sinal de concatenação
	 
end process;	 
end arq_soma;