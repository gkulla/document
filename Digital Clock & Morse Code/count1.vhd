library IEEE;
USE IEEE.std_logic_1164.all;

entity count1 is
   port ( CLK, Rst: in std_logic;
          COUNT1,COUNT2,COUNT3,COUNT4,COUNT5,COUNT6,COUNT7,COUNT8: out integer
         );
   end count1;
   
architecture behav_COUNT of count1 is

begin
 
  P_COUNT: process
 
   variable intern_value1: integer :=0;
   variable intern_value2: integer :=0;
   variable intern_value3: integer :=0;
   variable intern_value4: integer :=0;
   variable intern_value5: integer :=0;
   variable intern_value6: integer :=0;
   variable intern_value7: integer :=0;
   variable intern_value8: integer :=0; 
   variable loop_counter: integer :=0;
 
   begin 
     COUNT1 <= intern_value1;
     COUNT2 <= intern_value2;
     COUNT3 <= intern_value3;
     COUNT4 <= intern_value4;
     COUNT5 <= intern_value5;
     COUNT6 <= intern_value6;
     COUNT7 <= intern_value7;
     COUNT8 <= intern_value8;
      
     wait until rising_edge(CLK);
		IF Rst='1' then 
			COUNT1 <= 0;intern_value1:=0;
			COUNT2 <= 0;intern_value2:=0;
			COUNT3 <= 0;intern_value3:=0;
			COUNT4 <= 0;intern_value4:=0;
			COUNT5 <= 0;intern_value5:=0;
			COUNT6 <= 0;intern_value6:=0;
		    COUNT7 <= 0;intern_value7:=0;
			COUNT8 <= 0;intern_value8:=0;
            loop_counter:=0;
        ELSE
		    loop_counter:=loop_counter+1;
		    IF((loop_counter mod 500000) = 0)THEN
				loop_counter:= (loop_counter+1) mod 500000;
				intern_value1:=(intern_value1 + 1) mod 10;
				COUNT1 <= intern_value1;
					IF(intern_value1=0)THEN
					intern_value2:=(intern_value2 + 1) mod 10;
					COUNT2 <= intern_value2;
					--------------------------------------------------------------------------------------
						IF(intern_value2 = 0)THEN
							intern_value3:=(intern_value3 + 1) mod 10;
							COUNT3 <= intern_value3;
								IF(intern_value3 = 0)THEN
									intern_value4:=(intern_value4 + 1) mod 6;
									COUNT4 <= intern_value4;
					--sec----------------------------------------------------------------------------------
										IF(intern_value4 = 0)THEN
											intern_value5:=(intern_value5 + 1) mod 10;
											COUNT5 <= intern_value5;
												IF(intern_value5 = 0)THEN
													intern_value6:=(intern_value6 + 1) mod 6;
													COUNT6 <= intern_value6;
					--min----------------------------------------------------------------------------------
													IF(intern_value6 = 0)THEN
														intern_value7:=(intern_value7 + 1) mod 10;
														COUNT7 <= intern_value7;
															IF(intern_value7 = 0)THEN
																intern_value8:=(intern_value8 + 1) mod 3;
																COUNT8 <= intern_value8;
															END IF;
															IF(intern_value8 = 2 and intern_value7 = 4)THEN
																			COUNT1 <= 0;intern_value1:=0;
																			COUNT2 <= 0;intern_value2:=0;
																			COUNT3 <= 0;intern_value3:=0;
																			COUNT4 <= 0;intern_value4:=0;
																			COUNT5 <= 0;intern_value5:=0;
																			COUNT6 <= 0;intern_value6:=0;
																			COUNT7 <= 0;intern_value7:=0;
																			COUNT8 <= 0;intern_value8:=0;
																			loop_counter:=0;
				    --hrs-----------------------------------------------------------------------------------
															END IF;
													END IF;	
												END IF;
										END IF;
								END IF;
						END IF;
			        END IF;
		     END IF;
		 END IF;  
end PROCESS P_COUNT;
end behav_COUNT;