library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY FB_reg IS
port ( A, D, Clk  : in std_logic;
       Q          : out std_logic_vector(7 downto 0)
      );
END FB_reg;

Architecture Struct OF FB_reg IS
	COMPONENT MS_ff IS
		port ( D, Clk  : in std_logic;
              Q        : out std_logic
        );
	END COMPONENT;

SIGNAL clock_sig, input: std_logic;
SIGNAL con: std_logic_vector(7 downto 0);
Begin
clock_sig <= Clk;

PROCESS(A)
	BEGIN
	IF(A='1') THEN input <= D;
	ELSE input <= con(6) xor con(7);
    END IF;
    END PROCESS;

FB_reg0: MS_ff PORT MAP(input, clock_sig, con(0));
FB_reg1: MS_ff PORT MAP(con(0), clock_sig, con(1));
FB_reg2: MS_ff PORT MAP(con(1), clock_sig, con(2));
FB_reg3: MS_ff PORT MAP(con(2), clock_sig, con(3));
FB_reg4: MS_ff PORT MAP(con(3), clock_sig, con(4));
FB_reg5: MS_ff PORT MAP(con(4), clock_sig, con(5));
FB_reg6: MS_ff PORT MAP(con(5), clock_sig, con(6));
FB_reg7: MS_ff PORT MAP(con(6), clock_sig, con(7));
Q(0) <= con(0);	
Q(1) <= con(1);
Q(2) <= con(2);
Q(3) <= con(3);
Q(4) <= con(4);
Q(5) <= con(5);
Q(6) <= con(6);
Q(7) <= con(7);
END Struct;