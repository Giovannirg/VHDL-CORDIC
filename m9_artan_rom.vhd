----------------------------------------------------------------------------------
-- Company: Giovanni Rodriguez
-- Engineer: 
-- 
-- Create Date: 21.09.2022 14:38:26
-- Design Name: 
-- Module Name: m9_artan_rom - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m9_artan_rom is
            port (
                i : in std_logic_vector(4 downto 0);
                d : out std_logic_vector(31 downto 0));
end m9_artan_rom;

architecture Behavioral of m9_artan_rom is
-- array(31 downto 0) saves with index 31 down to the last with 0 = 32 elements downward
-- array(0 to 31) saves with index first 0 to the last 31 = 32 elements upward 


-- to print the array in C: rom_arctan:  printf(" std_logic_vector(to_unsigned(%d, d'length)),\n",atan_t[i]); 
type fix824 is array(0 to 31) of std_logic_vector(d'length-1 downto 0);   


constant rom_arctan: fix824:=( std_logic_vector(to_unsigned(13176794, d'length)),
                       	      std_logic_vector(to_unsigned(7778716, d'length)),
                         	      std_logic_vector(to_unsigned(4110059, d'length)),
                               std_logic_vector(to_unsigned(2086330, d'length)),
                               std_logic_vector(to_unsigned(1047213, d'length)),
                               std_logic_vector(to_unsigned(524117, d'length)),
                               std_logic_vector(to_unsigned(262122, d'length)),
                               std_logic_vector(to_unsigned(131069, d'length)),
                               std_logic_vector(to_unsigned(65535, d'length)),
                               std_logic_vector(to_unsigned(32767, d'length)),
                               std_logic_vector(to_unsigned(16383, d'length)),
                               std_logic_vector(to_unsigned(8191, d'length)),
                               std_logic_vector(to_unsigned(4095, d'length)),
                               std_logic_vector(to_unsigned(2047, d'length)),
                               std_logic_vector(to_unsigned(1023, d'length)),
                               std_logic_vector(to_unsigned(511, d'length)),
                               std_logic_vector(to_unsigned(255, d'length)),
                               std_logic_vector(to_unsigned(127, d'length)),
                               std_logic_vector(to_unsigned(63, d'length)),
                               std_logic_vector(to_unsigned(31, d'length)),
                               std_logic_vector(to_unsigned(15, d'length)),
                               std_logic_vector(to_unsigned(7, d'length)),
                               std_logic_vector(to_unsigned(3, d'length)),
                               std_logic_vector(to_unsigned(1, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length)),
                               std_logic_vector(to_unsigned(0, d'length))  );
begin
    process(i)
        begin
            if to_integer(unsigned(i))>= 0 and to_integer(unsigned(i)) < 32 then
                d <= rom_arctan(to_integer(unsigned(i)));       
        end if;
    end process;
end Behavioral;


