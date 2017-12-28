library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity Display is
  port(      input : in std_logic_vector(6 downto 0);
                 f : out std_logic_vector(6 downto 0);
                sf : out std_logic_vector(6 downto 0)
        );   
end Display;

architecture struct of Display is
signal sig_output1 : std_logic_vector(6 downto 0);
signal sig_output2 : std_logic_vector(6 downto 0);
signal count: std_logic_vector(3 downto 0);
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
	  when "1001"=> sig_output1 <="1111011";--9
	  when "1010"=> sig_output1 <="1111110";--10
	  when "1011"=> sig_output1 <="0110000";--11
	  when "1100"=> sig_output1 <="1101101";--12
	  when "1101"=> sig_output1 <="1111001";--13
	  when "1110"=> sig_output1 <="0110011";--14
      when "1111"=> sig_output1 <="1011011";--15
	  when others=> sig_output1 <="1111110";
end case;
end process;
  case input(6 downto 4) is
	  when "01"=> sig_output1 <="0110000";
	  when "10"=> sig_output1 <="1101101";
	  when "11"=> sig_output1 <="1111001";
	  
	  when others=> sig_output1 <="1111110";
end case;
end process;

BEGIN

-------------------------------------------------------------------



f  <= NOT sig_output1;
sf  <= NOT sig_output2;
END struct;					