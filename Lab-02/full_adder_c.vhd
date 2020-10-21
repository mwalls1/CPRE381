-------------------------------------------------------------------------
-- Joseph Zambreno
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- invg.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of a 1-input NOT 
-- gate.
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
entity full_adder_c is
generic(N : integer := 32);
  port(i_A          : in unsigned(N-1 downto 0);
       i_B	    : in unsigned(N-1 downto 0);
       o_F          : out unsigned(N-1 downto 0));

end full_adder_c;

architecture dataflow of full_adder_c is
begin

	 o_F <= i_A + i_B;

end dataflow;