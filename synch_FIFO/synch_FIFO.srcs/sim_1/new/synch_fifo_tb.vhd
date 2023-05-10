----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 04:29:14 PM
-- Design Name: 
-- Module Name: synch_fifo_tb - Behavioral
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

entity synch_fifo_tb is
--  Port ( );
end synch_fifo_tb;

architecture Behavioral of synch_fifo_tb is
constant depth : integer := 8;
constant data_width : integer := 8;
signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal wr_en : STD_LOGIC;  --write enable
signal data_in : STD_LOGIC_VECTOR (data_width-1 downto 0);
signal rd_en : STD_LOGIC;  --read enable
signal data_out : STD_LOGIC_VECTOR (data_width-1 downto 0);  --out
signal full : STD_LOGIC;   --out
signal empty : STD_LOGIC;  --out

begin

fifo_unit : entity work.synch_FIFO
generic map (depth=> depth, data_width=>data_width)
port map (clk=>clk, reset=>reset, wr_en=>wr_en, data_in=>data_in, rd_en=>rd_en,
                    data_out=>data_out, full=>full, empty=>empty);

process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

reset <= '1', '0' after 5 ns;
data_in <= x"67", x"a5" after 100 ns, x"38" after 200 ns;
wr_en <= '1', '0' after 150 ns;
rd_en <= '0', '1' after 120 ns;


end Behavioral;
