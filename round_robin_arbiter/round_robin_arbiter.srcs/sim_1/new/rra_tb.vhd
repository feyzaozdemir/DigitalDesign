----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2023 11:20:10 AM
-- Design Name: 
-- Module Name: rra_tb - Behavioral
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

entity rra_tb is
--  Port ( );
end rra_tb;

architecture Behavioral of rra_tb is
signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal req :  std_logic_vector (3 downto 0);
signal gnt : std_logic_vector (3 downto 0);
begin

rra_unit : entity work.round_robin_arbiter
port map (clk=>clk, reset=>reset, req=>req, gnt=>gnt);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

req <= "1101";
reset <= '1', '0' after 5 ns;

end Behavioral;
