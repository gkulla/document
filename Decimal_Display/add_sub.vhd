library IEEE;
use IEEE.std_logic_1164.all;

ENTITY add_sub IS
port ( a, b, cin : in std_logic;
       sum, cout: out std_logic
      );
END add_sub;

Architecture Behaviour OF add_sub IS
Begin
        sum <= (a xor b) xor cin;
        cout <= (a and cin) or (b and cin) or (a and b);
END Behaviour;