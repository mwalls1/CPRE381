library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- This is an empty entity so we don't need to declare ports
entity tb_controlModule is
generic(gCLK_HPER   : time := 50 ns;
	N : integer := 32);
end tb_controlModule;

architecture structure of tb_controlModule is
constant cCLK_PER  : time := gCLK_HPER * 2;
-- Declare the component we are going to instantiate
component controlModule
port(opCode       : in std_logic_vector(5 downto 0);
       functCode    : in std_logic_vector(5 downto 0);
       RegDst       : out std_logic;
       MemToReg	    : out std_logic;
       ALUOp	    : out std_logic_vector(5 downto 0);
       MemWrite     : out std_logic;
       ALUSrc       : out std_logic;
       RegWrite     : out std_logic;
       BInvert      : out std_logic;
       SelExt		: out std_logic;
       SelLui		: out std_logic);
end component;

signal s_fCode,s_oCode, o_ALUop: std_logic_vector(5 downto 0);
signal o_RegDst, o_MemToReg, o_MemWrite, o_ALUSrc, o_RegWrite,o_BInvert, o_SelExt,o_SelLui: std_logic;

begin

DUT: alu_reg_mem
  port map(opCode => s_oCode,
       	   functCode   => s_fCode,
           RegDst     =>  o_RegDst,
           MemToReg	 => o_MemToReg,
           ALUOp	 => o_ALUop,  
           MemWrite     => o_MemWrite,
           ALUSrc      => o_ALUSrc,
           RegWrite    => o_RegWrite,
           BInvert      => o_BInvert,
           SelExt	=> o_SelExt,
           SelLui	=> o_SelLui);

P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
end process;
  
P_TB: process
  begin
	--Test addi
	s_oCode <= "001000";
	s_fCode <= "";
    wait for cCLK_PER;
	
	s_oCode <= "000000";
	s_fCode <= "100000";
    wait for cCLK_PER;   

    wait;
  end process;
end structure;