library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity preparator is
Port (A,B : in std_logic_vector (7 downto 0);
   	  Y,Z : out std_logic_vector (19 downto 0);
   	  F : out std_logic_vector (3 downto 0));
	
end preparator;

architecture myimplementation of preparator is
--component declarations
   component sup_comp
   	 port(A,B : in std_logic_vector (3 downto 0);
   	 C      : out std_logic_vector (1 downto 0);
   	 D      : out std_logic_vector (3 downto 0));
    end component;
    -- signal and variable declarations
    
signal C : std_logic_vector (1 downto 0);
signal count : std_logic_vector (3 downto 0);
    begin
    
    comp : sup_comp
    port map ( A(6 downto 3), B(6 downto 3), C, count);
    
    Y <= "00" & '1' & a(2 downto 0) & "00000000000000" when (C = "00" OR C = "10") else
           
    	 "000" & '1' & a(2 downto 0) & "0000000000000" when (C = "01" and count = "0001") else 
	 
	 "0000" & '1' & a(2 downto 0) & "000000000000" when (C = "01" and count = "0010") else 
	 
	 "00000" & '1' & a(2 downto 0) & "00000000000" when (C = "01" and count = "0011") else 
	 
	 "000000" & '1' & a(2 downto 0) & "0000000000" when (C = "01" and count = "0100") else 
	 
	 "0000000" & '1' & a(2 downto 0) & "000000000" when (C = "01" and count = "0101") else 
	 
	 "00000000" & '1' & a(2 downto 0) & "00000000" when (C = "01" and count = "0110") else 
	 
	 "000000000" & '1' & a(2 downto 0) & "0000000" when (C = "01" and count = "0111") else 
	 
	 "0000000000" & '1' & a(2 downto 0) & "000000" when (C = "01" and count = "1000") else 
	 
	 "00000000000" & '1' & a(2 downto 0) & "00000" when (C = "01" and count = "1001") else 
	 
	 "000000000000" & '1' & a(2 downto 0) & "0000" when (C = "01" and count = "1010") else 
	 
	 "0000000000000" & '1' & a(2 downto 0) & "000" when (C = "01" and count = "1011") else 
	 
	 "00000000000000" & '1' & a(2 downto 0) & "00" when (C = "01" and count = "1100") else 
	 
	 "000000000000000" & '1' & a(2 downto 0) & "0" when (C = "01" and count = "1101") else 
	 
	 "0000000000000000" & '1' & a(2 downto 0) when (C = "01" and count = "1110") else 
	      
		       "00000000000000000000";

      Z <= "00" & '1' & b(2 downto 0) & "00000000000000" when (C = "00" OR C = "01") else 
           
    	 "000" & '1' & b(2 downto 0) & "0000000000000" when (C = "10" and count = "0001") else 
         
         "0000" & '1' & b(2 downto 0) & "000000000000" when (C = "10" and count = "0010") else  
         
         "00000" & '1' & b(2 downto 0) & "00000000000" when (C = "10" and count = "0011") else 
         
         "000000" & '1' & b(2 downto 0) & "0000000000" when (C = "10" and count = "0100") else 
         
         "0000000" & '1' & b(2 downto 0) & "000000000" when (C = "10" and count = "0101") else 
         
         "00000000" & '1' & b(2 downto 0) & "00000000" when (C = "10" and count = "0110") else 
         
         "000000000" & '1' & b(2 downto 0) & "0000000" when (C = "10" and count = "0111") else 
         
         "0000000000" & '1' & b(2 downto 0) & "000000" when (C = "10" and count = "1000") else 
         
         "00000000000" & '1' & b(2 downto 0) & "00000" when (C = "10" and count = "1001") else 
         
         "000000000000" & '1' & b(2 downto 0) & "0000" when (C = "10" and count = "1010") else 
         
         "0000000000000" & '1' & b(2 downto 0) & "000" when (C = "10" and count = "1011") else 
         
         "00000000000000" & '1' & b(2 downto 0) & "00" when (C = "10" and count = "1100") else 
         
         "000000000000000" & '1' & b(2 downto 0) & "0" when (C = "10" and count = "1101") else 
         
         "0000000000000000" & '1' & b(2 downto 0) when (C = "10" and count = "1110") else 
	   
	     "00000000000000000000";

	     F <= A(6 downto 3) when C = "10" else
		   B(6 downto 3) when C = "01" else
                   A(6 downto 3); 
   end myimplementation;
