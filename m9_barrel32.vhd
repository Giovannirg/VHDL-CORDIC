
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity m9_barrel32 is
      port (
            x : in std_logic_vector(31 downto 0);
            pos : in std_logic_vector(4 downto 0);
            lnr : in std_logic;
            y : out std_logic_vector(31 downto 0));
end m9_barrel32;

architecture Behavioral of m9_barrel32 is

begin

shift_process : process(lnr, x, pos)
        begin
            if lnr ='1' then
                 y <= std_logic_vector(shift_left(signed(x), to_integer(unsigned(pos))));
            else
                 y <= std_logic_vector(shift_right(signed(x), to_integer(unsigned(pos))));
            end if;
       end process;
end Behavioral;



