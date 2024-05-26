library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity comparator_4bit is
Port (A,B : in std_logic_vector (3 downto 0);
   	 F      : out std_logic);
end comparator_4bit;

architecture myimplementation of comparator_4bit is
    SIGNAL C : STD_LOGIC;
    SIGNAL D : STD_LOGIC;
    SIGNAL E : STD_LOGIC;
    SIGNAL Y : STD_LOGIC;
    


begin
C <= (A(3) and not B(3));
D <=  ((A(2) and not B(2)) and (A(3) or not B(3)));  
E <=  ((A(1) and not B(1)) and (A(2) or not B(2)) and (A(3) or not B(3)));
Y <=  ((A(0) and not B(0)) and (A(1) or not B(1)) and (A(2) or not B(2)) and (A(3) or not B(3)));


F <= C or D or E or Y;
end myimplementation;

