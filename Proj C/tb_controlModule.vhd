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

DUT: controlModule
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

  
P_TB: process
  begin
	--Test addi
	s_oCode <= "001000";
    wait for 100 ns;
	--add
	s_oCode <= "000000";
	s_fCode <= "100000";
    wait for 100 ns; 
	--addiu
	s_oCode <= "001001";
	s_fCode <= "100000";
    wait for 100 ns;  
	--addu
	s_oCode <= "000000";
	s_fCode <= "100001";
    wait for 100 ns;
	--and
	s_oCode <= "000000";
	s_fCode <= "100100";
    wait for 100 ns;
	--andi
	s_oCode <= "001100";
	s_fCode <= "100000";
    wait for 100 ns;
	--lui
	s_oCode <= "001111";
	s_fCode <= "100000";
    wait for 100 ns;
	--lw
	s_oCode <= "100011";
	s_fCode <= "100000";
    wait for 100 ns;
	--nor
	s_oCode <= "000000";
	s_fCode <= "100111";
    wait for 100 ns;
	--xor
	s_oCode <= "000000";
	s_fCode <= "100110";
    wait for 100 ns;
	--xori
	s_oCode <= "001110";
	s_fCode <= "100000";
    wait for 100 ns;
	--or
	s_oCode <= "000000";
	s_fCode <= "100101";
    wait for 100 ns;
	--ori
	s_oCode <= "001101";
	s_fCode <= "100000";
    wait for 100 ns;
	--slt
	s_oCode <= "000000";
	s_fCode <= "101010";
    wait for 100 ns;
	--slti
	s_oCode <= "001010";
	s_fCode <= "100000";
    wait for 100 ns;
	--sltiu
	s_oCode <= "001011";
	s_fCode <= "100000";
    wait for 100 ns;
	--sltu
	s_oCode <= "000000";
	s_fCode <= "101011";
    wait for 100 ns;
	--sll
	s_oCode <= "000000";
	s_fCode <= "000000";
    wait for 100 ns;
	--srl
	s_oCode <= "000000";
	s_fCode <= "000010";
    wait for 100 ns;
	--sra
	s_oCode <= "000000";
	s_fCode <= "000011";
    wait for 100 ns;
	--sllv
	s_oCode <= "000000";
	s_fCode <= "000100";
    wait for 100 ns;
	--srlv
	s_oCode <= "000000";
	s_fCode <= "000110";
    wait for 100 ns;
	--srav
	s_oCode <= "000000";
	s_fCode <= "000111";
    wait for 100 ns;
	--sw
	s_oCode <= "101011";
	s_fCode <= "100000";
    wait for 100 ns;
	--sub
	s_oCode <= "000000";
	s_fCode <= "100010";
    wait for 100 ns;
	--subu
	s_oCode <= "000000";
	s_fCode <= "100011";
    wait for 100 ns;

    wait;
  end process;
end structure;