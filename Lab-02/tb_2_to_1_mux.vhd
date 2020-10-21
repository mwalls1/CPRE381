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
entity tb_2_to_1_mux is
generic(N : integer := 32);
end tb_2_to_1_mux;

architecture structure of tb_2_to_1_mux is

-- Declare the component we are going to instantiate
component two_to_one_mux_b
generic(N : integer := 32);
  port(sel  : in std_logic;
       iA  : in std_logic_vector(N-1 downto 0);
       iB  : in std_logic_vector(N-1 downto 0);
       oY  : out std_logic_vector(N-1 downto 0));
end component;

component two_to_one_mux_c
generic(N : integer := 32);
  port(sel  : in std_logic;
       i_A  : in std_logic_vector(N-1 downto 0);
       i_B  : in std_logic_vector(N-1 downto 0);
       o_F  : out std_logic_vector(N-1 downto 0));
end component;

-- Signals to connect to the andg2 module
signal s_A,s_B,s_Fa, s_Fb  : std_logic_vector(N-1 downto 0);
signal sE : std_logic;

begin

DUT: two_to_one_mux_b 
  generic map(N => 32)
  port map(sel  => sE,
	   iA  => s_A,
	   iB  => s_B,
  	   oY  => s_Fa);

DOT: two_to_one_mux_c 
  generic map(N => 32)
  port map(sel  => sE,
	   i_A  => s_A,
	   i_B  => s_B,
  	   o_F  => s_Fb);


  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    s_A <= x"00000000";
    s_B <= x"11111111";
    sE <= '1';
    wait for 100 ns;

    s_A <= x"00000000";
    s_B <= x"11111111";
    sE <= '0';
    wait for 100 ns;
    s_A <= x"FEFDAEFC";
    s_B <= x"FEFCDBAD";
    sE <= '0';
    wait for 100 ns;
    s_A <= x"FEFDAEFC";
    s_B <= x"FEFCDBAD";
    sE <= '1';
    wait for 100 ns;


  end process;
  
end structure;