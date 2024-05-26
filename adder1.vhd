library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity adder1 is
Port( Y, Z: in std_logic_vector (19 downto 0);
      A0, B0 : in std_logic;
      negative : out std_logic;
   	 X: out std_logic_vector (19 downto 0));
end adder1;

architecture myimplementation of adder1 is


--signal and variable declarations

SIGNAL Y1 : std_logic_vector (19 downto 0);
SIGNAL Z1: std_logic_vector (19 downto 0);
SIGNAL X1 : std_logic_vector (19 downto 0);

begin
 
    Y1 <= std_logic_vector(unsigned(not Y) + 1) when A0 = '1' else
          Y when A0 = '0' else
          "00000000000000000000";
       
     Z1 <= std_logic_vector(unsigned(not Z) + 1) when B0 = '1' else
        Z when B0 = '0' else
        "00000000000000000000";
       
    X1 <= std_logic_vector(unsigned(Y1)+unsigned(Z1));
    
    negative <= X1(19);
    
     X <= std_logic_vector(unsigned(not X1) + 1) when X1(19) = '1' else
        X1 when X1(19) = '0' else
        "00000000000000000000";
end myimplementation;
