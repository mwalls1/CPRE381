library IEEE;
use IEEE.std_logic_1164.all;
use work.mux32_pkg.all;
entity register_file is

  port(i_CLK        : in std_logic;     -- Clock input
       i_Res	    : in std_logic;   -- Reset
       i_We         : in std_logic_vector(4 downto 0);	-- Write enable input
       i_Re1        : in std_logic_vector(4 downto 0);  --Read enable input
       i_Re2        : in std_logic_vector(4 downto 0);	--Read enable input
       i_D          : in std_logic_vector(31 downto 0);	-- Data value input
       out1         : out std_logic_vector(31 downto 0);   -- Data value output   
       out2         : out std_logic_vector(31 downto 0));   -- Data value output

end register_file;

architecture structure of register_file is

component NbitReg
   generic(N : integer := 32);
    port(i_CLK        : in std_logic;     -- Clock input
       i_We         : in std_logic;	-- Write enable input
       i_Re         : in std_logic;     -- Reset input
       i_D          : in std_logic_vector(N-1 downto 0);-- Data value input
       o_Q          : out std_logic_vector(N-1 downto 0));
  end component;

component decoder_5to32
    port(i_A          : in std_logic_vector(4 downto 0);
         o_F          : out std_logic_vector(31 downto 0));
end component;

component Mux32
generic(BusWidth: Integer :=32;
	sel_width: Integer:=5);
    port(inputs: in Mux32_array;
	i_Sel : in std_logic_vector(sel_width-1 downto 0);
	o_Out : out std_logic_vector(BusWidth-1 downto 0));
  end component;

signal decode_sel   : std_logic_vector(31 downto 0);
signal reg_Output : Mux32_array;

begin
g_decoder: decoder_5to32
	port MAP(i_A => i_We,
		 o_F => decode_sel);
g_r0 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(0),
		i_Re => '1',
		i_D => i_D,
		o_Q => reg_Output(0));
g_r1 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(1),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(1));
g_r2 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(2),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(2));
g_r3 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(3),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(3));
g_r4 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(4),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(4));
g_r5 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(5),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(5));
g_r6 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(6),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(6));
g_r7 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(7),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(7));
g_r8 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(8),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(8));
g_r9 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(9),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(9));
g_r10 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(10),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(10));
g_r11 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(11),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(11));
g_r12 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(12),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(12));
g_r13 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(13),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(13));	
g_r14 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(14),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(14));	
g_r15 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(15),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(15));
g_r16 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(16),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(16));	
g_r17 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(17),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(17));
g_r18 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(18),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(18));
g_r19 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(19),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(19));
g_r20 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(20),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(20));
g_r21 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(21),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(21));
g_r22 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(22),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(22));	
g_r23 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(23),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(23));	
g_r24 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(24),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(24));	
g_r25 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(25),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(25));		
g_r26 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(26),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(26));	
g_r27 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(27),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(27));	
g_r28 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(28),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(28));	
g_r29 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(29),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(29));		
g_r30 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(30),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(30));	
g_r31 : NbitReg
	port MAP(i_CLK => i_CLK,
		i_We => decode_sel(31),
		i_Re => i_Res,
		i_D => i_D,
		o_Q => reg_Output(31));	
g_mux1 : Mux32
	port MAP(inputs => reg_Output,
		i_Sel => i_Re1,
		o_Out => out1);	
g_mux2 : Mux32
	port MAP(inputs => reg_Output,
		i_Sel => i_Re2,
		o_Out => out2);
end structure;