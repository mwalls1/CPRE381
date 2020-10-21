-------------------------------------------------------------------------
-- Joseph Zambreno
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- Quadratic.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of the Quadratic
-- equation Ax^2+Bx+C using invidual adder and multiplier units.
--
--
-- NOTES:
-- 8/19/16 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity two_to_one_mux_b is
  generic(N : integer := 32);
  port(sel             		    : in std_logic;
       iA 		            : in std_logic_vector(N-1 downto 0);
       iB 		            : in std_logic_vector(N-1 downto 0);
       oY 		            : out std_logic_vector(N-1 downto 0));

end two_to_one_mux_b;

architecture structure of two_to_one_mux_b is
  
  -- Describe the component entities as defined in Adder.vhd 
  -- and Multiplier.vhd (not strictly necessary).
  component org2
    port(i_A           : in std_logic;
         i_B             : in std_logic;
         o_F             : out std_logic);
  end component;

  component andg2
    port(i_A           : in std_logic;
         i_B             : in std_logic;
         o_F             : out std_logic);
  end component;

component invg
    port(i_A           : in std_logic;
         o_F             : out std_logic);
  end component;

  -- Signals to store !Sel
  signal sVALUE_A : std_logic;
  -- Signal to store sel and iB
  signal sVALUE_B : std_logic_vector(N-1 downto 0);
  -- Signal to store sigA and iA
  signal sVALUE_C   : std_logic_vector(N-1 downto 0);

begin

  
  ---------------------------------------------------------------------------
  -- Level 1: !sel and Sel and B
  ---------------------------------------------------------------------------
  G1: for i in 0 to N-1 generate
  g_And1: andg2
    port MAP(i_A               => sel,
             i_B               => iB(i),
             o_F               => sVALUE_B(i));
  end generate;
	
  g_Not1: invg
    port MAP(i_A               => sel,
             o_F               => sVALUE_A);
    
 ---------------------------------------------------------------------------
  -- Level 2: Calculate A*x*x, B*x+C
  ---------------------------------------------------------------------------
  G2: for i in 0 to N-1 generate
  g_And2: andg2
    port MAP(i_A               => sVALUE_A,
             i_B               => iA(i),
             o_F               => sVALUE_C(i));
  end generate;

  G3: for i in 0 to N-1 generate
  g_Or1: org2
    port MAP(i_A               => sVALUE_B(i),
             i_B               => sVALUE_C(i),
             o_F               => oY(i));
  end generate;
  
end structure;