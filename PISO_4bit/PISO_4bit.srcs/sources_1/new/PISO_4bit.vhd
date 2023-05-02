----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 11:36:21 AM
-- Design Name: 
-- Module Name: PISO_4bit - Behavioral
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
use IEEE.std_logic_signed.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PISO_4bit is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           parallel_i : in STD_LOGIC_VECTOR (3 downto 0);
           empty_o : inout STD_LOGIC;
           serial_o : out STD_LOGIC;
           valid_o : out STD_LOGIC);
end PISO_4bit;

architecture Behavioral of PISO_4bit is
signal shift_ff : std_logic_vector (3 downto 0);
signal next_shift : std_logic_vector (3 downto 0);
signal count_ff : std_logic_vector (2 downto 0);
begin
    process (clk, reset)
    begin
        if (reset = '1') then
            --shift_ff <= "0000";
            count_ff <= "000";
        
        elsif (clk'event and clk = '1') then
        
            if (empty_o = '1') then
                next_shift <= parallel_i;
            else
                next_shift(2 downto 0) <= shift_ff(3 downto 1);
                next_shift(3) <= '0'; 
            end if;
            
            if (count_ff <= "100") then
                count_ff <= "000";
            else
                count_ff <= count_ff + '1';
            end if;
        
        end if;
        
        end process;
        
        valid_o <= '1' when count_ff /= ("000") else '0';
        empty_o <= '0' when count_ff /= ("000") else '1';
        shift_ff <= next_shift when reset /= ('1') else "0000";
        serial_o <= shift_ff(0);

end Behavioral;
