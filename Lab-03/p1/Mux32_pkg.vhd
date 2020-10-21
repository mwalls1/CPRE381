library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package Mux32_pkg is
constant addr : integer := 5;
constant Nwidth : integer:= 32;
constant nreg  : integer:= 32;
        type Mux32_array is array(nreg-1 downto 0) of std_logic_vector(Nwidth-1 downto 0);
end package;