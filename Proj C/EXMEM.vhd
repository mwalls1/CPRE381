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

entity EXMEM is
  port(i_CLK        : in std_logic;-- Clock input
       iRst         : in std_logic;
       iWrEn        : in std_logic;	-- Write enable input
       iMemToReg    : in std_logic;
       iMemWrite    : in std_logic;
       iRegWrite    : in std_logic;
       iSelLui	    : in std_logic;
       i_B 	    : in std_logic_vector(31 downto 0);
       i_RealRd     : in std_logic_vector(4 downto 0);
       i_ALUOut     : in std_logic_vector(31 downto 0);
       i_Inst       : in std_logic_vector(15 downto 0);
       oMemToReg    : out std_logic;
       oMemWrite    : out std_logic;
       oRegWrite    : out std_logic;
       oSelLui	    : out std_logic;
       o_B 	    : out std_logic_vector(31 downto 0);
       o_RealRd     : out std_logic_vector(4 downto 0);
       o_ALUOut     : out std_logic_vector(31 downto 0);
       o_Inst       : out std_logic_vector(15 downto 0));
      

end EXMEM;

architecture structure of EXMEM is
component dffSynch
    port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
  end component;
signal iD, oQ : std_logic_vector(88 downto 0);
begin
iD <= iMemToReg & iMemWrite & iRegWrite & iSelLui & i_B & i_RealRd & i_ALUOut & i_Inst;
G1: for i in 0 to 88 generate
g_DFF1: dffSynch
	port MAP(i_CLK               => i_CLK,
            	 i_RST               => iRst,
            	 i_WE               => iWrEn,
            	 i_D               => iD(i),
            	 o_Q              => oQ(i));
end generate;
oMemToReg <= oQ(88);
oMemWrite <= oQ(87);
oRegWrite <= oQ(86);
oSelLui <= oQ(85);
o_B <= oQ(84 downto 53);
o_RealRd <= oQ(52 downto 48);
o_ALUOut <= oQ(47 downto 16);
o_Inst <= oQ(15 downto 0);
end structure;