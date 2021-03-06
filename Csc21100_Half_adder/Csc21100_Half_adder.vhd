library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_Half_adder IS
port ( a, b     : in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_Half_adder;

Architecture Behav of Csc21100_Half_adder IS
BEGIN
	sum  <= a xor b;
	cout <= a and b;
END Behav;

