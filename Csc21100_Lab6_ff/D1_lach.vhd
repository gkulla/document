library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY D1_lach IS
port ( D, Clk  : in std_logic;
       Q, notQ: buffer std_logic
      );
END D1_lach;

Architecture Struct OF D1_lach IS
Begin
  PROCESS(D, Clk)
  BEGIN
	  if (Clk = '1') then Q <= D;
	  notQ <= not D;
	  end if;
  END PROCESS;
END Struct;