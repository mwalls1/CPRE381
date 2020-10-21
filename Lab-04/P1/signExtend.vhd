library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity signExtend is
port(i_A : in std_logic_vector(15 downto 0);
	 i_Sel : in std_logic;
     o_Out : out std_logic_vector(31 downto 0));
end signExtend ;

architecture dataflow of signExtend is

begin 	

G1: for i in 0 to 15 generate

	o_Out(i) <= i_A(i);

end generate;
G2: for i in 16 to 31 generate

	o_Out(i) <= i_sel and i_A(15);

end generate;

end dataflow;