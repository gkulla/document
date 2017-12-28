library IEEE;
USE IEEE.std_logic_1164.all;

PACKAGE Csc211_Gerti_Kulla_Package2 IS
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
END Csc211_Gerti_Kulla_Package2;
-------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE work.Csc211_Gerti_Kulla_Package2.all;


ENTITY Decimal_Display IS
port (  a, b, zero, six : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        tens_display : out std_logic_vector(6 downto 0);
        decimal_display : out std_logic_vector(6 downto 0)
      );
END Decimal_Display;

Architecture Behaviour OF Decimal_Display IS

Signal sig, temp, sum_out1: std_logic_vector(3 downto 0);
Signal sum_out2, mux_out, cout2: std_logic_vector(3 downto 0);
Signal comp_out, overflow_comp,sig_overflow: std_logic;

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
Csc_Bit_Adder0: add_sub PORT MAP(a(0), temp(0), cin, sum_out1(0), sig(0));
Csc_Bit_Adder1: add_sub PORT MAP(a(1), temp(1), sig(0), sum_out1(1), sig(1));
Csc_Bit_Adder2: add_sub PORT MAP(a(2), temp(2), sig(1), sum_out1(2), sig(2));
Csc_Bit_Adder3: add_sub PORT MAP(a(3), temp(3), sig(2), sum_out1(3), sig(3));	
sig_overflow <= sig(2) xor sig(3); 

Csc_Comparator: comparator PORT MAP(sum_out1, comp_out);
overflow_comp <= comp_out or sig_overflow;

Csc_Mux: Mux_8_to_4 PORT MAP(zero, six, overflow_comp, mux_out);

Csc_Bit_Adder4: add_sub PORT MAP(sum_out1(0), mux_out(0), cin, sum_out2(0), cout2(0));
Csc_Bit_Adder5: add_sub PORT MAP(sum_out1(1), mux_out(1), cout2(0), sum_out2(1), cout2(1));
Csc_Bit_Adder6: add_sub PORT MAP(sum_out1(2), mux_out(2), cout2(1), sum_out2(2), cout2(2));
Csc_Bit_Adder7: add_sub PORT MAP(sum_out1(3), mux_out(3), cout2(2), sum_out2(3), cout2(3));

Csc_Seg_Display: Seg_Display PORT MAP(sum_out2, decimal_display);
Csc_Seg_Display_tens: Seg_Display_tens PORT MAP(overflow_comp, tens_display);
END Behaviour;