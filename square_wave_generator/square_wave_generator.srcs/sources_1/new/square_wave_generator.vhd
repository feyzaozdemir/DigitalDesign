----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2023 10:00:45 AM
-- Design Name: 
-- Module Name: square_wave_generator - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity square_wave_generator is
generic (
        amp : real := 3.0;        --amplitude -10 to 10
        freq : integer := 100000);  --frequency
Port ( clk : in std_logic;
       deneme : out integer;
       wave_out : out std_logic_vector(255 downto 0));
end square_wave_generator;

architecture Behavioral of square_wave_generator is

component clock_divider is
Port ( clk : in STD_LOGIC;
       freq : in integer;
       dvd_clk : out STD_LOGIC);
end component clock_divider;


function calc_idx 
(amp : real) 
return integer is
variable index : integer range 0 to 300;
variable rr : real;
begin
rr := abs((amp * (255.0 / 20.0)) + 128.0);
if( rr = 128.0) then
    rr := 127.0;
end if;
index := integer(rr);
return index;
end function calc_idx;

signal dvd_clk : std_logic;
signal genlik : real := amp;
signal index : integer := 127;
signal wave : unsigned (255 downto 0);
--signal wave : std_logic_vector (255 downto 0);

--signal duty_cycle : unsigned(pwm_bits - 1 downto 0);
begin

clk_dvd : clock_divider port map (clk => clk, freq => freq, dvd_clk => dvd_clk);

process (dvd_clk)
begin
    if(dvd_clk'event and dvd_clk='1') then
        genlik <= -genlik;
        index <= calc_idx(genlik);
        --wave(3) <= '1';
        wave <= (index => '1', 
                 others => '0');
    end if;
end process;

deneme <=  integer(genlik);
--wave_out <= wave;

end Behavioral;
