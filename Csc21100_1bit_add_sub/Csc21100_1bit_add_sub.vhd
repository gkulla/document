library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_1bit_add_sub IS
port ( a, b, cin : in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_1bit_add_sub;

Architecture Behaviour OF Csc21100_1bit_add_sub IS
Begin
	    sum <=  (not a and not b and cin) or
                        (not a and b and not cin) or
                        (a and not b and not cin) or
                        (a and b and cin);

        cout <= (not a and b and cin) or
                        (a and not b and cin) or
                        (a and b and not cin) or
                        (a and b and cin);
END Behaviour;