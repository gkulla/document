library ieee;
use ieee.STD_LOGIC_1164.ALL;

entity Seg_Display is
  port( input : in std_logic_vector(31 downto 0);
        output: out std_logic_vector(6 downto 0)
       );       
end Seg_Display;

architecture struct of Seg_Display is
  signal sig : std_logic_vector(6 downto 0);
 
begin
  process(input(3 downto 0)) is
    begin
  case input(3 downto 0) is
	  when "0000"=>sig<="1111110";
	  when "0001"=>sig<="0110000";
	  when "0010"=>sig<="1101101";
	  when "0011"=>sig<="1111001";
	  when "0100"=>sig<="0110011";
	  when "0101"=>sig<="1011011";
	  when "0110"=>sig<="1011111";
	  when "0111"=>sig<="1110000";
	  when "1000"=>sig<="1111111";
	  when "1001"=>sig<="1111011";
	  when others=>sig<="1111111";
end case;
end process;

output <= not sig;
END struct;