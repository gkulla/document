library IEEE;
USE IEEE.std_logic_1164.all;


ENTITY comparator IS
port ( input: in std_logic_vector(7 downto 0);
           output: out std_logic
      );
END comparator;

Architecture Struct OF comparator IS
Begin
output <= (input(3) and input(2))or(input(3) and input(1));
END Struct;
