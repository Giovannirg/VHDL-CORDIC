


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m9_addsub32 is
       port (
            a, b : in std_logic_vector(31 downto 0);
            ans : in std_logic;
            y : out std_logic_vector(31 downto 0));
end m9_addsub32;

architecture Behavioral of m9_addsub32 is

component m9_carry_select_adder is

 generic (width : positive := 32);
    Port ( a : in STD_LOGIC_VECTOR (width -1 downto 0);
           b : in STD_LOGIC_VECTOR (width -1 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (width -1 downto 0);
           cout : out STD_LOGIC);
end component;


signal sig_carry_out_CS : std_logic;
signal inv_neg_b : std_logic_vector(31 downto 0);

begin


m9_carry_select_adder_ins: m9_carry_select_adder
port map(
           a => a,
           b => inv_neg_b,
           cin => ans,
           s => y,
           cout => sig_carry_out_CS);
           

invert_b:process(inv_neg_b, b, ans)
   begin
       invert_b : for k in 0 to b'length-1 loop
             inv_neg_b(k) <= b(k) xor ans;
       end loop invert_b;

end process;

end Behavioral;


