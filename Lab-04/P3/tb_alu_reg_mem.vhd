library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- This is an empty entity so we don't need to declare ports
entity tb_alu_reg_mem is
generic(gCLK_HPER   : time := 50 ns;
	N : integer := 32);
end tb_alu_reg_mem;

architecture structure of tb_alu_reg_mem is
constant cCLK_PER  : time := gCLK_HPER * 2;
-- Declare the component we are going to instantiate
component alu_reg_mem
port(  i_CLK        : in std_logic;     -- Clock input
       i_Res        : in std_logic;	-- Reset input
       i_WrEn       : in std_logic;     -- Global write enable
       i_WrEnMem    : in std_logic; --Memory write enable
       i_MuxSel     : in std_logic; --Mex Selecter
       i_WeReg      : in std_logic_vector(4 downto 0);-- Write address input
       i_Re1        : in std_logic_vector(4 downto 0);--Read Address input
       i_Re2        : in std_logic_vector(4 downto 0);--Read Address input
       i_Im         : in std_logic_vector(15 downto 0);--Immediate input
       i_Add_Sub    : in std_logic;
       i_ALUSRc	    : in std_logic;
	i_SelSign   : in std_logic);
end component;

signal s_We,s_Re1,s_Re2 : std_logic_vector(4 downto 0);
signal s_Im : std_logic_vector(15 downto 0);
signal s_CLK, s_Res, s_WrEn,s_WrMem, s_Add_Sub, s_ALUSrc, s_MuxSel, s_SelSign: std_logic;

begin

DUT: alu_reg_mem
  port map(i_CLK => s_CLK,
	   i_Res => s_Res,
	   i_WrEn => s_WrEn,
	   i_WrEnMem => s_WrMem,
	   i_MuxSel => s_MuxSel,
	   i_WeReg => s_We,
	   i_Re1 => s_Re1,
	   i_Re2 => s_Re2,
	   i_Im => s_Im,
	   i_Add_Sub => s_Add_Sub,
	   i_ALUSRc => s_ALUSrc,
	   i_SelSign => s_SelSign);

P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
end process;
  
P_TB: process
  begin
	
	s_Res <= '1';
    s_WrMem <= '0';
	s_WrEn <= '0';
	s_SelSign <= '0';
    wait for cCLK_PER;

	--Load &a in $25
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "11001";
	s_WrEn <= '1';
	s_Re1 <= "00000";
    s_MuxSel <= '0';
	s_Im <= "0000000000000000";
	s_Re2 <= "00000";
    wait for cCLK_PER;   

	--Load &b in $26
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "11010";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "0000000100000000";
	s_Re2 <= "00000";
    wait for cCLK_PER; 

	--lw $1 0($25)
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "11001";
	s_Im <= "0000000000000000";
    s_MuxSel <= '1';
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--lw $2  4($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_Re1 <= "11001";
	s_Im <= "0000000000000001";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
    s_MuxSel <= '0';
	s_Im <= "0000000000000101";
	s_Re2 <= "00010";
    wait for cCLK_PER;

	--sw $1 0($26)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00110";
	s_WrEn <= '0';
	s_WrMem <= '1';
	s_Re1 <= "11010";
	s_Im <= "0000000000000000";
	s_Re2 <= "00001";
    wait for cCLK_PER;

	--lw $2, 8($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_WrMem <= '0';
	s_Re1 <= "11001";
        s_MuxSel <= '1';
	s_Im <= "0000000000000010";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
        s_MuxSel <= '0';
	s_Im <= "0000000000001000";
	s_Re2 <= "00010";
    wait for cCLK_PER;

	--sw $1, 4($26)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01001";
	s_WrEn <= '0';
	s_WrMem <='1';
	s_Re1 <= "11010";
	s_Im <= "0000000000000001";
	s_Re2 <= "00001";
    wait for cCLK_PER;
	
	--lw $2, 12($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_WrMem <='0';
	s_Re1 <= "11001";
    s_MuxSel <= '1';
	s_Im <= "0000000000000011";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
    s_MuxSel <= '0';
	s_Re2 <= "00010";
	s_Im <= "0000000000001010";
    wait for cCLK_PER;

	--sw $1, 12(26)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01111";
	s_WrEn <= '0';
	s_WrMem <='1';
	s_Re1 <= "11010";
	s_Re2 <= "00001";
	s_Im <= "0000000000000010";
    wait for cCLK_PER;

	--lw $2, 16($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_WrMem <='0';
	s_Re1 <= "11001";
        s_MuxSel <= '1';
	s_Re2 <= "00000";
	s_Im <= "0000000000000100";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
        s_MuxSel <= '0';
	s_Re2 <= "00010";
	s_Im <= "0000000000001010";
    wait for cCLK_PER;

	--sw $1, 12(26)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01111";
	s_WrEn <= '0';
	s_WrMem <='1';
	s_Re1 <= "11010";
	s_Re2 <= "00001";
	s_Im <= "0000000000000011";
    wait for cCLK_PER;

	--lw $2, 20($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_WrMem <='0';
	s_Re1 <= "11001";
        s_MuxSel <= '1';
	s_Re2 <= "00000";
	s_Im <= "0000000000000101";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
        s_MuxSel <= '0';
	s_Re2 <= "00010";
	s_Im <= "0000000000001010";
    wait for cCLK_PER;

	--sw $1, 16($26)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "10010";
	s_WrEn <= '0';
	s_WrMem <='1';
	s_Re1 <= "11010";
	s_Re2 <= "00001";
	s_Im <= "0000000000000100";
    wait for cCLK_PER;

	--lw $2, 24($25)
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
        s_MuxSel <= '1';
	s_WrMem <='0';
	s_Re1 <= "10010";
	s_Re2 <= "01010";
	s_Im <= "0000000000000110";
    wait for cCLK_PER;

	--add $1, $1, $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00001";
	s_Re2 <= "00010";
        s_MuxSel <= '0';
	s_Im <= "0000000000100011";
    wait for cCLK_PER;

	--addi $27, 0, 512
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "11011";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Re2 <= "10100";
	s_Im <= "0000001000000000";
    wait for cCLK_PER;
	--sw $1, -4($27)
	s_Res <= '0';
	s_SelSign <= '1';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "10010";
	s_WrEn <= '0';
	s_WrMem <='1';
	s_Re1 <= "11011";
	s_Re2 <= "00001";
	s_Im <= "1111111111111111";
    wait for cCLK_PER;

    wait;
  end process;
end structure;