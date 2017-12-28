library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY decoder IS
port ( input  : in std_logic;
       out1, out2: buffer std_logic
      );
END decoder;

Architecture Struct OF decoder IS
Begin
  PROCESS(input)
  BEGIN
	  if (input = '0') then out1 <= '1';
                            out2 <='0';
	  ELSE
	  out2 <= '1';
	  out1<='0';
	  END if;
  END PROCESS;
END Struct;