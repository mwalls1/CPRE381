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


entity add_subtract is
generic(N : integer := 32);
  port(Ctrl			    : in std_logic;
       iA 		            : in std_logic_vector(N-1 downto 0);
       iB 		            : in std_logic_vector(N-1 downto 0);
       sum 		            : out std_logic_vector(N-1 downto 0);
       Co			    : out std_logic);

end add_subtract;

architecture structure of add_subtract is
  
  component full_adder_b
    port(Cin		: in std_logic;
	 Co		: out std_logic;
	 iA             : in std_logic_vector(N-1 downto 0);
         iB             : in std_logic_vector(N-1 downto 0);
         sum            : out std_logic_vector(N-1 downto 0));
  end component;
  component ones_complement
    port(i_A		: in std_logic_vector(N-1 downto 0);
         o_F            : out std_logic_vector(N-1 downto 0));
  end component;
  component two_to_one_mux_b
    port(sel	      : in std_logic;
	 iA           : in std_logic_vector(N-1 downto 0);
         iB           : in std_logic_vector(N-1 downto 0);
         oY           : out std_logic_vector(N-1 downto 0));
  end component;

  -- Signals to store xorg of A and B
  signal sVALUE_A : std_logic_vector(N-1 downto 0);
  -- Signal to store Ax and Cin
  signal sVALUE_B : std_logic_vector(N-1 downto 0);
begin

  ---------------------------------------------------------------------------
  -- Level 1: Invert B
  ---------------------------------------------------------------------------
  g_inv1: ones_complement
    port MAP(i_A               => iB,
             o_F               => sVALUE_A);
 ---------------------------------------------------------------------------
  -- Level 2: Select add or subtract
  ---------------------------------------------------------------------------
  g_mux1: two_to_one_mux_b
    port MAP(sel               => Ctrl,
	     iA		       => iB,
	     iB		       => sVALUE_A,
             oY                => sVALUE_B);
 ---------------------------------------------------------------------------
  -- Level 3: Add/subtract
  ---------------------------------------------------------------------------
  g_add1: full_adder_b
    port MAP(Cin               => Ctrl,
             iA                => iA,
             iB                => sVALUE_B,
             sum               => sum,
	     Co		       => Co);


end structure;