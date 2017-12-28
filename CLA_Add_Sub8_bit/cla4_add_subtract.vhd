library IEEE;
use IEEE.std_logic_1164.all;
---------------------------------------------------------------------
PACKAGE Csc211_Gerti_Kulla_CLA_Package2 IS
	COMPONENT cla_logic is
		port(G, P: in std_logic_vector(3 downto 0);
		      CIN: in std_logic;
			    C: out std_logic_vector(2 downto 0); -- “internal” carry
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
END Csc211_Gerti_Kulla_CLA_Package2;
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.Csc211_Gerti_Kulla_CLA_Package2.all;

entity cla4_add_subtract is -- 4-bit CLA structural model: top entity
port( a, b: in std_logic_vector(3 downto 0);
	  carryin: in std_logic;
      sum: out std_logic_vector(3 downto 0);
      cgout, cpout, overflow: out std_logic);
end cla4_add_subtract;

architecture arch of cla4_add_subtract is

signal sig_b: std_logic_vector(3 downto 0); --local signals
signal sig_carry, carry, cout, cg, cp: std_logic;
begin
PROCESS(carryin)
BEGIN
	IF(carryin = '0') then sig_b <= b;
	ELSE sig_b <= not b;
	END IF;
END PROCESS;
carry <= carryin;

ADD0:cla4 port map (a, sig_b, carry, sum, cg, cp);
end arch;