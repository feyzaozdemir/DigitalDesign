----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 03:25:50 PM
-- Design Name: 
-- Module Name: sequence_detector_tb - Behavioral
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

entity sequence_detector_tb is
--  Port ( );
end sequence_detector_tb;

architecture Behavioral of sequence_detector_tb is
        signal clk : STD_LOGIC;
        signal reset : STD_LOGIC;
        signal seq : STD_LOGIC;
        signal detected : STD_LOGIC;
begin

    seq_det_unit : entity work.sequence_detector
    port map (clk=>clk, reset=>reset,
                    seq=>seq, detected=>detected);
    process
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
    --111 0110110 11
    seq <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns, '0' after 50 ns, '1' after 60 ns,
         '1' after 70 ns, '0' after 80 ns, '0' after 90 ns, '1' after 100 ns, '1' after 110 ns, '0' after 120 ns, '1' after 130 ns,
         '0' after 140 ns, '0' after 150 ns, '1' after 160 ns, '1' after 170 ns, '0' after 180 ns, '1' after 190 ns, '1' after 200 ns , '1' after 210 ns,
          '0' after 220 ns, '1' after 230 ns, '1' after 240 ns, '0' after 250 ns, '1' after 260 ns, '1' after 270 ns, '0' after 280 ns,
          '1' after 290 ns, '1' after 300 ns, '1' after 310 ns, '0' after 320 ns, '1' after 330 ns, '1' after 340 ns, '1' after 350 ns;
    reset <= '1', '0' after 5 ns;

end Behavioral;
