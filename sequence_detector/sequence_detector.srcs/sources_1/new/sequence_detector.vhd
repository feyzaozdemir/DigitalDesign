----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 03:03:35 PM
-- Design Name: 
-- Module Name: sequence_detector - Behavioral
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

entity sequence_detector is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           seq : in STD_LOGIC;
           detected : out STD_LOGIC);
end sequence_detector;

architecture Behavioral of sequence_detector is
constant pattern : std_logic_vector(11 downto 0) := "111011011011";
signal arr : std_logic_vector (11 downto 0);
begin

    process (clk, reset)
    begin
        if (reset = '1') then
            arr <= (others =>'0');
        elsif (clk'event and clk = '1') then
            arr(0) <= seq;
            arr(11 downto 1) <= arr(10 downto 0);
        end if;
    end process;
    
    detected <= '0' when arr /= pattern else '1';

end Behavioral;
