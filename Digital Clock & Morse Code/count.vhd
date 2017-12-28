library IEEE;
USE IEEE.std_logic_1164.all;

entity count is
   port ( CLK, Rst: in std_logic;
          COUNT1,COUNT2, COUNT3: out integer
         );
   end count;
   
architecture behav_COUNT of count is

begin
 
  P_COUNT: process
 
   variable intern_value1: integer :=0; 
   variable intern_value2: integer :=0;
   variable intern_value3: integer :=0;
   begin 
     COUNT1 <= intern_value1;
     COUNT2 <= intern_value2;
     COUNT3 <= intern_value3;
      
     wait until rising_edge(CLK) FOR 1 sec;
		IF Rst='1' then COUNT1 <= 0;intern_value1:=0;
                        COUNT2 <=0;intern_value2:=0;
                        COUNT3 <=0;intern_value3:=0;
        ELSIF(intern_value1=9) THEN
			intern_value2:=(intern_value2+1)mod 10;
			COUNT2<= intern_value2;
			IF(intern_value2=9 and intern_value1=9) THEN
				intern_value3:=(intern_value3+1)mod 10;
				COUNT3<= intern_value3 AFTER 1 sec;
			END IF;
		    intern_value1:=(intern_value1 + 1) mod 10;
			COUNT1 <= intern_value1;
			intern_value2:=(intern_value2 + 1) mod 10;
			COUNT2 <= intern_value2;
        ELSE
			intern_value1:=(intern_value1 + 1) mod 10;
			COUNT1 <= intern_value1;
		END IF;
            
end PROCESS P_COUNT;
end behav_COUNT;