library ieee;
use ieee.STD_LOGIC_1164.ALL;

entity Seg_Display_Two is
  port( input: in std_logic_vector( 7 downto 0);
        f : out std_logic_vector(6 downto 0);
        sf: out std_logic_vector(6 downto 0)
        ); 
end Seg_Display_Two;

architecture struct of Seg_Display_Two is
signal sig_output1 : std_logic_vector(6 downto 0);
signal sig_output2 : std_logic_vector(6 downto 0);

begin
  process(input) is
    begin
  case input(3 downto 0) is
  
  when "0000"=>sig_output1<="1111110";
  when "0001"=>sig_output1<="0110000";
  when "0010"=>sig_output1<="1101101";
  when "0011"=>sig_output1<="1111001";
  when "0100"=>sig_output1<="0110011";
  when "0101"=>sig_output1<="1011011";
  when "0110"=>sig_output1<="1011111";
  when "0111"=>sig_output1<="1110000";
  when "1000"=>sig_output1<="1111111";
  when "1001"=>sig_output1<="1111011";
  when "1010"=>sig_output1<="1110111";
  when "1011"=>sig_output1<="0011111";
  when "1100"=>sig_output1<="0001101";
  when "1101"=>sig_output1<="0111101";
  when "1110"=>sig_output1<="1001111";
  when "1111"=>sig_output1<="1000111";
  when others=>sig_output1<="0000000";
end case;
end process;

  process(input(7 downto 4)) is
    begin
  case input(7 downto 4) is
  when "0000"=>sig_output2<="1111110";
  when "0001"=>sig_output2<="0110000";
  when "0010"=>sig_output2<="1101101";
  when "0011"=>sig_output2<="1111001";
  when "0100"=>sig_output2<="0110011";
  when "0101"=>sig_output2<="1011011";
  when "0110"=>sig_output2<="1011111";
  when "0111"=>sig_output2<="1110000";
  when "1000"=>sig_output2<="1111111";
  when "1001"=>sig_output2<="1111011";
  when "1010"=>sig_output2<="1110111";
  when "1011"=>sig_output2<="0011111";
  when "1100"=>sig_output2<="0001101";
  when "1101"=>sig_output2<="0111101";
  when "1110"=>sig_output2<="1001111";
  when "1111"=>sig_output2<="1000111";
  when others=>sig_output2<="0000000";
end case;
end process;

f <= not sig_output1;
sf <= not sig_output2;
END struct;