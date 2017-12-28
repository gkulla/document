library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY decoder2_4 IS
port ( input  : in std_logic_vector(1 downto 0);
       out1, out2, out3, out4: out std_logic
      );
END decoder2_4;

Architecture Struct OF decoder2_4 IS

SIGNAL s : std_logic_vector(3 downto 0);
Begin
  PROCESS(input)
  BEGIN
	 CASE input IS
		 WHEN "00" => s <= "0001";
		 WHEN "01" => s <= "0010";
		 WHEN "10" => s <= "0100";
		 WHEN "11" => s <= "1000";
		 WHEN OTHERS => s <= "0000";
     END CASE;
  END PROCESS;
  
  out1 <= s(0);
  out2 <= s(1);
  out3 <= s(2);
  out4 <= s(3);
END Struct;