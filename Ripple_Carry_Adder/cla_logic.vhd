library IEEE;
use IEEE.std_logic_1164.all;

entity cla_logic is
port(G, P: in std_logic_vector(3 downto 0);
      CIN: in std_logic;
        C: out std_logic_vector(2 downto 0); -- “internal” carry
     CGOUT, CPOUT: out std_logic);
end cla_logic;

architecture arch of cla_logic is
begin
	C(0) <= G(0) or (P(0) and CIN);
	C(1) <= G(1) or (G(0) and P(1)) or (CIN and P(0) and P(1));
	C(2) <= G(2) or (G(1) and P(2)) or (G(0) and P(1) and P(2)) or (CIN and P(0) and P(1) and P(2));
	CGOUT<= G(3) or (G(2) and P(3)) or (G(1) and P(2) and P(3)) or (G(0) and P(1) and P(2) and P(3)) or (CIN and P(0) and P(1) and P(2) and P(3)); --can think of it as a C(3), it's the last carry
	CPOUT<= (P(3) and P(2) and P(1) and P(0));
end arch;