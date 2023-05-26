----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 10:08:19 AM
-- Design Name: 
-- Module Name: swg_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity swg_tb is
--  Port ( );
end swg_tb;

architecture Behavioral of swg_tb is
constant amp : real := 3.0;                     --amplitude -10 to 10
constant freq : integer := 100000;              --frequency
signal clk : std_logic;                         --in
signal wave_out : std_logic_vector(255 downto 0);   --out
signal deneme : integer;
signal denden: integer;
begin

swg_unit : entity work.square_wave_generator
generic map (amp => amp, freq => freq)
port map (clk => clk, deneme=>deneme, wave_out => wave_out);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;
denden <= 6, 0 after 1000000 ns, -6 after 2000000 ns, 6 after 3000000 ns, 0 after 4000000 ns,-6 after 5000000 ns,
 0 after 6000000 ns, -3 after 7000000 ns, 0 after 8000000 ns, 3 after 9000000 ns,0 after 10000000 ns;
end Behavioral;
