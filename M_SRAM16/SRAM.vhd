library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SRAM IS
port ( D, SC,WE  : in std_logic;
       Q         : out std_logic
      );
END SRAM;

Architecture Struct OF SRAM IS
	COMPONENT d_latch IS
		port ( D, Clk  : in std_logic;
			   Q, notQ: out std_logic
			  );
	END COMPONENT;

SIGNAL s_q, s_notq, sQ, snotQ, clock_sig, n_clock_sig: std_logic;
Begin

clock_sig <= SC and WE;
n_clock_sig <= not clock_sig ;

SRAM0: d_latch PORT MAP(D, n_clock_sig , s_q, s_notq);
SRAM1: d_latch PORT MAP(s_q, clock_sig , sQ, snotQ);

Q<= sQ when (SC = '1') else 'Z';
	
END Struct;