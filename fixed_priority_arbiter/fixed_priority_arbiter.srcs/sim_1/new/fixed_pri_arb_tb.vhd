----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 08:46:49 AM
-- Design Name: 
-- Module Name: fixed_pri_arb_tb - Behavioral
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

entity fixed_pri_arb_tb is
--  Port ( );
end fixed_pri_arb_tb;

architecture Behavioral of fixed_pri_arb_tb is
    signal req : STD_LOGIC_VECTOR (2 downto 0);
    signal gnt : STD_LOGIC_VECTOR (2 downto 0);
begin

    fixed_pri_arb_unit : entity work.fixed_priority_arbiter
    port map (req => req, gnt => gnt);
    
    process
    begin
        wait;
    end process;
    req <= "010";


end Behavioral;
