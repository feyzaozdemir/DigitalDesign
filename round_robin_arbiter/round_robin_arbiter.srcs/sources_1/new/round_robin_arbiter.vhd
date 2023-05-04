----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 02:15:31 PM
-- Design Name: 
-- Module Name: round_robin_arbiter - Behavioral
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

entity round_robin_arbiter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           req : in std_logic_vector (3 downto 0);
           gnt : inout std_logic_vector (3 downto 0));
end round_robin_arbiter;

architecture Behavioral of round_robin_arbiter is

  -- Instance of external_module
component fixed_priority_arbiter is
port (
req : in std_logic_vector (3 downto 0);
gnt : out std_logic_vector (3 downto 0));
end component fixed_priority_arbiter;

--signal req_ext : std_logic_vector (3 downto 0);
--signal gnt_ext : std_logic_vector (3 downto 0);
    
signal next_mask : std_logic_vector (3 downto 0) := (others => '0');
signal masked_req : std_logic_vector (3 downto 0);
signal masked_gnt : std_logic_vector (3 downto 0);
signal unmasked_gnt : std_logic_vector (3 downto 0);

begin

fpa1 : fixed_priority_arbiter port map ( req => masked_req, gnt => masked_gnt);
fpa2 : fixed_priority_arbiter port map ( req => req, gnt => unmasked_gnt);
            
process (clk, reset)
begin
    if (reset = '1') then
        gnt <= (others => '0');
    elsif (clk'event and clk = '1') then
        masked_req <= next_mask and req;
        if (masked_req = "0000") then
            gnt <= unmasked_gnt;
        else
            gnt <= masked_gnt;
        end if;
        --gnt <= masked_gnt when (masked_req = '1') else unmasked_gnt; 
    end if;
end process;

next_mask <= "1110" when gnt(0) = '1' else
             "1100" when gnt(1) = '1' else
             "1000" when gnt(2) = '1' else 
             "0000" when gnt(3) = '1';
             
    
end Behavioral;

