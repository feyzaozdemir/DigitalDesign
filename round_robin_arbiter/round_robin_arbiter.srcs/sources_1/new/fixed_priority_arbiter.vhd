----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2023 10:34:25 AM
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
    Port ( req : in STD_LOGIC_VECTOR (3 downto 0);
           gnt : out STD_LOGIC_VECTOR (3 downto 0));
end fixed_priority_arbiter;

architecture Behavioral of fixed_priority_arbiter is
begin

gnt <= "0001" when req(0) = '1' else
		"0010" when req(0) = '0' and req(1) = '1' else
		"0100" when req(0) = '0' and req(1) = '0' and req(2) = '1' else
		"1000" when req(0) = '0' and req(1) = '0' and req(2) = '0' and req(3) = '1'  else "0000";
		
end Behavioral;
