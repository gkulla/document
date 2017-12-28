library IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE Csc211_Gerti_Kulla_Package2 IS
  COMPONENT add_sub IS
	port ( a, b, cin : in std_logic;
			sum, cout: out std_logic
      );
	END COMPONENT;
	
	COMPONENT Csc21100_4bit_add_sub IS
		port (  a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        cout, overflow : out std_logic
        );
	END COMPONENT;
END Csc211_Gerti_Kulla_Package2;
-------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE work.Csc211_Gerti_Kulla_Package2.all;


ENTITY Csc21100_8bit_add_sub IS
port (  a, b : in std_logic_vector(7 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(7 downto 0);
        overflow : out std_logic
      );
END Csc21100_8bit_add_sub;

Architecture Behaviour OF Csc21100_8bit_add_sub IS

Signal sig, temp: std_logic_vector(7 downto 0);
Signal sig_cout, s_cout, sig_overflow: std_logic;

BEGIN
Csc_Bit_Adder0: Csc21100_4bit_add_sub PORT MAP(a(3 downto 0), b(3 downto 0), cin, sum(3 downto 0), sig_cout, sig_overflow);
Csc_Bit_Adder1: Csc21100_4bit_add_sub PORT MAP(a(7 downto 4), b(7 downto 4), sig_cout, sum(7 downto 4), s_cout, overflow);	 
END Behaviour;