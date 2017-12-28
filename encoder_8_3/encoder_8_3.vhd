library IEEE;
use IEEE.std_logic_1164.all;

ENTITY encoder_8_3 IS
port ( a : in std_logic_vector(7 downto 0);
       f : out std_logic_vector(2 downto 0)
      );
END encoder_8_3;

Architecture Behav OF encoder_8_3 IS
BEGIN
	f(0) <= a(1) or a(3) or a(5) or a(7);
	f(1) <= a(2) or a(3) or a(6) or a(7);
	f(2) <= a(4) or a(5) or a(6) or a(7);
END Behav;