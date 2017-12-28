library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;
use ieee.STD_LOGIC_UNSIGNED.all;

entity Seg_Display_Signed is
  port( A, B, C, D                       : in std_logic;
        f0, f1, f2, f3, f4, f5, f6       : out std_logic;
        sf0, sf1, sf2, sf3, sf4, sf5, sf6: out std_logic
        );   
end Seg_Display_Signed;

architecture struct of Seg_Display_Signed is
signal sig_output1 : std_logic_vector(6 downto 0);
signal sig_output2 : std_logic_vector(6 downto 0);

BEGIN
sig_output2(0) <= not A;
sig_output2(1) <= not A;
sig_output2(2) <= not A;
sig_output2(3) <= not A;
sig_output2(4) <= not A;
sig_output2(5) <= not A;
sig_output2(6) <= A;

sig_output1(0) <= (not B and not D)or(C and not D)or(A and not B)or(not A and C)or(B and not C and D);
sig_output1(1) <= (A and B)or(not A and not B)or(not C and not D)or(not B and not C)or(B and C and D);
sig_output1(2) <= (not C)or (D)or(not A and B)or(A and not B);
sig_output1(3) <= (not B and C)or( not B and not D)or(C and not D)or(B and not C and D);
sig_output1(4) <= (not B and not D)or(C and not D);
sig_output1(5) <= (not C and not D)or(A and not B and C)or(not A and B and not C)or(not A and B and not D);
sig_output1(6) <= (not B and C)or(B and not C)or(A and not D)or(C and not D);


f0  <= NOT sig_output1(0);
f1  <= NOT sig_output1(1);
f2  <= NOT sig_output1(2);
f3  <= NOT sig_output1(3);
f4  <= NOT sig_output1(4);
f5  <= NOT sig_output1(5);
f6  <= NOT sig_output1(6);
--------------------------
sf0  <= NOT sig_output2(0);
sf1  <= NOT sig_output2(1);
sf2  <= NOT sig_output2(2);
sf3  <= NOT sig_output2(3);
sf4  <= NOT sig_output2(4);
sf5  <= NOT sig_output2(5);
sf6  <= NOT sig_output2(6);
END struct;					