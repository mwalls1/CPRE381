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

entity ones_complement_b is
generic(N : integer := 32);
  port(i_A          : in std_logic_vector(N-1 downto 0);
       o_F          : out std_logic_vector(N-1 downto 0));

end ones_complement_b;

architecture dataflow of ones_complement_b is
begin

  o_F <= not i_A;
  
end dataflow;