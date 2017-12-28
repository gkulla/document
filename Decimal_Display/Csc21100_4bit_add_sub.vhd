library IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE Csc211_Gerti_Kulla_Package IS
  COMPONENT add_sub IS
	port ( a, b, cin : in std_logic;
			sum, cout: out std_logic
      );
	END COMPONENT;
	
	COMPONENT Mux_8_to_4 IS
	port ( a, b : in std_logic_vector(3 downto 0);
			  s : in std_logic;
		   output: out std_logic_vector(3 downto 0)
		  );
	END COMPONENT;
	
	COMPONENT Seg_display_tens is
	  port(       z: in std_logic;
			display: out std_logic_vector(6 downto 0));   
	END COMPONENT;
	
	COMPONENT Seg_Display is
	  port( input  : in std_logic_vector(3 downto 0);
			output1: out std_logic_vector(6 downto 0)
			);  
	END COMPONENT;
	
	COMPONENT comparator IS
		port ( a: in std_logic_vector(3 downto 0);
				   output: out std_logic
			  );
		END COMPONENT;
END Csc211_Gerti_Kulla_Package;
-------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE work.Csc211_Gerti_Kulla_Package.all;


ENTITY Csc21100_4bit_add_sub IS
port (  a, b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        overflow : out std_logic
      );
END Csc21100_4bit_add_sub;

Architecture Behaviour OF Csc21100_4bit_add_sub IS

Signal sig, temp: std_logic_vector(3 downto 0);

Begin
	PROCESS(cin)
	BEGIN
		IF (cin = '1')
			THEN 
				temp <= not b;
			Else
				temp <= b;
		END IF;
	END PROCESS;
Csc_Bit_Adder0: add_sub PORT MAP(a(0), temp(0), cin, sum(0), sig(0));
Csc_Bit_Adder1: add_sub PORT MAP(a(1), temp(1), sig(0), sum(1), sig(1));
Csc_Bit_Adder2: add_sub PORT MAP(a(2), temp(2), sig(1), sum(2), sig(2));
Csc_Bit_Adder3: add_sub PORT MAP(a(3), temp(3), sig(2), sum(3), sig(3));	
overflow <= sig(2) xor sig(3); 
END Behaviour;