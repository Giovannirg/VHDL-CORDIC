----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Giovanni Rodriguez, s0556233
-- 
-- Create Date: 12.09.2022 16:05:22
-- Design Name: 
-- Module Name: testbench_m9_Cordic_4_n_5 - Behavioral
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

use IEEE.NUMERIC_STD.ALL;


entity testbench_m9_CORDIC is
--  Port ( );
end testbench_m9_CORDIC;

architecture Behavioral of testbench_m9_CORDIC is




----component for m9_ce (cordic element)
component m9_ce is  --cordic element
        port (
            m : in std_logic;
            sigma : in std_logic;
            i : in std_logic_vector(4 downto 0);
            x_in, y_in, z_in : in std_logic_vector(31 downto 0);
            x_out, y_out, z_out : out std_logic_vector(31 downto 0));
end component;

----signals for m9_ce
-- rptation or vector
signal sig_m :  std_logic := '1';
-- sign + / -
signal sig_sigma : std_logic := '1';
--i : input to control the shifter
signal sig_i :  std_logic_vector(4 downto 0) := "00001";

signal sig_x_in :  std_logic_vector(31 downto 0) := std_logic_vector(to_signed(1, 32));
signal sig_y_in :  std_logic_vector(31 downto 0) := std_logic_vector(to_signed(0, 32));
signal sig_z_in :  std_logic_vector(31 downto 0) := std_logic_vector(to_signed(6, 32)); 


signal FIX824_x :  std_logic_vector(31 downto 0) := std_logic_vector(shift_left(unsigned(sig_x_in), 24));
signal FIX824_y :  std_logic_vector(31 downto 0) := std_logic_vector(shift_left(unsigned(sig_y_in), 24));
signal FIX824_z :  std_logic_vector(31 downto 0) := std_logic_vector(shift_left(unsigned(sig_z_in), 24));

signal sig_x_out :  std_logic_vector(31 downto 0);
signal sig_y_out :  std_logic_vector(31 downto 0);
signal sig_z_out :  std_logic_vector(31 downto 0);


begin


----instance for m9_ce
m9_ce_ins: m9_ce   --cordic element
        port map(
            m => sig_m,
            sigma => sig_sigma,
            i => sig_i,
            x_in => FIX824_x, --From m9_artaan_rom
            y_in => FIX824_y,
            z_in => FIX824_z,
            x_out => sig_x_out,
            y_out => sig_y_out,
            z_out => sig_z_out );
            
            
            
-- To test other instances uncomment below
--übung 4

----component to test the m9_barrel32
--component m9_barrel32
--      port (
--            x : in std_logic_vector(31 downto 0);
--            pos : in std_logic_vector(4 downto 0);
--            lnr : in std_logic;
--            y : out std_logic_vector(31 downto 0));
--end component;

----signal to test the m9_barrel32
----signal sig_x : std_logic_vector(31 downto 0) := "10000100111111110000000011111111";
--signal sig_x : std_logic_vector(31 downto 0) :=   "10000010000000100000000000100001";
--signal sig_pos : std_logic_vector(4 downto 0) := "01000";
--signal sig_lnr : std_logic := '0';  -- 0 means shift_right
--signal sig_y : std_logic_vector(31 downto 0);



----component to test m9_artan_rom
--component m9_artan_rom
--            port (
--                i : in std_logic_vector(4 downto 0);
--                d : out std_logic_vector(31 downto 0));
--end component;

----signal to test m9_artan_rom
--signal sig_i : std_logic_vector(4 downto 0) := "01000";
--signal sig_d : std_logic_vector(31 downto 0);            

----instance to test m9_artan_rom
-- m9_artan_rom_ins: m9_artan_rom
--            port map (
--                i => sig_i,
--                d => sig_d );

---- instance to test the m9_barrel32 component
--m9_barrel32_ins: m9_barrel32
--     port map(
--            x => sig_x,
--            pos => sig_pos,
--            lnr => sig_lnr,
--            y => sig_y );

-- signal timing in ns
-- change_signal_process: process(sig_pos, sig_lnr)
--   begin
--      sig_pos <= sig_pos after 10ns;
--       sig_lnr<= '1' after 10ns; 
--  end process;
-- end test m9_barrel32

----component to test m9_addsub32
--component m9_addsub32 is
--       port (
--            a, b : in std_logic_vector(31 downto 0);
--            ans : in std_logic;
--            y : out std_logic_vector(31 downto 0));
--end component;

------signals to test m9_addsub32
----signal sig_a : std_logic_vector(31 downto 0) := "00000011001111110000000000111111";
----signal sig_b : std_logic_vector(31 downto 0) := "00000011001111110000000000111111";
--signal sig_a : std_logic_vector(31 downto 0) :=   "00000000000000000000000000000011";
--signal sig_b : std_logic_vector(31 downto 0) :=   "00000000000000000000000000000101";
--signal sig_ans : std_logic := '1';  --'1' => sig_a - sig_b and '0' => sig_a + sig_b
--signal sig_y : std_logic_vector(31 downto 0);

--end m9_addsub32

end Behavioral;
