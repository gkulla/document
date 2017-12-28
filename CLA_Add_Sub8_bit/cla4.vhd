library IEEE;
use IEEE.std_logic_1164.all;
---------------------------------------------------------------------
PACKAGE Csc211_Gerti_Kulla_CLA_Package IS
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
END Csc211_Gerti_Kulla_CLA_Package;
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use work.Csc211_Gerti_Kulla_CLA_Package.all;

entity cla4 is -- 4-bit CLA structural model: top entity
port( a, b: in std_logic_vector(3 downto 0);
   carryin: in std_logic;
       sum: out std_logic_vector(3 downto 0);
       cgout, cpout, overflow: out std_logic);
end cla4;

architecture arch of cla4 is

signal cg, cp, carry: std_logic_vector(3 downto 0); --local signals
signal cout: std_logic;
begin
carry(0) <= carryin;
ADD0:full_adder_g_p port map (a(0), b(0), carry(0), sum(0), cg(0), cp(0));
ADD1:full_adder_g_p port map (a(1), b(1), carry(1), sum(1), cg(1), cp(1));
ADD2:full_adder_g_p port map (a(2), b(2), carry(2), sum(2), cg(2), cp(2));
ADD3:full_adder_g_p port map (a(3), b(3), carry(3), sum(3), cg(3), cp(3));

CLA:cla_logic port map(cg, cp, carryin, carry(3 downto 1), cout, cpout);
cgout <= cout;
overflow <= carry(3) xor cout;
end arch;