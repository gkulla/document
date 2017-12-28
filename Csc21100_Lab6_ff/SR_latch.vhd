library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SR_latch IS
port ( S, R   : in bit;
       Q, notQ: buffer bit
      );
END SR_latch;

Architecture Struct OF SR_latch IS
Begin
   Q <= R nor notQ;
notQ <= S nor Q;
END Struct;