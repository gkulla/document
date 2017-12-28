library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder_g_p is
	port( a, b, cin: in std_logic;
	      sum, g, p: out std_logic);
end full_adder_g_p;

architecture arch of full_adder_g_p is
begin
	sum <= a xor b xor cin;
	p <= a or b;
	g <= a and b;
end arch;