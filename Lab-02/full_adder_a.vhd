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


entity full_adder_a is

  port(Cin             		    : in std_logic;
       iA 		            : in std_logic;
       iB 		            : in std_logic;
       sum 		            : out std_logic;
       Co			    : out std_logic);

end full_adder_a;

architecture structure of full_adder_a is
  
  component xorg2
    port(i_A           : in std_logic;
         i_B             : in std_logic;
         o_F             : out std_logic);
  end component;

  component andg2
    port(i_A           : in std_logic;
         i_B             : in std_logic;
         o_F             : out std_logic);
  end component;

component org2
    port(i_A           : in std_logic;
	 i_b		: in std_logic;
         o_F             : out std_logic);
  end component;

  -- Signals to store xorg of A and B
  signal sVALUE_A : std_logic;
  -- Signal to store Ax and Cin
  signal sVALUE_B : std_logic;
  -- Signal to store A and B
  signal sVALUE_C   : std_logic;

begin

  
  ---------------------------------------------------------------------------
  -- Level 1: xor A and B
  ---------------------------------------------------------------------------
  g_Xor1: xorg2
    port MAP(i_A               => iA,
             i_B               => iB,
             o_F               => sVALUE_A);
    
 ---------------------------------------------------------------------------
  -- Level 2: Xor sVALUE_A and Cin
  ---------------------------------------------------------------------------
  g_Xor2: xorg2
    port MAP(i_A               => sVALUE_A,
             i_B               => Cin,
             o_F               => sum);
 ---------------------------------------------------------------------------
  -- Level 3: and Cin and sVALUE_A, and A and V
  ---------------------------------------------------------------------------
  g_And1: andg2
	port MAP(i_A => sVALUE_A,
		 i_B => Cin,
		 o_F => sVALUE_B);
  g_And2: andg2
	port MAP(i_A => iA,
		 i_B => iB,
		 o_F => sVALUE_C);
 ---------------------------------------------------------------------------
  -- Level 4: OR sVALUE_C and sVALUE_B
  ---------------------------------------------------------------------------
g_Or2: org2
	port MAP(i_A => sVALUE_B,
		 i_B => sVALUE_C,
		 o_F => Co);
end structure;