library ieee;
use ieee.STD_LOGIC_1164.ALL;

entity busWire is
  port( sA, sB, sC, sD, sE, sF, sG, sH : in std_logic;
        f : out std_logic_vector(7 downto 0)
        );  
end busWire;

architecture struct of busWire is
begin
f(7) <= sA;
f(6) <= sB;
f(5) <= sC;
f(4) <= sD;
f(3) <= sE;
f(2) <= sF;
f(1) <= sG;
f(0) <= sH;
END struct;