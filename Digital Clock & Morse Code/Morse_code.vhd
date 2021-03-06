library IEEE;
USE IEEE.std_logic_1164.all;

entity Morse_code is
   port ( CLK, Rst,w0,w1,w2: in std_logic;
          z: out std_logic_vector(3 downto 0)
         );
   end Morse_code;
   
architecture behav_COUNT of Morse_code is
begin
 
  P_COUNT: process

   variable loop_counter: integer :=-1;
   variable loop_counter1: integer :=0;
   variable loop_counter2: integer :=-1;
   variable loop_counter3: integer :=0;
   variable flag: integer :=0;
   variable reset: integer :=0;
 
   begin    
     wait until rising_edge(CLK);
		IF Rst='1' then 
			z <= "0000";
            loop_counter:=-1;
            loop_counter1:=0;
            loop_counter2:=-1;
            loop_counter3:=0;
            flag:=0;
            reset:=1;
        ELSE
		    
--A----------------------------------------------------------------------------------------	    
		   IF(w2='0' and w1='0' and w0='0') THEN
				loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(1)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(1)<='0';
						flag:=1;
						END IF;
				END IF;
				
						
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(0)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(0)<='0';
						END IF;
				END IF;
--B------------------------------------------------------------------------------------------------				
			ELSIF (w2='0' and w1='0' and w0='1') THEN
				    loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(2)<='1';
						z(1)<='1';
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(2)<='0';
						z(1)<='0';
						z(0)<='0';
						flag:=1;
						END IF;
				END IF;
				
						
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(3)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(3)<='0';
						END IF;
				    END IF;
--C------------------------------------------------------------------------------------------------
		    ELSIF (w2='0' and w1='1' and w0='0') THEN
				loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(2)<='1';
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(2)<='0';
						z(0)<='0';
						flag:=1;
						END IF;
				END IF;
					
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(3)<='1';
						z(1)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(3)<='0';
						z(1)<='0';
						END IF;
				    END IF;
--D-------------------------------------------------------------------------------------------------
		    ELSIF (w2='0' and w1='1' and w0='1') THEN
		     				    loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(1)<='1';
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(1)<='0';
						z(0)<='0';
						flag:=1;
						END IF;
				END IF;
				
						
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(2)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(2)<='0';
						END IF;
		        END IF; 
--E----------------------------------------------------------------------------------------- 
		    ELSIF (w2='1' and w1='0' and w0='0') THEN
		     	loop_counter:= (loop_counter+1) mod 50000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(0)<='0';
						END IF;
				END IF;
--F-----------------------------------------------------------------------------------------
		    ELSIF (w2='1' and w1='0' and w0='1') THEN
		     				    loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(3)<='1';
						z(2)<='1';
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
					    z(3)<='0';
						z(2)<='0';
						z(0)<='0';
						flag:=1;
						END IF;
				END IF;
				
						
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(1)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(1)<='0';
						END IF;
		        END IF; 
--G-----------------------------------------------------------------------------------------
		    ELSIF (w2='1' and w1='1' and w0='0') THEN
		     				    loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(0)<='0';
						flag:=1;
						END IF;
				END IF;
				
						
			    IF(((loop_counter2 mod 100000000) = 0))THEN
					
						IF(loop_counter3 =0) THEN
						z(2)<='1';
						z(1)<='1';
						loop_counter3:=1;
						ELSIF(loop_counter3=1) THEN
						z(2)<='0';
						z(1)<='0';
						END IF;
		        END IF; 
--H-----------------------------------------------------------------------------------------
		    ELSIF (w2='1' and w1='1' and w0='1') THEN
		     				    loop_counter:= (loop_counter+1) mod 50000000;
				loop_counter2:= (loop_counter2+1) mod 100000000;
				
				IF((loop_counter mod 50000000) = 0)THEN
						IF(loop_counter1 =0) THEN
						z(3)<='1';
						z(2)<='1';
						z(1)<='1';
						z(0)<='1';
						loop_counter1:=1;
						ELSIF(loop_counter1=1) THEN
						z(3)<='0';
						z(2)<='0';
						z(1)<='0';
						z(0)<='0';
						END IF;
				END IF;
		  END IF;
	  END IF;
--------------------------------------------------------------------------------------------
end PROCESS P_COUNT;
end behav_COUNT;