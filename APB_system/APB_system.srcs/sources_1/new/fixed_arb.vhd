----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 09:19:45 AM
-- Design Name: 
-- Module Name: fixed_arb - Behavioral
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

entity fixed_arb is
    Port ( req : in STD_LOGIC_VECTOR (1 downto 0);
           gnt : out STD_LOGIC_VECTOR (1 downto 0));
end fixed_arb;

architecture Behavioral of fixed_arb is
begin

gnt <= "01" when req(0) = '1' else
		"10" when req(0) = '0' and req(1) = '1' else "00";
		
end Behavioral;
