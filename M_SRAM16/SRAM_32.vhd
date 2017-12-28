library IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SRAM_32 IS
port ( D      : in std_logic_vector(15 downto 0);
       SC,WE, EN  : in std_logic;
       Q      : out std_logic_vector(31 downto 0)
      );
END SRAM_32;

Architecture Struct OF SRAM_32 IS
	COMPONENT SRAM_16 IS
		port( D      : in std_logic_vector(15 downto 0);
		      SC,WE  : in std_logic;
              Q      : out std_logic_vector(15 downto 0)
         );
	END COMPONENT;

SIGNAL s_SC, s_WE, snot_WE: std_logic;
SIGNAL sQ : std_logic_vector(31 downto 0);

Begin
s_SC <= SC;

s_WE<= WE WHEN EN='1' ELSE '0';
snot_WE<= WE WHEN EN='0' ELSE '0';


SRAM32_0: SRAM_16 PORT MAP(D(15 downto 0), s_SC, s_WE, sQ(15 downto 0));
SRAM32_1: SRAM_16 PORT MAP(D(15 downto 0), s_SC, snot_WE, sQ(31 downto 16));

Q(0)<= sQ(0) when (s_SC = '1') else 'Z';
Q(1)<= sQ(1) when (s_SC = '1') else 'Z';
Q(2)<= sQ(2) when (s_SC = '1') else 'Z';
Q(3)<= sQ(3) when (s_SC = '1') else 'Z';
Q(4)<= sQ(4) when (s_SC = '1') else 'Z';
Q(5)<= sQ(5) when (s_SC = '1') else 'Z';
Q(6)<= sQ(6) when (s_SC = '1') else 'Z';
Q(7)<= sQ(7) when (s_SC = '1') else 'Z';
Q(8)<= sQ(8) when (s_SC = '1') else 'Z';
Q(9)<= sQ(9) when (s_SC = '1') else 'Z';
Q(10)<= sQ(10) when (s_SC = '1') else 'Z';
Q(11)<= sQ(11) when (s_SC = '1') else 'Z';
Q(12)<= sQ(12) when (s_SC = '1') else 'Z';
Q(13)<= sQ(13) when (s_SC = '1') else 'Z';
Q(14)<= sQ(14) when (s_SC = '1') else 'Z';
Q(15)<= sQ(15) when (s_SC = '1') else 'Z';
Q(16)<= sQ(16) when (s_SC = '1') else 'Z';
Q(17)<= sQ(17) when (s_SC = '1') else 'Z';
Q(18)<= sQ(18) when (s_SC = '1') else 'Z';
Q(19)<= sQ(19) when (s_SC = '1') else 'Z';
Q(20)<= sQ(20) when (s_SC = '1') else 'Z';
Q(21)<= sQ(21) when (s_SC = '1') else 'Z';
Q(22)<= sQ(22) when (s_SC = '1') else 'Z';
Q(23)<= sQ(23) when (s_SC = '1') else 'Z';
Q(24)<= sQ(24) when (s_SC = '1') else 'Z';
Q(25)<= sQ(25) when (s_SC = '1') else 'Z';
Q(26)<= sQ(26) when (s_SC = '1') else 'Z';
Q(27)<= sQ(27) when (s_SC = '1') else 'Z';
Q(28)<= sQ(28) when (s_SC = '1') else 'Z';
Q(29)<= sQ(29) when (s_SC = '1') else 'Z';
Q(30)<= sQ(30) when (s_SC = '1') else 'Z';
Q(31)<= sQ(31) when (s_SC = '1') else 'Z';

END Struct;