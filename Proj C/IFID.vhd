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

entity IFID is
  port(i_CLK        : in std_logic;     -- Clock input
       iWrEn        : in std_logic;	-- Write enable input
       iRst         : in std_logic;     -- Reset input
       iInstruction : in std_logic_vector(31 downto 0);     -- Data value input
       iPC4         : in std_logic_vector(31 downto 0);
       o_Q          : out std_logic_vector(63 downto 0));   -- Data value output

end IFID;

architecture structure of IFID is
component dffSynch
    port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
  end component;
signal iD : std_logic_vector(63 downto 0);
begin
iD <= iPC4 & iInstruction;
G1: for i in 0 to 63 generate
g_DFF1: dflipflop
	port MAP(i_CLK               => i_CLK,
            	 i_RST               => iRst,
            	 i_WE               => iWrEn,
            	 i_D               => iD(i),
            	 o_Q              => o_Q(i));
end generate;
  
end structure;