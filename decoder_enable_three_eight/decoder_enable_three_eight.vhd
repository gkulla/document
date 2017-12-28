library IEEE;
use IEEE.std_logic_1164.all;

ENTITY decoder_enable IS
port ( a : in std_logic_vector(1 downto 0);
       en: in std_logic;
       f : out std_logic_vector(3 downto 0)
      );
END decoder_enable;

Architecture Behav OF decoder_enable IS
BEGIN
	Process(en, a)
		Begin
		    f <= "0000";
			if(en = '1') then
				case a is
					 when "00" => f <= "0001";--not a(1) and not a(0);
					 when "01" => f <= "0010";--not a(1) and  a(0);
					 when "10" => f <= "0100";--    a(1) and not a(0);
					 when "11" => f <= "1000";--    a(1) and  a(0);
					 when others => f <= "0000";
				end case;
			END IF;
	END PROCESS;
END Behav;
----------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY decoder_enable_three_eight IS
port ( a : in std_logic_vector(1 downto 0);
       en: in std_logic;
       f : out std_logic_vector(7 downto 0)
      );
END decoder_enable_three_eight;

Architecture Struct OF decoder_enable_three_eight IS
	COMPONENT decoder_enable IS
		port ( a : in std_logic_vector(1 downto 0);
			   en: in std_logic;
			   f : out std_logic_vector(3 downto 0)
			  );
	END COMPONENT;
SIGNAL en_signal: std_logic;

BEGIN
en_signal <= not en;
decoder0:  decoder_enable PORT MAP (a, en_signal, f(3 downto 0));
decoder1:  decoder_enable PORT MAP (a, en, f(7 downto 4));
END Struct;
