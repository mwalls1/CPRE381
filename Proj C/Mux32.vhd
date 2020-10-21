library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.mux32_pkg.all;

package Mux32_pkg is
constant addr : integer := 5;
constant Nwidth : integer:= 32;
constant nreg  : integer:= 32;
        type Mux32_array is array(nreg-1 downto 0) of std_logic_vector(Nwidth-1 downto 0);
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.mux32_pkg.all;

entity Mux32 is
generic(BusWidth: Integer :=32;
	sel_width: Integer:=5);
port(inputs: in Mux32_array;
	i_Sel : in std_logic_vector(sel_width-1 downto 0);
	o_Out : out std_logic_vector(BusWidth-1 downto 0));
end Mux32 ;

architecture dataflow of Mux32  is

begin 	
	 o_Out <= inputs(to_integer(unsigned(i_Sel)));
end dataflow;