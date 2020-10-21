library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ALU32 is
  port(i_A          : in std_logic_vector(31 downto 0);
       i_B	    : in std_logic_vector(31 downto 0);
       i_Cin        : in std_logic;
       i_Binv	    : in std_logic;
       i_Op	    : in std_logic_vector(2 downto 0);
       o_Result     : out std_logic_vector(31 downto 0);
       o_Overflow   : out std_logic;
       o_Zero       : out std_logic);

end ALU32;

architecture structure of ALU32 is
component ALU
  port(i_A          : in std_logic;
       i_B	    : in std_logic;
       i_Cin        : in std_logic;
       i_Binv	    : in std_logic;
       i_Op	    : in std_logic_vector(2 downto 0);
       i_Less       : in std_logic;
       o_Result     : out std_logic;
       o_Cout       : out std_logic;
       o_Set        : out std_logic);
end component;

component ALUfirst
  port(i_A          : in std_logic;
       i_B	    : in std_logic;
       i_Cin        : in std_logic;
       i_Binv	    : in std_logic;
       i_Op	    : in std_logic_vector(2 downto 0);
       i_Less       : in std_logic;
       o_Result     : out std_logic;
       o_Cout       : out std_logic;
       o_Set        : out std_logic);
end component;

component ALUoverflow
  port(i_A          : in std_logic;
       i_B	    : in std_logic;
       i_Cin        : in std_logic;
       i_Binv	    : in std_logic;
       i_Op	    : in std_logic_vector(2 downto 0);
       i_Less       : in std_logic;
       o_Result     : out std_logic;
       o_Cout       : out std_logic;
       o_Overflow   : out std_logic;
       o_Set        : out std_logic);
end component;

component NOR32
  port(i_A          : in std_logic_vector(31 downto 0);
       o_Zero       : out std_logic);
end component;

signal s_Carry, s_Result: std_logic_vector(31 downto 0);
signal s_Set : std_logic;
begin

g_alu_0 : ALUfirst
	port MAP(i_A => i_A(0),
      		 i_B => i_B(0),
      		 i_Cin  => i_Cin,
      		 i_Binv	 => i_Binv,
      		 i_Op	=> i_Op,
      		 i_Less  => s_Set,
      		 o_Result  => s_Result(0),
      		 o_Cout     => s_Carry(0),
      		 o_Set    => open);

G: for i in 1 to 30 generate
	g_alu_1 : ALU
	port MAP(i_A => i_A(i),
      		 i_B => i_B(i),
      		 i_Cin  => s_Carry(i-1),
      		 i_Binv	 => i_Binv,
      		 i_Op	=> i_Op,
      		 i_Less  => '0',
      		 o_Result  => s_Result(i),
      		 o_Cout     => s_Carry(i),
      		 o_Set    => open);
end generate;
g_alu_2: ALUoverflow
	port MAP(i_A  => i_A(31),
     		 i_B  => i_B(31),
    		 i_Cin  => s_Carry(30),
    		 i_Binv	=> i_Binv,
    		 i_Op => i_Op,
   		 i_Less => '0',
   		 o_Result => s_Result(31),
    		 o_Cout  => open,
    		 o_Overflow => o_Overflow,
    		 o_Set  => s_Set);
g_and_32: NOR32
	port MAP(i_A    => s_Result,
		 o_Zero => o_Zero);

o_Result <= s_Result;
end structure;