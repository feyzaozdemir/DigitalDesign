----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 10:08:26 AM
-- Design Name: 
-- Module Name: smi_tb - Behavioral
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

entity smi_tb is
--  Port ( );
end smi_tb;

architecture Behavioral of smi_tb is
signal clk : STD_LOGIC;
signal reset : STD_LOGIC;
signal req : STD_LOGIC;
signal req_rnw : STD_LOGIC;
signal req_addr : integer; -- 0-15
signal req_wdata : STD_LOGIC_VECTOR (31 downto 0);
signal req_ready : STD_LOGIC;                       --out
signal req_rdata : STD_LOGIC_VECTOR (31 downto 0);  --out
begin

smi_unit : entity work.simple_memory_interface
port map (clk=>clk, reset=>reset, req=>req, req_rnw=>req_rnw, req_addr=>req_addr,
                    req_wdata=>req_wdata, req_ready=>req_ready, req_rdata=>req_rdata);
                    
process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

reset <= '1', '0' after 5 ns;
req <= '0', '1' after 25 ns, '0' after 45 ns, '1' after 65 ns;
req_rnw <= '0', '1' after 150 ns;
req_addr <= 11;
req_wdata <= x"D3AD7612";

end Behavioral;
