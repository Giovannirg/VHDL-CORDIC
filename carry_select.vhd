


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Carry_Select is

    Port ( a_CS : in STD_LOGIC;
           b_CS : in STD_LOGIC;
           carry_in_CS : in STD_LOGIC;
           sum_CS : out STD_LOGIC;
           carry_out_CS : out STD_LOGIC);
           
end Carry_Select;

architecture Behavioral of Carry_Select is
    
    component m9_fulladd

        port (a, b, cin  : in STD_LOGIC;
            sum , cout : out STD_LOGIC);
    end component;
  
        signal Sum_A0, Sum_A1, Cout_A0, Cout_A1 : STD_LOGIC; -- from Carry Select
        
    begin
        -- instances of the full adder
        A0:  m9_fulladd 
           port map (a => a_CS,
                     b => b_CS, 
                     cin => '0',
                     sum => Sum_A0,
                     cout => Cout_A0); 
    
        A1:  m9_fulladd 
            port map (a => a_CS, 
                      b => b_CS, 
                      cin => '1',
                      sum => Sum_A1, 
                      cout => Cout_A1 );
        
        MUX: process(carry_in_CS, Sum_A0, Cout_A0, Sum_A1, Cout_A1)
            
            begin
            
            if carry_in_CS = '0' then
               sum_CS <= transport Sum_A0 after 2 ns;
               carry_out_CS <= transport Cout_A0 after 2 ns;
             elsif carry_in_CS = '1' then
               sum_CS <= transport Sum_A1 after 2 ns; 
               carry_out_CS <= transport Cout_A1 after 2 ns;
             else 
             sum_CS <= transport Sum_A0 after 2 ns ;
               carry_out_CS <= transport Cout_A0 after 2 ns;
             end if; 
             
            end process MUX;
            
    end Behavioral;





