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

ENTITY Mux_4_to_1 IS
port ( a : in std_logic_vector(3 downto 0); 
       s : in std_logic_vector(1 downto 0);
       f : out std_logic
      );
END Mux_4_to_1;

Architecture Struct OF Mux_4_to_1 IS
COMPONENT Mux_2_to_1 IS
port ( a, b, s : in std_logic;
             f : out std_logic
      );
END COMPONENT;

SIGNAL c : std_logic_vector(1 downto 0);
Begin
mux_2_1_0: Mux_2_to_1 PORT MAP (a(0),a(1),s(0), c(0));
mux_2_1_1: Mux_2_to_1 PORT MAP (a(2),a(3),s(0), c(1));
mux_2_1_2: Mux_2_to_1 PORT MAP (c(0),c(1),s(1), f);  
 
END Struct;
