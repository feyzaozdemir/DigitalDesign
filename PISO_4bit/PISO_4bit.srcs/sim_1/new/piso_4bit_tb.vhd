----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 01:59:48 PM
-- Design Name: 
-- Module Name: piso_4bit_tb - Behavioral
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

entity piso_4bit_tb is
--  Port ( );
end piso_4bit_tb;

architecture Behavioral of piso_4bit_tb is
           signal clk : STD_LOGIC;
           signal reset : STD_LOGIC;
           signal parallel_i : STD_LOGIC_VECTOR (3 downto 0);
           signal empty_o : STD_LOGIC;
           signal serial_o : STD_LOGIC;
           signal valid_o : STD_LOGIC;
begin
        piso_unit : entity work.PISO_4bit
        port map (clk=>clk, reset=>reset, parallel_i=>parallel_i,
                    empty_o=>empty_o, serial_o=>serial_o, valid_o=>valid_o);

        process 
        begin
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end process;
        
        parallel_i <= "0110", "1010" after 70 ns, "1101" after 300 ns;
        reset <= '1', '0' after 5 ns;
        
end Behavioral;
