library IEEE;
use IEEE.std_logic_1164.all;


entity Einstein is

  port(iCLK             : in std_logic;
       iM 		            : in integer;
       oY 		            : out integer);

end Einstein;

architecture structure of Einstein is
  
  -- and Multiplier.vhd (not strictly necessary).

  component Multiplier
    port(iCLK           : in std_logic;
         iA             : in integer;
         iB             : in integer;
         oC             : out integer);
  end component;

  -- Arbitrary constants for the A, B, C values. No need to change these.
  constant cC : integer := 9487;

  -- Signals to store A*x, B*x
  signal sVALUE_Ax:integer;

begin

  
  ---------------------------------------------------------------------------
  -- Level 1: Calculate C*C
  ---------------------------------------------------------------------------
  g_Mult1: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => cC,
             iB               => cC,
             oC               => sVALUE_Ax);
g_Mult2: Multiplier
    port MAP(iCLK             => iCLK,
             iA               => sVALUE_Ax,
             iB               => iM,
             oC               => oY);
end structure;