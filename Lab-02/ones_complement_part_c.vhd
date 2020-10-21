-------------------------------------------------------------------------
-- Joseph Zambreno
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- tb_andg2.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a simple VHDL testbench for the
-- 2-input AND gate.
--
--
-- NOTES:
-- 8/19/16 by JAZ::Design created.
-- 1/16/19 by H3::Changed name to avoid name conflict with Quartus 
--         primitives.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- This is an empty entity so we don't need to declare ports
entity ones_complement_c is
generic(N : integer := 32);
end ones_complement_c;

architecture structure of ones_complement_c is

-- Declare the component we are going to instantiate
component ones_complement
	generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       o_F  : out std_logic_vector(N-1 downto 0));
end component;

component ones_complement_b
generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       o_F  : out std_logic_vector(N-1 downto 0));
end component;

-- Signals to connect to the andg2 module
signal s_A,s_Fa, s_Fb  : std_logic_vector(N-1 downto 0);

begin

DUT: ones_complement 
  generic map(N => 32)
  port map(i_A  => s_A,
  	   o_F  => s_Fa);

DOT: ones_complement_b 
  generic map(N => 32)
  port map(i_A  => s_A,
  	   o_F  => s_Fb);


  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    s_A <= x"00000000";
    wait for 100 ns;

    s_A <= x"000FFFFF";
    wait for 100 ns;

    s_A <= x"FFFFE000";
    wait for 100 ns;

    s_A <= x"EFEFEFEF";
    wait for 100 ns;


  end process;
  
end structure;