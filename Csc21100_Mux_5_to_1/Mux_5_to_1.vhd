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

ENTITY Mux_5_to_1 IS
port ( a : in std_logic_vector(4 downto 0); 
       s : in std_logic_vector(2 downto 0);
       f : out std_logic
      );
END Mux_5_to_1;

Architecture Struct OF Mux_5_to_1 IS
COMPONENT Mux_2_to_1 IS
port ( a, b, s : in std_logic;
             f : out std_logic
      );
END COMPONENT;

SIGNAL c : std_logic_vector(2 downto 0);
BEGIN
mux_2_1_0: Mux_2_to_1 PORT MAP (a(1),a(0),s(0), c(0));
mux_2_1_1: Mux_2_to_1 PORT MAP (a(3),a(2),s(0), c(1));
mux_2_1_2: Mux_2_to_1 PORT MAP (c(1),c(0),s(1), c(2));
mux_2_1_3: Mux_2_to_1 PORT MAP (a(4),c(2),s(2), f);  
END Struct;
