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


entity full_adder_b is
generic(N : integer := 32);
  port(Cin             	    : in std_logic;
       Co			: out std_logic;
       iA 		            : in std_logic_vector(N-1 downto 0);
       iB 		            : in std_logic_vector(N-1 downto 0);
       sum 		            : out std_logic_vector(N-1 downto 0));

end full_adder_b;

architecture structure of full_adder_b is
  
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
  signal sVALUE_A : std_logic_vector(N-1 downto 0);
  -- Signal to store Ax and Cin
  signal sVALUE_B : std_logic_vector(N-1 downto 0);
  -- Signal to store A and B
  signal sVALUE_C   : std_logic_vector(N-1 downto 0);
  signal s_Carry   : std_logic_vector(N-1 downto 0);

begin

 G1: for i in 0 to 0 generate
  ---------------------------------------------------------------------------
  -- Level 1: xor A and B
  ---------------------------------------------------------------------------
  g_Xor1: xorg2
    port MAP(i_A               => iA(i),
             i_B               => iB(i),
             o_F               => sVALUE_A(i));
    
 ---------------------------------------------------------------------------
  -- Level 2: Xor sVALUE_A and Cin
  ---------------------------------------------------------------------------
  g_Xor2: xorg2
    port MAP(i_A               => sVALUE_A(i),
             i_B               => Cin,
             o_F               => sum(i));
 ---------------------------------------------------------------------------
  -- Level 3: and Cin and sVALUE_A, and A and V
  ---------------------------------------------------------------------------
  g_And1: andg2
	port MAP(i_A => sVALUE_A(i),
		 i_B => Cin,
		 o_F => sVALUE_B(i));
  g_And2: andg2
	port MAP(i_A => iA(i),
		 i_B => iB(i),
		 o_F => sVALUE_C(i));
 ---------------------------------------------------------------------------
  -- Level 4: OR sVALUE_C and sVALUE_B
  ---------------------------------------------------------------------------
g_Or2: org2
	port MAP(i_A => sVALUE_B(i),
		 i_B => sVALUE_C(i),
		 o_F => s_Carry(i));
end generate;
G2: for i in 1 to N-1 generate
  ---------------------------------------------------------------------------
  -- Level 1: xor A and B
  ---------------------------------------------------------------------------
  g1_Xor1: xorg2
    port MAP(i_A               => iA(i),
             i_B               => iB(i),
             o_F               => sVALUE_A(i));
    
 ---------------------------------------------------------------------------
  -- Level 2: Xor sVALUE_A and Cin
  ---------------------------------------------------------------------------
  g1_Xor2: xorg2
    port MAP(i_A               => sVALUE_A(i),
             i_B               => s_Carry(i-1),
             o_F               => sum(i));
 ---------------------------------------------------------------------------
  -- Level 3: and Cin and sVALUE_A, and A and V
  ---------------------------------------------------------------------------
  g1_And1: andg2
	port MAP(i_A => sVALUE_A(i),
		 i_B => s_Carry(i-1),
		 o_F => sVALUE_B(i));
  g1_And2: andg2
	port MAP(i_A => iA(i),
		 i_B => iB(i),
		 o_F => sVALUE_C(i));
 ---------------------------------------------------------------------------
  -- Level 4: OR sVALUE_C and sVALUE_B
  ---------------------------------------------------------------------------
g1_Or2: org2
	port MAP(i_A => sVALUE_B(i),
		 i_B => sVALUE_C(i),
		 o_F => s_Carry(i));
		 Co <= s_carry(i);
end generate;

end structure;