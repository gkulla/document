library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Mux_8_to_4 IS
port ( a, b : in std_logic_vector(3 downto 0);
		  s : in std_logic;
       output: out std_logic_vector(3 downto 0)
      );
END Mux_8_to_4;

Architecture Behaviour OF Mux_8_to_4 IS
Begin
   Process(s)
		BEGIN
		  if s = '0' then output <= a;
		  else output <= b;
		  end if;
		END PROCESS;
END Behaviour;