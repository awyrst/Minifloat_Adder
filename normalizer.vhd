library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity normalizer is
port( X : in std_logic_vector (19 downto 0);
        exp : in std_logic_vector (3 downto 0);
        result : out std_logic_vector (6 downto 0));
        end normalizer;
        
architecture myimplementation of normalizer is

--component declarations



--signal declarations


begin
                --case when input is simply zero
result <= "0000000" when (X(19 downto 0) = "00000000000000000000") else
                   
                   --case when input exponent is 14 and there was an overflow bit
          "1111000" when (X(18) = '1' and exp = "1110") else
          
          --exponent is less than 14 and there was an overflow bit
          std_logic_vector(unsigned(exp)+1) & X(17) & X(16) & X(15) when (X(18) = '1' and exp /= "1110") else
          
          --radix point is already aligned or exponent couldn't be decremented anyway
          exp & X(16) & X(15) & X(14) when (X(18 downto 17) = "01") else
          
          --radix point must be shifted to the right by one
          exp & X(16) & X(15) & X(14) when (X(18 downto 16) = "001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 16) = "001" and unsigned(exp) /= 0) else 
          
	  --radix point must be shifted to the right by two
          exp & X(16) & X(15) & X(14) when (X(18 downto 15) = "0001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 15) = "0001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 15) = "0001" and unsigned(exp) > 1) else
          
	  --radix point must be shifted to the right by three
          exp & X(16) & X(15) & X(14) when (X(18 downto 14) = "00001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 14) = "00001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 14) = "00001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 14) = "00001" and unsigned(exp) > 2) else 
          
	  --radix point must be shifted to the right by four
          exp & X(16) & X(15) & X(14) when (X(18 downto 13) = "000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 13) = "000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 13) = "000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 13) = "000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 13) = "000001" and unsigned(exp) > 3) else  
          
	  --radix point must be shifted by 5
          exp & X(16) & X(15) & X(14) when (X(18 downto 12) = "0000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 12) = "0000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 12) = "0000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 12) = "0000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 12) = "0000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 12) = "0000001" and unsigned(exp) > 4) else 
          
	  --radix point must be shifted by 6
          exp & X(16) & X(15) & X(14) when (X(18 downto 11) = "00000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 11) = "00000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 11) = "00000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 11) = "00000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 11) = "00000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 11) = "00000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 11) = "00000001" and unsigned(exp) > 5) else 
          
	  --radix point must be shifted by 7
          exp & X(16) & X(15) & X(14) when (X(18 downto 10) = "000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 10) = "000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 10) = "000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 10) = "000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 10) = "000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 10) = "000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 10) = "000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 10) = "000000001" and unsigned(exp) > 6) else 
          
	  --radix point must be shifted by 8
          exp & X(16) & X(15) & X(14) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 9) = "0000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 9) = "0000000001" and unsigned(exp) > 7) else 
          
	  --radix point must be shifted by 9
          exp & X(16) & X(15) & X(14) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 8) = "00000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 8) = "00000000001" and unsigned(exp) > 8) else 
          
	  --radix point must be shifted by 10
          exp & X(16) & X(15) & X(14) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 7) = "000000000001" and unsigned(exp) = 9) else 
          std_logic_vector(unsigned(exp)-10) & X(6) & X(5) & X(4) when (X(18 downto 7) = "000000000001" and unsigned(exp) > 9) else 
          
	  --radix point must be shifted by 11
          exp & X(16) & X(15) & X(14) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 9) else 
          std_logic_vector(unsigned(exp)-10) & X(6) & X(5) & X(4) when (X(18 downto 6) = "0000000000001" and unsigned(exp) = 10) else 
          std_logic_vector(unsigned(exp)-11) & X(5) & X(4) & X(3) when (X(18 downto 6) = "0000000000001" and unsigned(exp) > 10) else 
          
	  --radix point must be shifted by 12
          exp & X(16) & X(15) & X(14) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 9) else 
          std_logic_vector(unsigned(exp)-10) & X(6) & X(5) & X(4) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 10) else 
          std_logic_vector(unsigned(exp)-11) & X(5) & X(4) & X(3) when (X(18 downto 5) = "00000000000001" and unsigned(exp) = 11) else 
          std_logic_vector(unsigned(exp)-12) & X(4) & X(3) & X(2) when (X(18 downto 5) = "00000000000001" and unsigned(exp) > 11) else 
          
	  --radix point must be shifted by 13
          exp & X(16) & X(15) & X(14) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 9) else 
          std_logic_vector(unsigned(exp)-10) & X(6) & X(5) & X(4) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 10) else 
          std_logic_vector(unsigned(exp)-11) & X(5) & X(4) & X(3) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 11) else 
          std_logic_vector(unsigned(exp)-12) & X(4) & X(3) & X(2) when (X(18 downto 4) = "000000000000001" and unsigned(exp) = 12) else 
          std_logic_vector(unsigned(exp)-13) & X(3) & X(2) & X(1) when (X(18 downto 4) = "000000000000001" and unsigned(exp) > 12) else 
          
	  --radix point must be shifted by 14
          exp & X(16) & X(15) & X(14) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 0) else
          std_logic_vector(unsigned(exp)-1) & X(15) & X(14) & X(13) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 1) else 
          std_logic_vector(unsigned(exp)-2) & X(14) & X(13) & X(12) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 2) else
          std_logic_vector(unsigned(exp)-3) & X(13) & X(12) & X(11) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 3) else 
          std_logic_vector(unsigned(exp)-4) & X(12) & X(11) & X(10) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 4) else  
          std_logic_vector(unsigned(exp)-5) & X(11) & X(10) & X(9) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 5) else 
          std_logic_vector(unsigned(exp)-6) & X(10) & X(9) & X(8) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 6) else 
          std_logic_vector(unsigned(exp)-7) & X(9) & X(8) & X(7) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 7) else 
          std_logic_vector(unsigned(exp)-8) & X(8) & X(7) & X(6) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 8) else 
          std_logic_vector(unsigned(exp)-9) & X(7) & X(6) & X(5) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 9) else 
          std_logic_vector(unsigned(exp)-10) & X(6) & X(5) & X(4) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 10) else 
          std_logic_vector(unsigned(exp)-11) & X(5) & X(4) & X(3) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 11) else 
          std_logic_vector(unsigned(exp)-12) & X(4) & X(3) & X(2) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 12) else 
          std_logic_vector(unsigned(exp)-13) & X(3) & X(2) & X(1) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 13) else 
          std_logic_vector(unsigned(exp)-14) & X(2) & X(1) & X(0) when (X(18 downto 3) = "0000000000000001" and unsigned(exp) = 14) else 
  "0000000";        

          

end myimplementation;
