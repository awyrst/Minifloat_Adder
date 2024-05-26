library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sup_comp is
Port (A,B : in std_logic_vector (3 downto 0);
   	 C      : out std_logic_vector (1 downto 0);
   	 D      : out std_logic_vector (3 downto 0));
	
end sup_comp;

architecture myimplementation of sup_comp is
--component declarations
   component comparator_4bit
   	 port(A,B : in std_logic_vector (3 downto 0);
   		 F : out std_logic);
    end component;

--signal and variable declarations
signal out1 : std_logic;
signal out2 : std_logic;
begin
   comp1 : comparator_4bit
    port map (A, B, out1);

    comp2 : comparator_4bit
    port map (B, A, out2);




C <= out1 & out2;

D <= std_logic_vector(unsigned(B)-unsigned(A)) when (out2 = '1') else
   std_logic_vector(unsigned(A)-unsigned(B)) when (out1 = '1') else
   "0000";
  
end myimplementation;

