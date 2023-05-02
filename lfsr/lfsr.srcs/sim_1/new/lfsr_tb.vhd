----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 10:56:50 AM
-- Design Name: 
-- Module Name: lfsr_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lfsr_tb is
--  Port ( );
end lfsr_tb;

architecture Behavioral of lfsr_tb is
   signal clk : STD_LOGIC;
   signal reset : STD_LOGIC;
   signal lfsr_in : std_logic_vector (3 downto 0);
   signal lfsr_out : STD_LOGIC_VECTOR (3 downto 0);
begin

    lfsr_unit : entity work.lfsr
    port map (clk=>clk, reset=>reset, lfsr_in=>lfsr_in,
                    lfsr_out=>lfsr_out);
    process 
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    lfsr_in <= "0101";
    reset <= '1', '0' after 5 ns;

end Behavioral;
