----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 11:31:32 AM
-- Design Name: 
-- Module Name: apb_system_tb - Behavioral
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

entity apb_system_tb is
--  Port ( );
end apb_system_tb;

architecture Behavioral of apb_system_tb is
constant depth : integer := 16;
constant data_width : integer := 8;
signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal rd_en : STD_LOGIC;
signal wr_en : STD_LOGIC;
signal valid : STD_LOGIC;
signal data : STD_LOGIC_VECTOR (31 downto 0);
begin

apb_system_unit : entity work.APB_system 
port map (clk => clk, reset => reset, rd_en => rd_en, wr_en => wr_en, valid => valid, data => data);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

reset <= '1', '0' after 5 ns;
wr_en <= '1', '0' after 120 ns, '1' after 500 ns;
rd_en <= '0', '1' after 100 ns;

end Behavioral;
