----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 04:07:07 PM
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
generic (width : integer := 3);
Port ( req : in STD_LOGIC_VECTOR (3 downto 0);
       gnt : out STD_LOGIC_VECTOR (3 downto 0));
end fixed_arb;

architecture Behavioral of fixed_arb is

signal tmp : std_logic_vector (3 downto 0);

function or_reduce( x: std_logic_vector )
    return std_ulogic is
    variable result: std_ulogic;
begin
    for i in x'range loop
        if i = x'left then
            result := x(i);
        else
            result := result OR x(i);
        end if;
    exit when result = '1';
    end loop;
    return result;
end function or_reduce;

signal den : std_logic;

begin
--process is
--begin
for j in 0 to width-1 loop
    tmp(j) <= or_reduce(req(j downto 0));
end loop;
--end process;

end Behavioral;
