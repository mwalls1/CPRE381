library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
-- This is an empty entity so we don't need to declare ports
entity tb_add_sub_reg is
generic(gCLK_HPER   : time := 50 ns;
	N : integer := 32);
end tb_add_sub_reg;

architecture structure of tb_add_sub_reg is
constant cCLK_PER  : time := gCLK_HPER * 2;
-- Declare the component we are going to instantiate
component add_sub_reg
port(i_CLK        : in std_logic;     -- Clock input
     i_Res        : in std_logic;	-- Reset input
     i_WrEn       : in std_logic;     -- Global write enable
     i_We         : in std_logic_vector(4 downto 0);-- Write address input
     i_Re1        : in std_logic_vector(4 downto 0);--Read Address input
     i_Re2        : in std_logic_vector(4 downto 0);--Read Address input
     i_Im         : in std_logic_vector(31 downto 0);--Immediate input
     i_Add_Sub    : in std_logic;
     i_ALUSRc	    : in std_logic);
end component;

-- Signals to connect to the andg2 module
signal s_We,s_Re1,s_Re2 : std_logic_vector(4 downto 0);
signal s_Im : std_logic_vector(31 downto 0);
signal s_CLK, s_Res, s_WrEn, s_Add_Sub, s_ALUSrc: std_logic;

begin

DUT: add_sub_reg
  port map(i_CLK => s_CLK,
	   i_Res => s_Res,
	   i_WrEn => s_WrEn,
	   i_We => s_We,
	   i_Re1 => s_Re1,
	   i_Re2 => s_Re2,
	   i_Im => s_Im,
	   i_Add_Sub => s_Add_Sub,
	   i_ALUSRc => s_ALUSrc);

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
    wait for cCLK_PER;

	--store 1 in $1
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00001";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000001";
	s_Re2 <= "00000";
    wait for cCLK_PER;   

	--store 2 in $2
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00010";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000010";
	s_Re2 <= "00000";
    wait for cCLK_PER; 

	--store 3 in $3
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00011";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000011";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 4 in $4
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00100";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000100";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 5 in $5
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00101";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000101";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 6 in $6
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00110";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000110";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 7 in $7
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "00111";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000000111";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 8 in $8
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01000";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000001000";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store 9 in $9
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01001";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000001001";
	s_Re2 <= "00000";
    wait for cCLK_PER;
	
	--store 10 in $10
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "01010";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Im <= "00000000000000000000000000001010";
	s_Re2 <= "00000";
    wait for cCLK_PER;

	--store $1 + $2 in $11
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "01011";
	s_WrEn <= '1';
	s_Re1 <= "00001";
	s_Re2 <= "00010";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $11 - $3 in $12
	s_Res <= '0';
	s_Add_sub <= '1';
	s_ALUSrc <= '0';
	s_We <= "01100";
	s_WrEn <= '1';
	s_Re1 <= "01011";
	s_Re2 <= "00011";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $12 + $4 in $13
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "01101";
	s_WrEn <= '1';
	s_Re1 <= "01100";
	s_Re2 <= "00100";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $13 - $5 in $14
	s_Res <= '0';
	s_Add_sub <= '1';
	s_ALUSrc <= '0';
	s_We <= "01110";
	s_WrEn <= '1';
	s_Re1 <= "01101";
	s_Re2 <= "00101";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $14 + $6 in $15
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "01111";
	s_WrEn <= '1';
	s_Re1 <= "01110";
	s_Re2 <= "00110";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $15 - $7 in $16
	s_Res <= '0';
	s_Add_sub <= '1';
	s_ALUSrc <= '0';
	s_We <= "10000";
	s_WrEn <= '1';
	s_Re1 <= "01111";
	s_Re2 <= "00111";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $16 + $8 in $17
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "10001";
	s_WrEn <= '1';
	s_Re1 <= "10000";
	s_Re2 <= "01000";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $17 - $9 in $18
	s_Res <= '0';
	s_Add_sub <= '1';
	s_ALUSrc <= '0';
	s_We <= "10010";
	s_WrEn <= '1';
	s_Re1 <= "10001";
	s_Re2 <= "01001";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store $18 + $10 in $19
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "10011";
	s_WrEn <= '1';
	s_Re1 <= "10010";
	s_Re2 <= "01010";
	s_Im <= "00000000000000000000000000001010";
    wait for cCLK_PER;

	--store 35 + $0 in $20
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '1';
	s_We <= "10100";
	s_WrEn <= '1';
	s_Re1 <= "00000";
	s_Re2 <= "00000";
	s_Im <= "00000000000000000000000000100011";
    wait for cCLK_PER;

	--store $19 + $20 in $21
	s_Res <= '0';
	s_Add_sub <= '0';
	s_ALUSrc <= '0';
	s_We <= "10101";
	s_WrEn <= '1';
	s_Re1 <= "10011";
	s_Re2 <= "10100";
	s_Im <= "00000000000000000000000000100011";
    wait for cCLK_PER;

    wait;
  end process;
end structure;