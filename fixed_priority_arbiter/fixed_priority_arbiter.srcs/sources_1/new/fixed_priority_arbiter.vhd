----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 04:29:07 PM
-- Design Name: 
-- Module Name: fixed_priority_arbiter - Behavioral
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

entity fixed_priority_arbiter is
    Port ( req : in STD_LOGIC_VECTOR (2 downto 0);
           gnt : out STD_LOGIC_VECTOR (2 downto 0));
end fixed_priority_arbiter;

architecture Behavioral of fixed_priority_arbiter is
begin
    process is
    begin
    if (req(0) = '1') then
        gnt <= "100";
    elsif ( req(1) = '1') then
        gnt <= "010";
    else
        gnt <= "001";
    end if;
    wait;
    end process;


end Behavioral;
