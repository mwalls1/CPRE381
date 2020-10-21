-------------------------------------------------------------------------
-- Joseph Zambreno
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- dff.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an edge-triggered
-- flip-flop with parallel access and reset.
--
--
-- NOTES:
-- 8/19/16 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity NbitReg is
generic(N : integer := 32);
  port(i_CLK        : in std_logic;     -- Clock input
       i_We         : in std_logic;	-- Write enable input
       i_Re         : in std_logic;     -- Reset input
       i_D          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(N-1 downto 0));   -- Data value output

end NbitReg;

architecture structure of NbitReg is
component dff
    port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
  end component;

begin
G1: for i in 0 to N-1 generate
g_DFF1: dff
	port MAP(i_CLK               => i_CLK,
            	 i_RST               => i_Re,
            	 i_WE               => i_We,
            	 i_D               => i_D(i),
            	 o_Q              => o_Q(i));
end generate;
  
end structure;