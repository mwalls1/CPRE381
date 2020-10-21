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
use IEEE.numeric_std.all;
-- This is an empty entity so we don't need to declare ports
entity full_adder_d is
generic(N : integer := 32);
end full_adder_d;

architecture structure of full_adder_d is

-- Declare the component we are going to instantiate
component full_adder_b
generic(N : integer := 32);
  port(Cin  : in std_logic;
       Co   : in std_logic;
       iA  : in std_logic_vector(N-1 downto 0);
       iB  : in std_logic_vector(N-1 downto 0);
       sum  : out std_logic_vector(N-1 downto 0));
end component;

component full_adder_c
generic(N : integer := 32);
  port(i_A  : in unsigned(N-1 downto 0);
       i_B  : in unsigned(N-1 downto 0);
       o_F  : out unsigned(N-1 downto 0));
end component;

-- Signals to connect to the andg2 module
signal s_A,s_B,s_Out1 : std_logic_vector(N-1 downto 0);
signal s_An, s_Bn, s_Out2 : unsigned(N-1 downto 0);
signal sE, s_Carry: std_logic;

begin

DUT: full_adder_b 
  generic map(N => 32)
  port map(Cin  => sE,
           Co => s_Carry,
	   iA  => s_A,
	   iB  => s_B,
  	   sum  => s_Out1);

DOT: full_adder_c 
  generic map(N => 32)
  port map(i_A  => s_An,
	   i_B  => s_Bn,
  	   o_F  => s_Out2);


  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    s_A <= x"00000000";
    s_B <= x"11111111";
    s_An <= x"00000000";
    s_Bn <= x"11111111";
    sE <= '0';
    wait for 100 ns;

    s_A <= x"11111111";
    s_B <= x"11111111";
    s_An <= x"11111111";
    s_Bn <= x"11111111";
    sE <= '0';
    wait for 100 ns;

    s_A <= x"00000000";
    s_B <= x"11111111";
    s_An <= x"00000000";
    s_Bn <= x"11111111";
    sE <= '1';
    wait for 100 ns;

    s_A <= x"11111111";
    s_B <= x"11111111";
    s_An <= x"11111111";
    s_Bn <= x"11111111";
    sE <= '1';
    wait for 100 ns;

    s_A <= x"00F0F000";
    s_B <= x"EEDCADED";
    s_An <= x"00F0F000";
    s_Bn <= x"EEDCADED";
    sE <= '0';
    wait for 100 ns;

    s_A <= x"00F0F000";
    s_B <= x"EEDCADED";
    s_An <= x"00F0F000";
    s_Bn <= x"EEDCADED";
    sE <= '1';
    wait for 100 ns;


  end process;
  
end structure;