library IEEE ;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Adder is
Port( A, B: in std_logic_vector (7 downto 0);
   	 Sum: out std_logic_vector (7 downto 0));
end Adder;

architecture myimplementation of Adder is
-- component declarations
component preparator is
Port (A,B : in std_logic_vector (7 downto 0);
   	  Y,Z : out std_logic_vector (19 downto 0);
   	  F : out std_logic_vector (3 downto 0));
	
end component;

component adder1 is
Port( Y, Z: in std_logic_vector (19 downto 0);
      A0, B0 : in std_logic;
      negative : out std_logic;
   	 X: out std_logic_vector (19 downto 0));
end component;

component normalizer is
port( X : in std_logic_vector (19 downto 0);
        exp : in std_logic_vector (3 downto 0);
        result : out std_logic_vector (6 downto 0));
        end component;

--signal declarations
signal why : std_logic_vector (19 downto 0);
signal zed : std_logic_vector (19 downto 0);
signal exp : std_logic_vector (3 downto 0);

signal minus : std_logic;
signal sum1 : std_logic_vector (19 downto 0);

signal finally : std_logic_vector (6 downto 0);
begin

prep : preparator
port map(A, B, why, zed, exp);

add : adder1
port map(why, zed, A(7), B(7), minus, sum1);

norm : normalizer
port map(sum1, exp, finally);

Sum <= minus & finally;


end myimplementation;
