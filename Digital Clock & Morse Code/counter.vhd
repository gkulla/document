library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.NUMERIC_STD.ALL;
use ieee.math_real.all;

entity counter is
	generic(n:natural:=4);
	port(clock:in STD_LOGIC;
	   reset_n:in STD_LOGIC;
	         Q:out STD_LOGIC_VECTOR(n-1 downto 0)
	    );
end entity;

architecture rtl of counter is
signal count_value:std_logic_vector(n-1 downto 0);
begin
	PROCESS(clock,reset_n)
	begin
		if(reset_n='0') then
			count_value<=(OTHERS=>'0');
		elsif((clock'event)and(clock='1'))then
			count_value<=count_value+1;
		end if;
	end process;
Q<=count_value;
end rtl;















