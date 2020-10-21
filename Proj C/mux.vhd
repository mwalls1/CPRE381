library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
port(i_A          : in std_logic_vector(31 downto 0);
       i_B          : in std_logic_vector(31 downto 0);
       i_s          : in std_logic;
       o_y          : out std_logic_vector(31 downto 0));
end mux;

architecture dataflow of mux is

begin

o_y <= i_A when i_s = '0' else i_B;

end dataflow;