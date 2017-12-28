library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SRAM4 IS
port ( D      : in std_logic_vector(3 downto 0);
       SC,WE  : in std_logic;
       Q      : out std_logic_vector(3 downto 0)
      );
END SRAM4;

Architecture Struct OF SRAM4 IS
	COMPONENT SRAM IS
		port ( D, SC,WE  : in std_logic;
			   Q         : out std_logic
			  );
	END COMPONENT;

SIGNAL s_SC, s_WE: std_logic;
SIGNAL sQ : std_logic_vector(3 downto 0);

Begin
s_SC <= SC;
s_WE<= WE;

SRAM4_0: SRAM PORT MAP(D(0), s_SC, s_WE, sQ(0));
SRAM4_1: SRAM PORT MAP(D(1), s_SC, s_WE, sQ(1));
SRAM4_2: SRAM PORT MAP(D(2), s_SC, s_WE, sQ(2));
SRAM4_3: SRAM PORT MAP(D(3), s_SC, s_WE, sQ(3));
Q(3)<= sQ(3) when (s_SC = '1') else 'Z';
Q(2)<= sQ(2) when (s_SC = '1') else 'Z';
Q(1)<= sQ(1) when (s_SC = '1') else 'Z';
Q(0)<= sQ(0) when (s_SC = '1') else 'Z';

END Struct;