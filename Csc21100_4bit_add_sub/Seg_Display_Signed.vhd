library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity Seg_Display_Signed is
  port( input  : in std_logic_vector(3 downto 0);
        output1: out std_logic_vector(6 downto 0);
        output2: out std_logic_vector(6 downto 0));   
end Seg_Display_Signed;

architecture struct of Seg_Display_Signed is
signal sig_output1 : std_logic_vector(6 downto 0);
signal sig_output2 : std_logic_vector(6 downto 0);
  
begin
  process(input(3 downto 0)) is
    begin
  case input(3 downto 0) is
	  when "0000"=> sig_output1 <="1111110";
	  when "0001"=> sig_output1 <="0110000";
	  when "0010"=> sig_output1 <="1101101";
	  when "0011"=> sig_output1 <="1111001";
	  when "0100"=> sig_output1 <="0110011";
	  when "0101"=> sig_output1 <="1011011";
	  when "0110"=> sig_output1 <="1011111";
	  when "0111"=> sig_output1 <="1110000";
	  when "1000"=> sig_output1 <="1111111";
	  when "1001"=> sig_output1 <="1110000";
	  when "1010"=> sig_output1 <="1011111";
	  when "1011"=> sig_output1 <="1011011";
	  when "1100"=> sig_output1 <="0110011";
	  when "1101"=> sig_output1 <="1111001";
	  when "1110"=> sig_output1 <="1101101";
      when "1111"=> sig_output1 <="0110000";
	  when others=> sig_output1 <="1111110";
end case;
end process;

  process(input(3 downto 0)) is
    begin
  case input(3 downto 0) is
	  when "1000"=> sig_output2 <="0000001";
	  when "1001"=> sig_output2 <="0000001";
	  when "1010"=> sig_output2 <="0000001";
	  when "1011"=> sig_output2 <="0000001";
	  when "1100"=> sig_output2 <="0000001";
	  when "1101"=> sig_output2 <="0000001";
	  when "1110"=> sig_output2 <="0000001";
      when "1111"=> sig_output2 <="0000001";
	  when others=> sig_output2 <="1111110";
end case;
end process;

output1 <= NOT sig_output1;
output2 <= NOT sig_output2;
END struct;					