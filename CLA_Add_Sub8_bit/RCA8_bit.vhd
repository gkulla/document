library IEEE;
use IEEE.std_logic_1164.all;
---------------------------------------------------------------------
PACKAGE Csc211_Gerti_Kulla_CLA_Package3 IS
	COMPONENT cla_logic is
		port(G, P: in std_logic_vector(7 downto 0);
		      CIN: in std_logic;
			    C: out std_logic_vector(7 downto 0); -- “internal” carry
		 CGOUT, CPOUT: out std_logic);
	end COMPONENT;
	
	COMPONENT full_adder_g_p is
		port( a, b, cin: in std_logic;
			  sum, g, p: out std_logic);
    end COMPONENT;
    
    COMPONENT cla4 is 
		port( a, b: in std_logic_vector(3 downto 0);
		carryin: in std_logic;
        sum: out std_logic_vector(3 downto 0);
        cgout, cpout, overflow: out std_logic);
	END COMPONENT;
	
	COMPONENT cla4_add_subtract is
		port( a, b: in std_logic_vector(3 downto 0);
		carryin: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		cgout, cpout, overflow: out std_logic);
	end COMPONENT;
END Csc211_Gerti_Kulla_CLA_Package3;
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.Csc211_Gerti_Kulla_CLA_Package3.all;

entity RCA8_bit is 
port( a, b: in std_logic_vector(7 downto 0);
	  carryin: in std_logic;
      sum: out std_logic_vector(7 downto 0);
      cgout, cpout, overflow: out std_logic);
end RCA8_bit;

architecture arch of RCA8_bit is

signal sig_carry,sig_b, cg, cp: std_logic_vector(7 downto 0); 
signal  cout, carry : std_logic;
begin
PROCESS(carryin)
BEGIN
	IF(carryin = '0') then 
     sig_b <= b;
	ELSE sig_b <= not b;
	END IF;
END PROCESS;
carry <= carryin;

ADD80:full_adder_g_p port map (a(0), sig_b(0), carry, sum(0), cg(0), cp(0));
ADD81:full_adder_g_p port map (a(1), sig_b(1), sig_carry(1), sum(1), cg(1), cp(1));
ADD82:full_adder_g_p port map (a(2), sig_b(2), sig_carry(2), sum(2), cg(2), cp(2));
ADD83:full_adder_g_p port map (a(3), sig_b(3), sig_carry(3), sum(3), cg(3), cp(3));
ADD84:full_adder_g_p port map (a(4), sig_b(4), sig_carry(4), sum(4), cg(4), cp(4));
ADD85:full_adder_g_p port map (a(5), sig_b(5), sig_carry(5), sum(5), cg(5), cp(5));
ADD86:full_adder_g_p port map (a(6), sig_b(6), sig_carry(6), sum(6), cg(6), cp(6));
ADD87:full_adder_g_p port map (a(7), sig_b(7), sig_carry(7), sum(7), cg(7), cp(7));

CLA0: cla_logic port map(cg, cp, carryin, sig_carry, cout, cpout);

cgout <= cout;
overflow <= sig_carry(7) xor cout;
end arch;