library IEEE;
USE IEEE.std_logic_1164.all;

entity count_mod10 is
   port ( CLK, w1, w0, Rst: in std_logic;
          COUNT: out integer
         );
   end count_mod10;
   
architecture behav_COUNT of count_mod10 is
begin
 
  P_COUNT: process
 
   variable intern_value: integer :=0; 
   begin 
     COUNT <= intern_value;
        wait until rising_edge(CLK);
        if(Rst='1') THEN
        intern_value:= 0;
        ELSE
            if(w1='0' and w0='1') THEN
			intern_value:=(intern_value + 1) mod 10;
			COUNT <= intern_value;
			elsif(w1='1' and w0='0') THEN
			intern_value:=(intern_value + 2) mod 10;
			COUNT <= intern_value;
			elsif(w1='1' and w0='1') THEN
			intern_value:=(intern_value - 1) mod 10;
			COUNT <= intern_value;
			elsif(w1='0' and w0='0') THEN
			COUNT <= intern_value;
			END IF;
		END IF;
end PROCESS P_COUNT;
end behav_COUNT;