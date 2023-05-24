----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 10:18:19 AM
-- Design Name: 
-- Module Name: clk_tb - Behavioral
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

entity clk_tb is
--  Port ( );
end clk_tb;

architecture Behavioral of clk_tb is
signal clk : STD_LOGIC;
signal freq : integer;
signal dvd_clk : STD_LOGIC; --out
begin

cd_unit : entity work.clock_divider
port map (clk => clk, freq => freq, dvd_clk => dvd_clk);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

freq <= 100000;

end Behavioral;
