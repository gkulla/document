library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_Half_adder IS
port ( a, b     : in std_logic;
       sum, cout: out std_logic
      );
END Csc21100_Half_adder;

Architecture Behav of Csc21100_Half_adder IS
BEGIN
	sum  <= a xor b;
	cout <= a and b;
END Behav;
--------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_Full_adder IS
port ( a1, b1, cin1: in std_logic;
       sum1, cout1: out std_logic
      );
END Csc21100_Full_adder;

Architecture Structure of Csc21100_Full_adder IS
COMPONENT Csc21100_Half_adder IS
port ( a, b     : in std_logic;
       sum, cout: out std_logic
      );
END COMPONENT;
Signal c_out1, c_out2, sum_out: std_logic;
BEGIN
Full_adder0: Csc21100_Half_adder PORT MAP(a1, b1, sum_out, c_out1);
Full_adder1: Csc21100_Half_adder PORT MAP(sum_out, cin1, sum1, c_out2);
cout1 <= c_out1 or c_out2;
END Structure;
----------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Csc21100_Full_adder_4bit IS
port ( a4, b4  : in std_logic_vector(3 downto 0);   
       cin   : in std_logic;
       sum4   : out std_logic_vector(3 downto 0);
       cout4  : out std_logic
      );
END Csc21100_Full_adder_4bit;

Architecture Behav of Csc21100_Full_adder_4bit IS
	COMPONENT Csc21100_Full_adder IS
		port ( a1, b1, cin1: in std_logic;
			   sum1, cout1: out std_logic
			  );
	END COMPONENT;
Signal sig_c, sig_b: std_logic_vector(3 downto 0);
BEGIN
Process(cin)
	BEGIN
		IF(cin = '1') then sig_b <= not b4;
		ELSE sig_b <= b4;
		END IF;
	END PROCESS;

Full_adder_4bit0: Csc21100_Full_adder PORT MAP(a4(0), sig_b(0), cin, sum4(0), sig_c(0));
Full_adder_4bit1: Csc21100_Full_adder PORT MAP(a4(1), sig_b(1), sig_c(0), sum4(1), sig_c(1));
Full_adder_4bit2: Csc21100_Full_adder PORT MAP(a4(2), sig_b(2), sig_c(1), sum4(2), sig_c(2));
Full_adder_4bit3: Csc21100_Full_adder PORT MAP(a4(3), sig_b(3), sig_c(2), sum4(3), sig_c(3));
cout4 <= sig_c(3);
END Behav;