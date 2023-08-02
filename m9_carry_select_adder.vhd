
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity m9_carry_select_adder is

 generic (width : positive := 32);
    Port ( a : in STD_LOGIC_VECTOR (width -1 downto 0);
           b : in STD_LOGIC_VECTOR (width -1 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (width -1 downto 0);
           cout : out STD_LOGIC);
end m9_carry_select_adder;

architecture Behavioral of m9_carry_select_adder is

-- import the Carry_Select components

 component Carry_Select
        port 
        (	
            carry_in_CS : in std_logic;
            a_CS, b_CS : in std_logic ;
            sum_CS : out std_logic ;
            carry_out_CS : out std_logic
        ); 
end component;

  -- adder's Signal 
  signal c : std_logic_vector ( a'length-1 downto 1);
    
 -- begin  Behavioral of m9_adder
	begin 
	
	gen : for j in a'range generate
	
		genlsb : if j = 0 generate
		  CSA_0 : Carry_Select
		   port map (
		   a_CS => a(0), 
	       b_CS => b(0), 
           carry_in_CS => cin , 
           sum_CS => s(0), 
           carry_out_CS => c(1));
		    end generate;
			
		genmid : if (j > 0) and (j < a'length-1) generate
		  CSA_ID : Carry_Select 
		      port map (
		      a_CS =>a(j), 
		      b_CS => b(j), 
		      carry_in_CS => c(j) , 
		      sum_CS => s(j), 
		      carry_out_CS => c(j+1));
			end generate;
			
		genmsb : if j = a'length-1 generate 
		  CSA_End : Carry_Select 
		      port map (
		      a_CS=>a(j), 
	          b_CS => b(j), 
              carry_in_CS => c(j) , 
              sum_CS => s(j), 
              carry_out_CS => cout);           
  end generate;
			
end generate;

end Behavioral;
