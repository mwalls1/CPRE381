library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity zeroExtend is
port(i_A : in std_logic_vector(15 downto 0);
     o_Out : out std_logic_vector(31 downto 0));
end zeroExtend ;

architecture dataflow of zeroExtend is

begin 	
		
	 o_Out <= "0000000000000000" & i_A;

end dataflow;