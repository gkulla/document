library ieee;
use ieee.STD_LOGIC_1164.ALL;

entity Seg_Display_Decoder is
  port( A, B, C, D                : in std_logic;
        f0, f1, f2, f3, f4, f5, f6: out std_logic);   
end Seg_Display_Decoder;

architecture struct of Seg_Display_Decoder is
signal sig_output1 : std_logic_vector(6 downto 0);
--F0 = A' C  + A B' C'  + A' B D + B' C' D';
--F1 = A' B'  + B' C'  + A' C D + A' C' D';
--F2 = A' B  + B' C'  + A' D;
--F3 = A' B' C  + A B' C'  + A' C D' + A' B C' D + B' C' D';
--F4 = A' C D' + B' C' D';
--F5 = A' B C'  + A B' C'  + A' B D' + B' C' D';
--F6 = A' B' C  + A' B C'  + A B' C'  + A' C D';
begin
sig_output1(0) <= (not A and C)or(A and not B and not C)or(not A and B and D)or(not B and not C and not D);
sig_output1(1) <= (not A and not B)or(not B and not C)or(not A and C and D)or(not A and not C and not D);
sig_output1(2) <= (not A and B)or(not B and not C)or(not A and D);
sig_output1(3) <= (not A and not B and C)or(A and not B and not C)or(not A and C and not D)or(not A and B and not C and D)or(not B and not C and not D);
sig_output1(4) <= (not A and C and not D)or(not B and not C and not D);
sig_output1(5) <= (not A and B and not C)or(A and not B and not C)or(not A and B and not D)or(not B and not C and not D);
sig_output1(6) <= (not A and not B and C)or(not A and B and not C)or(A and not B and not C)or(not A and C and not D);

f0  <= NOT sig_output1(0);
f1  <= NOT sig_output1(1);
f2  <= NOT sig_output1(2);
f3  <= NOT sig_output1(3);
f4  <= NOT sig_output1(4);
f5  <= NOT sig_output1(5);
f6  <= NOT sig_output1(6);
END struct;