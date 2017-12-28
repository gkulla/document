library ieee;
use ieee.STD_LOGIC_1164.ALL;


entity Seg_Display32 is
  port( input: in std_logic_vector(31 downto 0);
        out1: out std_logic_vector(6 downto 0);
        out2: out std_logic_vector(6 downto 0);
        out3: out std_logic_vector(6 downto 0);
        out4: out std_logic_vector(6 downto 0);
        out5: out std_logic_vector(6 downto 0);
        out6: out std_logic_vector(6 downto 0);
        out7: out std_logic_vector(6 downto 0);
        out8: out std_logic_vector(6 downto 0)
       );      
end Seg_Display32;

architecture struct of Seg_Display32 is
  signal sout1 : std_logic_vector(6 downto 0);
  signal sout2 : std_logic_vector(6 downto 0);
  signal sout3 : std_logic_vector(6 downto 0);
  signal sout4 : std_logic_vector(6 downto 0);
  signal sout5 : std_logic_vector(6 downto 0);
  signal sout6 : std_logic_vector(6 downto 0);
  signal sout7 : std_logic_vector(6 downto 0);
  signal sout8 : std_logic_vector(6 downto 0);
  
begin
  process(input(3 downto 0)) is
    begin
  case input(3 downto 0) is
  
  when "0000"=>sout1<="1111110";
  when "0001"=>sout1<="0110000";
  when "0010"=>sout1<="1101101";
  when "0011"=>sout1<="1111001";
  when "0100"=>sout1<="0110011";
  when "0101"=>sout1<="1011011";
  when "0110"=>sout1<="1011111";
  when "0111"=>sout1<="1110000";
  when "1000"=>sout1<="1111111";
  when "1001"=>sout1<="1111011";
  when "1010"=>sout1<="1110111";
  when "1011"=>sout1<="0011111";
  when "1100"=>sout1<="0001101";
  when "1101"=>sout1<="0111101";
  when "1110"=>sout1<="1001111";
  when "1111"=>sout1<="1000111";
  when others=>sout1<="0000001";
end case;
end process;

  process(input(7 downto 4)) is
    begin
  case input(7 downto 4) is
  
  when "0000"=>sout2<="1111110";
  when "0001"=>sout2<="0110000";
  when "0010"=>sout2<="1101101";
  when "0011"=>sout2<="1111001";
  when "0100"=>sout2<="0110011";
  when "0101"=>sout2<="1011011";
  when "0110"=>sout2<="1011111";
  when "0111"=>sout2<="1110000";
  when "1000"=>sout2<="1111111";
  when "1001"=>sout2<="1111011";
  when "1010"=>sout2<="1110111";
  when "1011"=>sout2<="0011111";
  when "1100"=>sout2<="0001101";
  when "1101"=>sout2<="0111101";
  when "1110"=>sout2<="1001111";
  when "1111"=>sout2<="1000111";
  when others=>sout2<="0000001";
end case;
end process;

  process(input(11 downto 8)) is
    begin
  case input(11 downto 8) is
  
  when "0000"=>sout3<="1111110";
  when "0001"=>sout3<="0110000";
  when "0010"=>sout3<="1101101";
  when "0011"=>sout3<="1111001";
  when "0100"=>sout3<="0110011";
  when "0101"=>sout3<="1011011";
  when "0110"=>sout3<="1011111";
  when "0111"=>sout3<="1110000";
  when "1000"=>sout3<="1111111";
  when "1001"=>sout3<="1111011";
  when "1010"=>sout3<="1110111";
  when "1011"=>sout3<="0011111";
  when "1100"=>sout3<="0001101";
  when "1101"=>sout3<="0111101";
  when "1110"=>sout3<="1001111";
  when "1111"=>sout3<="1000111";
  when others=>sout3<="0000001";
end case;
end process;

  process(input(15 downto 12)) is
    begin
  case input(15 downto 12) is
  
  when "0000"=>sout4<="1111110";
  when "0001"=>sout4<="0110000";
  when "0010"=>sout4<="1101101";
  when "0011"=>sout4<="1111001";
  when "0100"=>sout4<="0110011";
  when "0101"=>sout4<="1011011";
  when "0110"=>sout4<="1011111";
  when "0111"=>sout4<="1110000";
  when "1000"=>sout4<="1111111";
  when "1001"=>sout4<="1111011";
  when "1010"=>sout4<="1110111";
  when "1011"=>sout4<="0011111";
  when "1100"=>sout4<="0001101";
  when "1101"=>sout4<="0111101";
  when "1110"=>sout4<="1001111";
  when "1111"=>sout4<="1000111";
  when others=>sout4<="0000001";
end case;
end process;

  process(input(19 downto 16)) is
    begin
  case input(19 downto 16) is
  
  when "0000"=>sout5<="1111110";
  when "0001"=>sout5<="0110000";
  when "0010"=>sout5<="1101101";
  when "0011"=>sout5<="1111001";
  when "0100"=>sout5<="0110011";
  when "0101"=>sout5<="1011011";
  when "0110"=>sout5<="1011111";
  when "0111"=>sout5<="1110000";
  when "1000"=>sout5<="1111111";
  when "1001"=>sout5<="1111011";
  when "1010"=>sout5<="1110111";
  when "1011"=>sout5<="0011111";
  when "1100"=>sout5<="0001101";
  when "1101"=>sout5<="0111101";
  when "1110"=>sout5<="1001111";
  when "1111"=>sout5<="1000111";
  when others=>sout5<="0000001";
end case;
end process;

  process(input(23 downto 20)) is
    begin
  case input(23 downto 20) is
  
  when "0000"=>sout6<="1111110";
  when "0001"=>sout6<="0110000";
  when "0010"=>sout6<="1101101";
  when "0011"=>sout6<="1111001";
  when "0100"=>sout6<="0110011";
  when "0101"=>sout6<="1011011";
  when "0110"=>sout6<="1011111";
  when "0111"=>sout6<="1110000";
  when "1000"=>sout6<="1111111";
  when "1001"=>sout6<="1111011";
  when "1010"=>sout6<="1110111";
  when "1011"=>sout6<="0011111";
  when "1100"=>sout6<="0001101";
  when "1101"=>sout6<="0111101";
  when "1110"=>sout6<="1001111";
  when "1111"=>sout6<="1000111";
  when others=>sout6<="0000001";
end case;
end process;

  process(input(27 downto 24)) is
    begin
  case input(27 downto 24) is
  
  when "0000"=>sout7<="1111110";
  when "0001"=>sout7<="0110000";
  when "0010"=>sout7<="1101101";
  when "0011"=>sout7<="1111001";
  when "0100"=>sout7<="0110011";
  when "0101"=>sout7<="1011011";
  when "0110"=>sout7<="1011111";
  when "0111"=>sout7<="1110000";
  when "1000"=>sout7<="1111111";
  when "1001"=>sout7<="1111011";
  when "1010"=>sout7<="1110111";
  when "1011"=>sout7<="0011111";
  when "1100"=>sout7<="0001101";
  when "1101"=>sout7<="0111101";
  when "1110"=>sout7<="1001111";
  when "1111"=>sout7<="1000111";
  when others=>sout7<="0000001";
end case;
end process;

  process(input(31 downto 28)) is
    begin
  case input(31 downto 28) is
  
  when "0000"=>sout8<="1111110";
  when "0001"=>sout8<="0110000";
  when "0010"=>sout8<="1101101";
  when "0011"=>sout8<="1111001";
  when "0100"=>sout8<="0110011";
  when "0101"=>sout8<="1011011";
  when "0110"=>sout8<="1011111";
  when "0111"=>sout8<="1110000";
  when "1000"=>sout8<="1111111";
  when "1001"=>sout8<="1111011";
  when "1010"=>sout8<="1110111";
  when "1011"=>sout8<="0011111";
  when "1100"=>sout8<="0001101";
  when "1101"=>sout8<="0111101";
  when "1110"=>sout8<="1001111";
  when "1111"=>sout8<="1000111";
  when others=>sout8<="0000001";
end case;
end process;

out1 <= not sout1;
out2 <= not sout2;
out3 <= not sout3;
out4 <= not sout4;
out5 <= not sout5;
out6 <= not sout6;
out7 <= not sout7;
out8 <= not sout8;
END struct;