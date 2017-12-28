library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux_2_to_1 IS
port ( a, b, s : in std_logic;
             f : out std_logic
      );
END Mux_2_to_1;

Architecture Behaviour OF Mux_2_to_1 IS
Begin
 f <= (s and a) or ((not s) and b);
END Behaviour;
---------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux_8_to_4 IS
port ( a, b : in std_logic_vector(3 downto 0); 
          s : in std_logic;
          f : out std_logic_vector(3 downto 0)
      );
END Mux_8_to_4;

Architecture Struct OF Mux_8_to_4 IS
COMPONENT Mux_2_to_1 IS
port ( a, b, s : in std_logic;
             f : out std_logic
      );
END COMPONENT;

BEGIN
mux_2_1_0: Mux_2_to_1 PORT MAP (a(0),b(0), s, f(0));
mux_2_1_1: Mux_2_to_1 PORT MAP (a(1),b(1), s, f(1));
mux_2_1_2: Mux_2_to_1 PORT MAP (a(2),b(2), s, f(2));
mux_2_1_3: Mux_2_to_1 PORT MAP (a(3),b(3), s, f(3));  
END Struct;
