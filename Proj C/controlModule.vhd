library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity controlModule is
  port(opCode       : in std_logic_vector(5 downto 0);
       functCode    : in std_logic_vector(5 downto 0);
       RegDst       : out std_logic;
       MemToReg	    : out std_logic;
       ALUOp	    : out std_logic_vector(5 downto 0);
       MemWrite     : out std_logic;
       ALUSrc       : out std_logic;
       RegWrite     : out std_logic;
       BInvert      : out std_logic;
       SelExt	    : out std_logic;
       SelLui	    : out std_logic;
       SelShift     : out std_logic;
       SelBranch    : out std_logic;
       branch       : out std_logic;
       jump         : out std_logic;
       jal	        : out std_logic;
       jr           : out std_logic);

end controlModule;

architecture dataflow of controlModule is
begin
process(opCode, functCode)
begin
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump <= '0';
				jal <= '0';
				jr <= '0';
	if (opCode = "000000") then
		case functCode is
			--Add
			when "100000" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump <= '0';
				jal <= '0';
				jr <= '0';
			--Add Unsigned
			when "100001" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump <= '0';
				jal <= '0';
				jr <= '0';
			--And
			when "100100" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000010";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump <= '0';
				jal <= '0';
				jr <= '0';
			--Nor
			when "100111" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000101";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Xor
			when "100110" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000110";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Or
			when "100101" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000011";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Set less than
			when "101010" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000001";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Set less than unsigned
			when "101011" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000111";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Shift left logical
			when "000000" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "100000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Shift right logical
			when "000010" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "101000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';	
				SelShift <= '0';	
				SelBranch <= '0';
				branch <= '0';		
				jump<= '0';	
				jal <= '0';	
				jr <= '0';
			--Shift right arithmetic
			when "000011" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "110000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Shift left logical variable
			when "000100" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "100000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';	
				SelExt <= '0';
				SelLui <= '0';	
				SelShift <= '1';
				SelBranch <= '0';
				branch <= '0';		
				jump<= '0';	
				jal <= '0';	
				jr <= '0';
			--Shift right logical variable
			when "000110" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "101000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '1';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Shift right arithmetic variable
			when "000111" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "110000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '1';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Subtract
			when "100010" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Subtract unsigned
			when "100011" =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Jump register
			when "001000" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '1';
			when others =>
				RegDst <= '1';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '1';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
		end case;
	else
		case opCode is
			--Add immediate
			when "001000" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Add immediate unsigned
			when "001001" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--and immediate
			when "001100" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000010";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Load upper immediate
			when "001111" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000010";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '1';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Load word
			when "100011" =>
				RegDst <= '0';
				MemToReg <= '1';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Xor immediate
			when "001110" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000110";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Or immediate
			when "001101" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000011";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Set less than immediate
			when "001010" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000001";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Set less than immediate unsigned
			when "001011" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000111";
				MemWrite <= '0';
				ALUsrc <= '1';
				RegWrite <= '1';
				BInvert <= '1';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Store Word
			when "101011" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '1';
				ALUsrc <= '1';
				RegWrite <= '0';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Branch if equal
			when "000100" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '1';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '1';
				branch <= '1';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Branch if not equal
			when "000101" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '1';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '1';
				jump<= '0';
				jal <= '0';
				jr <= '0';
			--Jump
			when "000010" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '1';
				jal <= '0';
				jr <= '0';
			--Jump and link
			when "000011" =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '1';
				BInvert <= '0';
				SelExt <= '1';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '1';
				jal <= '1';
				jr <= '0';
			when others =>
				RegDst <= '0';
				MemToReg <= '0';
				ALUOp <= "000000";
				MemWrite <= '0';
				ALUsrc <= '0';
				RegWrite <= '0';
				BInvert <= '0';
				SelExt <= '0';
				SelLui <= '0';
				SelShift <= '0';
				SelBranch <= '0';
				branch <= '0';
				jump<= '0';
				jr <= '0';
		end case;
	end if;
end process;

end dataflow;