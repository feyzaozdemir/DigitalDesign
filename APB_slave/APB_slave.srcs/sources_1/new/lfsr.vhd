----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 03:27:12 PM
-- Design Name: 
-- Module Name: lfsr - Behavioral
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

entity lfsr is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           lfsr_in : in STD_LOGIC_VECTOR (3 downto 0);
           lfsr_out : inout STD_LOGIC_VECTOR (3 downto 0));
end lfsr;

architecture Behavioral of lfsr is
signal out_temp : STD_LOGIC_VECTOR (3 downto 0);

begin

    process (clk, reset)
    begin
        if(reset = '1') then
            out_temp <= lfsr_in;
        elsif(clk'event and clk = '1') then
            out_temp(0) <= (lfsr_out(1) xor lfsr_out(3));
            out_temp(3 downto 1) <= lfsr_out(2 downto 0);
        end if;
    end process;
    lfsr_out <= out_temp;

end Behavioral;

