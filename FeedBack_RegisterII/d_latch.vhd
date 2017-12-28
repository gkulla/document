library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY d_latch IS
port ( D, Clk  : in std_logic;
       Q, notQ: out std_logic
      );
END d_latch;

Architecture Struct OF d_latch IS
Begin
	Q <= D WHEN (Clk = '1');
END Struct;