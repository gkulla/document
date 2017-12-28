
-----------------------------------------------------------------------------------
library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Csc21100_2bit_add_sub IS
port ( a1, b1, cin : in std_logic_vector(1 downto 0);
               sum1 : out std_logic_vector(1 downto 0);
               cout1: out std_logic
      );
END Csc21100_2bit_add_sub;

Architecture Behaviour OF Csc21100_2bit_add_sub IS
COMPONENT Csc21100_1bit_add_sub
	  port ( a, b, cin : in std_logic;
             sum, cout : out std_logic
            );
END COMPONENT;
Signal sig: std_logic;
Begin
Csc_Bit_Adder0: Csc21100_1bit_add_sub PORT MAP(a1(0), b1(0), cin, sum1(0), sig);
Csc_Bit_Adder1: Csc21100_1bit_add_sub PORT MAP(a1(1), b1(1), sig, sum1(1), cout1);	  
END Behaviour;