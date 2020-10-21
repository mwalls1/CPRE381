library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ALU is
  port(i_A          : in std_logic;
       i_B	    : in std_logic;
       i_Cin        : in std_logic;
       i_Binv	    : in std_logic;
       i_Op	    : in std_logic_vector(2 downto 0);
       i_Less       : in std_logic;
       o_Result     : out std_logic;
       o_Cout       : out std_logic;
       o_Set        : out std_logic);

end ALU;

architecture dataflow of ALU is
signal s_Binv : std_logic;
signal s_Result : std_logic;
begin

process(i_A, i_B, i_Binv, s_Binv, i_Cin, i_Op, s_Result)
begin
s_Binv <= i_B xor i_Binv;
	case i_Op is
		when "000" =>
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Cout <= ((i_Cin and (i_A xor s_Binv)) or (i_A and s_Binv));
			o_Set <= s_Result;
			o_Result <= s_Result;
		when "001" =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= '0';
		when "010" =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= (i_A and i_B);
		when "011" =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= (i_A or i_B);
		when "100" =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= (i_A nand i_B);
		when "101" =>
			o_Result <= (i_A nor i_B);
		when "110" =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= (i_A xor i_B);
		when others =>
			o_Set <= ((i_A xor s_Binv)xor(i_Cin));
			o_Result <= '0';
	end case;
end process;

end dataflow;