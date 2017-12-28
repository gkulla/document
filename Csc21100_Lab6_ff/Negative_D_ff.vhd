library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Negative_D_ff IS
port ( D, Clk  : in std_logic;
       Q, notQ: buffer std_logic
      );
END Negative_D_ff;

Architecture Struct OF Negative_D_ff IS
COMPONENT D1_lach IS
port ( D, Clk  : in std_logic;
       Q, notQ: buffer std_logic
      );
END COMPONENT;

SIGNAL sclk, snotClk, s_q, s_notq, sQ, snotQ: std_logic;
Begin
sclk <= Clk;
snotClk <= not Clk;

MS_D_ff0: D1_lach PORT MAP(D, sclk, s_q, s_notq);
MS_D_ff1: D1_lach PORT MAP(s_q, snotClk, sQ, snotQ);
Q<= sQ;
notQ <= snotQ;
END Struct;