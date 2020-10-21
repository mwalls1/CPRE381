library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ALUoverflow is
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

end ALUoverflow;

architecture dataflow of ALUoverflow is
signal s_Binv, s_Cout, s_AsubB, s_Result, s_Set: std_logic;
begin

process(i_A, i_B, i_Binv, s_Binv, s_AsubB, i_Cin, i_Op, s_Result, s_Cout,s_Set)
begin
	case i_Op is
		when "000" =>
			s_Binv <= i_B xor i_Binv;
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			s_Cout <= ((i_Cin and (i_A xor s_Binv)) or (i_A and s_Binv));
			o_Cout <= s_Cout;
			o_Result <= s_Result;
			o_Set  <= s_Result;
		when "001" =>
			s_Binv <= i_B xor i_Binv;
			s_AsubB <= ((i_A xor s_Binv)xor(i_Cin));
			if(s_AsubB = '1') then 
				s_Set<='1';
			else
				s_Set<='0';
			end if;
			o_Set<=s_Set;
			o_Result<='0';
		when "010" =>
			s_Binv <= i_B xor i_Binv;
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Set  <= s_Result;
			o_Result <= (i_A and i_B);
		when "011" =>
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Set  <= s_Result;
			o_Result <= (i_A or i_B);
		when "100" =>
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Set  <= s_Result;
			o_Result <= (i_A nand i_B);
		when "101" =>
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Set <= s_Result;
			o_Result <= (i_A nor i_B);
		when others =>
			s_Result <= ((i_A xor s_Binv)xor(i_Cin));
			o_Set  <= s_Result;
			o_Result <= '0';
	end case;
	s_Binv <= i_B xor i_Binv;
	s_AsubB <= ((i_A xor s_Binv)xor(i_Cin));
	if (i_A = '0' and i_B = '0' and s_AsubB = '1') then
		o_Overflow <= '1';
	elsif (i_A = '0' and i_B = '1' and s_AsubB = '1') then
		o_Overflow <= '1';
	elsif (i_A = '1' and i_B = '0' and s_AsubB = '0') then
		o_Overflow <= '1';
	else
		o_Overflow <= '0';
	end if;
end process;
end dataflow;