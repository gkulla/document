library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY T_f_f IS
port ( T, Clk  : in std_logic;
       Q, notQ: buffer std_logic
      );
END T_f_f;

Architecture Struct OF T_f_f IS
	COMPONENT Positive_D_ff IS
		port ( D, Clk  : in std_logic;
			   Q, notQ: buffer std_logic
			  );
	END COMPONENT;

SIGNAL sD,sClk, sQ, snotQ: std_logic;
Begin
sD <= (Q and (not T))or(notQ and T);
sClk <= Clk;

MS_D_ff0: Positive_D_ff PORT MAP(sD, sClk, sQ, snotQ);
Q <= sQ;
notQ <= snotQ;
END Struct;
