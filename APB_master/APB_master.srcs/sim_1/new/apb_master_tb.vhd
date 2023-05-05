----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2023 03:43:15 PM
-- Design Name: 
-- Module Name: apb_master_tb - Behavioral
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

entity apb_master_tb is
--  Port ( );
end apb_master_tb;

architecture Behavioral of apb_master_tb is
signal clk : STD_LOGIC;
signal preset : STD_LOGIC;
signal transfer : std_logic_vector (1 downto 0);
signal pready : STD_LOGIC;
signal prdata : STD_LOGIC_VECTOR (31 downto 0);
signal psel : STD_LOGIC;
signal penable : STD_LOGIC;
signal paddr : STD_LOGIC_VECTOR (31 downto 0);
signal pwrite : STD_LOGIC;
signal pwdata : STD_LOGIC_VECTOR (31 downto 0);
begin

apb_master_unit : entity work.APB_master
port map (clk=>clk, preset=>preset, transfer=>transfer, pready=>pready, prdata=>prdata, 
            psel=>psel, penable=>penable, paddr=>paddr, pwrite=>pwrite, pwdata=>pwdata);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

transfer <= "00", "10" after 5 ns, "01" after 25 ns, "10" after 45 ns, "01" after 65 ns, "10" after 85 ns, "00" after 120 ns;
preset <= '0', '1' after 5 ns;
prdata <= x"DE01C110";
pready <= '0', '1' after 5 ns;

end Behavioral;
