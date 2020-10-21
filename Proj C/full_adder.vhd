library IEEE;
use IEEE.std_logic_1164.all;

	
entity full_adder is
port(i_A          : in std_logic_vector(31 downto 0);
       i_B          : in std_logic_vector(31 downto 0);
       o_S          : out std_logic_vector(31 downto 0);
       i_C          : in std_logic;
       o_C          : out std_logic);

end full_adder;

architecture structure of full_adder is

component andg2
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       o_F  : out std_logic);
end component;

component org2
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       o_F  : out std_logic);
end component;

component xorg2
  port(i_A  : in std_logic;
       i_B  : in std_logic;
       o_F  : out std_logic);
end component;

signal sVALUE_x1 : std_logic_vector(31 downto 0);

signal sVALUE_and_1 : std_logic_vector(31 downto 0);
signal sVALUE_and_2 : std_logic_vector(31 downto 0);

signal sVALUE_c : std_logic_vector(31 downto 0);

begin

--instantiate first adder
	g_xorg2_1: xorg2
	   port MAP(i_A => i_A(0),
		    	i_B => i_B(0),
	            	o_F => sVALUE_x1(0));
	g_xorg2_2: xorg2
	   port MAP(i_A => sVALUE_x1(0),
		    	i_B => i_C,
	            	o_F => o_S(0));

	g_andg2_1: andg2
	   port MAP(i_A => i_C,
		    	i_B => sVALUE_x1(0),
	            	o_F => sVALUE_and_1(0));
	
	g_andg2_2: andg2
	   port MAP(i_A => i_A(0),
		    	i_B => i_B(0),
	            	o_F => sVALUE_and_2(0));
	
	g_org2_1: org2
	   port MAP(i_A => sVALUE_and_1(0),
		    	i_B => sVALUE_and_2(0),
                    	o_F => sVALUE_c(0));


-- We loop through and instantiate and connect 2 xorg, 2 andg2, and 1 org2 for each adder from 1 to N-2
G1: for i in 1 to 30 generate
	g_xorg2_3: xorg2
	   port MAP(i_A => i_A(i),
		    	i_B => i_B(i),
	            	o_F => sVALUE_x1(i));
	g_xorg2_4: xorg2
	   port MAP(i_A => sVALUE_x1(i),
		    	i_B => sVALUE_c(i-1),
	            	o_F => o_S(i));

	g_andg2_3: andg2
	   port MAP(i_A => sVALUE_c(i-1),
		    	i_B => sVALUE_x1(i),
	            	o_F => sVALUE_and_1(i));
	
	g_andg2_4: andg2
	   port MAP(i_A => i_A(i),
		    	i_B => i_B(i),
	            	o_F => sVALUE_and_2(i));
	
	g_org2_2: org2
	   port MAP(i_A => sVALUE_and_1(i),
		    	i_B => sVALUE_and_2(i),
                    	o_F => sVALUE_c(i));
end generate;

--instantiate last adder
	g_xorg2_5: xorg2
	   port MAP(i_A => i_A(31),
		    	i_B => i_B(31),
	            	o_F => sVALUE_x1(31));
	g_xorg2_6: xorg2
	   port MAP(i_A => sVALUE_x1(31),
		    	i_B => sVALUE_c(30),
	            	o_F => o_S(31));

	g_andg2_5: andg2
	   port MAP(i_A => sVALUE_c(30),
		    	i_B => sVALUE_x1(31),
	            	o_F => sVALUE_and_1(31));
	
	g_andg2_6: andg2
	   port MAP(i_A => i_A(31),
		    	i_B => i_B(31),
	            	o_F => sVALUE_and_2(31));
	
	g_org2_3: org2
	   port MAP(i_A => sVALUE_and_1(31),
		    	i_B => sVALUE_and_2(31),
                    	o_F => o_C);
	
end structure;

architecture dataflow of full_adder is

	signal sVALUE_c : std_logic_vector(30 downto 0);

begin

	o_S(0) <= (i_A(0) xor i_B(0)) xor i_C;
	sVALUE_c(0) <= ((i_A(0) xor i_B(0)) and i_C) or (i_A(0) and i_B(0));

	G2: for i in 1 to 30 generate
		o_S(i) <= (i_A(i) xor i_B(i)) xor sVALUE_c(i-1);
		sVALUE_c(i) <= ((i_A(i) xor i_B(i)) and sVALUE_c(i-1)) or (i_A(i) and i_B(i));
	end generate;

	o_S(31) <= (i_A(31) xor i_B(31)) xor sVALUE_c(30);
	o_C <= ((i_A(31) xor i_B(31)) and sVALUE_c(30)) or (i_A(31) and i_B(31));


end dataflow;