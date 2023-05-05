----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 02:03:52 PM
-- Design Name: 
-- Module Name: edge_detector - Behavioral
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

entity edge_detector is
    Port ( clk : in STD_LOGIC;
           sig : in STD_LOGIC;
           rising : out STD_LOGIC;
           falling : out STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is
signal sig_tmp : std_logic;
begin
process
begin
    if(clk'event and clk='1') then
        sig_tmp <= sig;
    end if;
end process;
rising <= not sig and sig_tmp;
falling <= sig and not sig_tmp;
end Behavioral;
