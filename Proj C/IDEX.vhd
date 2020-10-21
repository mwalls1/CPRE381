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

entity IDEX is
  port(i_CLK        : in std_logic;-- Clock input
       iRst         : in std_logic;
       iWrEn        : in std_logic;	-- Write enable input
       iRegDst      : in std_logic;
       iMemToReg    : in std_logic;
       iALUOp	    : in std_logic_vector(5 downto 0);
       iMemWrite    : in std_logic;
       iALUSrc      : in std_logic;
       iRegWrite    : in std_logic;
       iBInvert     : in std_logic;
       iSelExt	    : in std_logic;
       iSelLui	    : in std_logic;
       iSelShift    : in std_logic;
       iPC4         : in std_logic_vector(31 downto 0);
       i_A	    : in std_logic_vector(31 downto 0);
       i_B 	    : in std_logic_vector(31 downto 0);
       i_Im	    : in std_logic_vector(31 downto 0);
       i_Rt         : in std_logic_vector(4 downto 0);
       i_Rd         : in std_logic_vector(4 downto 0);
       oRegDst      : out std_logic;
       oMemToReg    : out std_logic;
       oALUOp	    : out std_logic_vector(5 downto 0);
       oMemWrite    : out std_logic;
       oALUSrc      : out std_logic;
       oRegWrite    : out std_logic;
       oBinvert     : out std_logic;
       oSelExt	    : out std_logic;
       oSelLui	    : out std_logic;
       oSelShift    : out std_logic;
       oPC4         : out std_logic_vector(31 downto 0);
       o_A	    : out std_logic_vector(31 downto 0);
       o_B          : out std_logic_vector(31 downto 0);
       o_Im	    : out std_logic_vector(31 downto 0);
       o_Rt         : out std_logic_vector(4 downto 0);
       o_Rd         : out std_logic_vector(4 downto 0));
      

end IDEX;

architecture structure of IDEX is
component dffSynch
    port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
  end component;
signal iD, oQ : std_logic_vector(152 downto 0);
begin
iD <= iRegDst& iMemToReg & iALUOp & iMemWrite & iALUSrc & iRegWrite & iBInvert & iSelExt & iSelLui & iSelShift & iPC4 & i_A & i_B & i_Im & i_Rt & i_Rd;
G1: for i in 0 to 152 generate
g_DFF1: dffSynch
	port MAP(i_CLK               => i_CLK,
            	 i_RST               => iRst,
            	 i_WE               => iWrEn,
            	 i_D               => iD(i),
            	 o_Q              => oQ(i));
end generate;
oRegDst <= oQ(152);
oMemToReg <= oQ(151);
oALUOp <= oQ(150 downto 145);
oMemWrite <= oQ(144);
oALUSrc <= oQ(143);
oRegWrite <= oQ(142);
oBinvert <= oQ(141);
oSelExt <= oQ(140);
oSelLui <= oQ(139);
oSelShift <= oQ(138);
oPC4 <= oQ(137 downto 106);
o_A <= oQ(105 downto 74);
o_B <= oQ(73 downto 42);
o_Im <= oQ(41 downto 10);
o_Rt <= oQ(9 downto 5);
o_Rd <= oQ(4 downto 0);
end structure;