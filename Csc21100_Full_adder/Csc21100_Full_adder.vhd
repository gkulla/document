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

--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_Full_adder IS
port ( a, b, cin: in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_Full_adder;

Architecture Structure of Csc21100_Full_adder IS
COMPONENT Csc21100_Half_adder IS
port ( a, b     : in std_logic;
       sum, cout: out std_logic
      );
END COMPONENT;
Signal c_out1, c_out2, sum_out: std_logic;
BEGIN
Full_adder0: Csc21100_Half_adder PORT MAP(a, b, sum_out, c_out1);
Full_adder1: Csc21100_Half_adder PORT MAP(sum_out, cin, sum, c_out2);
cout <= c_out1 or c_out2;
END Structure;
