library IEEE;
use IEEE.std_logic_1164.all;

ENTITY demux IS
port ( input: in std_logic;
          a : in std_logic_vector(1 downto 0);
          f : out std_logic_vector(3 downto 0)
      );
END demux;

Architecture Behav OF demux IS
BEGIN
	PROCESS(a)
	BEGIN
	f <= "0000";
		case a is 
			when "00" => f(0) <= input;--not a(1) and not a(0);
			when "01" => f(1) <= input;--not a(1) and  a(0);
			when "10" => f(2) <= input;--a(1) and not a(0);
			when "11" => f(3) <= input;--a(1) and  a(0);
			when others => f <= "0000";
		end case;
	end PROCESS;
END Behav;