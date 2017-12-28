library ieee;
use ieee.STD_LOGIC_1164.ALL;

entity Seg_display_tens is
  port(       z: in std_logic;
        display: out std_logic_vector(6 downto 0));   
end Seg_display_tens;

architecture Behav of Seg_display_tens is
signal sig_output : std_logic_vector(6 downto 0);
BEGIN
	PROCESS(z)
		BEGIN
		case z is
			when '0' => sig_output <="0111111";
			when others  => sig_output <="0000110";
		END CASE;
	END PROCESS;
display <= NOT sig_output;
END Behav;