library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY comparator IS
port ( a: in std_logic_vector(3 downto 0);
           output: out std_logic
      );
END comparator;

Architecture Struct OF comparator IS
Begin
output <= (a(3) and a(2))or(a(3) and a(1));
END Struct;