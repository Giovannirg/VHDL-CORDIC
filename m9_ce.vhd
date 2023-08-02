


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity m9_ce is  --cordic element
        port (
            m : in std_logic;
            sigma : in std_logic;
            i : in std_logic_vector(4 downto 0);
            x_in, y_in, z_in : in std_logic_vector(31 downto 0);
            x_out, y_out, z_out : out std_logic_vector(31 downto 0));
end m9_ce;


architecture Behavioral of m9_ce is

component m9_addsub32 
       port (
            a, b : in std_logic_vector(31 downto 0);
            ans : in std_logic;
            y : out std_logic_vector(31 downto 0));
end component;

component m9_barrel32 
      port (
            x : in std_logic_vector(31 downto 0);
            pos : in std_logic_vector(4 downto 0);
            lnr : in std_logic;
            y : out std_logic_vector(31 downto 0));
end component;

component m9_artan_rom 
            port (
                i : in std_logic_vector(4 downto 0);
                d : out std_logic_vector(31 downto 0));
end component;

signal sig_x : std_logic_vector(x_in'length-1 downto 0);
signal sig_y : std_logic_vector(y_in'length-1 downto 0);
signal sig_atan_i : std_logic_vector(z_in'length-1 downto 0);
signal sig_inver_sigma : std_logic;


begin

--substraction for sigma = 1
m9_addsub32_tempX_ins: m9_addsub32 
       port map(
            a => x_in, 
            b => sig_y,
            ans => sigma,
            y =>  x_out);


--addittion for sigma = 1
m9_addsub32_tempY_ins: m9_addsub32 
       port map(
            a => y_in, 
            b => sig_x,
            ans => sig_inver_sigma,
            y =>  y_out);

--substraction for sigma = 1
m9_addsub32_Z_next_ins: m9_addsub32 
       port map(
            a => z_in, 
            b => sig_atan_i,
            ans => sigma,
            y =>  z_out);

m9_barrel32_Y_for_tempX_ins: m9_barrel32 
      port map(
            x => y_in,
            pos => i,
            lnr => '0',
            y => sig_y );

m9_barrel32_X_for_tempY_ins: m9_barrel32 
      port map(
            x => x_in,
            pos => i,
            lnr => '0',
            y =>  sig_x);

m9_artan_rom_ins: m9_artan_rom 
            port map(
                i => i,
                d => sig_atan_i);
                                               
rotation_vs_vector_modus: process(m)
        begin
            if m = '1' then   --rotation mode
                sig_inver_sigma <= not sigma;
           elsif m = '0' then  --vector mode
                -------
            end if;
  end process;


end Behavioral;
