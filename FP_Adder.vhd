library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity FP_Adder is
Port( A, B: in std_logic_vector (7 downto 0);
   	 Sum: out std_logic_vector (7 downto 0));
end FP_Adder;

architecture myimplementation of FP_Adder is


	
	component Adder is
Port( A, B: in std_logic_vector (7 downto 0);
   	 Sum: out std_logic_vector (7 downto 0));
	end component;
--signal and variable declarations

signal Sum2 : std_logic_vector (7 downto 0);
begin
 
	adder0 : Adder
	port map (A, B, Sum2);
    
-- when A or B are not a number
	Sum <= "11111111" when ((A(6 downto 3) = "1111" and A(2 downto 0) /= "000") OR (B(6 downto 3) = "1111" and B(2 downto 0) /= "000")) else 
    --when A and B are different signs of infinity
	       "11111111" when (A(6 downto 0) = "1111000" and B(6 downto 0) = "1111000" and A(7) /= B(7)) else	 
    --when A and B are the same sign of infinity
	       A when (A(6 downto 0) = "1111000" and B(6 downto 0) = "1111000" and A(7) = B(7)) else 
    --when A is infinity and B is not
	       A when (A(6 downto 0) = "1111000" and B(6 downto 3) /= "1111") else
    --when B is infinity and A is not
	       B when (B(6 downto 0) = "1111000" and A(6 downto 3) /= "1111") else
--when B is zero
	       A when (B(6 downto 0) = "0000000") else
--when A is zero
	       B when (A(6 downto 0) = "0000000") else 
   --otherwise	 
	 Sum2;

end myimplementation;
