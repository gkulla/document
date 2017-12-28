library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY Csc21100_1bit_add_sub IS
port ( a, b, cin : in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_1bit_add_sub;

Architecture Behaviour OF Csc21100_1bit_add_sub IS
Begin
        sum <= (a xor b) xor cin;
        cout <= (a and cin) or (b and cin) or (a and b);

END Behaviour;
-----------------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

ENTITY Csc21100_4bit_add_sub IS
port ( a3,a2,a1,a0,b3,b2,b1,b0  : in std_logic;
          cin  : in std_logic;
          sum3,sum2,sum1,sum0   : out std_logic;
      overflow : out std_logic
      );
END Csc21100_4bit_add_sub;

Architecture Behaviour OF Csc21100_4bit_add_sub IS
COMPONENT Csc21100_1bit_add_sub
	  port ( a, b, cin : in std_logic;
             sum, cout : out std_logic
            );
END COMPONENT;

Signal sig, temp: std_logic_vector(3 downto 0);

Begin
	PROCESS(cin)
	BEGIN
		IF (cin = '1')
			then 
				temp(3) <= not b3;
				temp(2) <= not b2;
				temp(1) <= not b1;
				temp(0) <= not b0;
			Else
				temp(3) <= b3;
				temp(2) <= b2;
				temp(1) <= b1;
				temp(0) <= b0;
		end IF;
	END PROCESS;
Csc_Bit_Adder0: Csc21100_1bit_add_sub PORT MAP(a0, temp(0), cin, sum0, sig(0));
Csc_Bit_Adder1: Csc21100_1bit_add_sub PORT MAP(a1, temp(1), sig(0), sum1, sig(1));
Csc_Bit_Adder2: Csc21100_1bit_add_sub PORT MAP(a2, temp(2), sig(1), sum2, sig(2));
Csc_Bit_Adder3: Csc21100_1bit_add_sub PORT MAP(a3, temp(3), sig(2), sum3, sig(3));	
overflow <= sig(3);
  
END Behaviour;
