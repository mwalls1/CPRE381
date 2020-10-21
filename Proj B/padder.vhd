library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity padder is
  port(i_A   : in std_logic_vector(15 downto 0);
	   o_Y : out std_logic_vector(31 downto 0));

end padder;

architecture dataflow of padder is
begin
	o_Y <= i_A & "0000000000000000";
end dataflow;