----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 09:26:38 AM
-- Design Name: 
-- Module Name: simple_memory_interface - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simple_memory_interface is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           req : in STD_LOGIC;
           req_rnw : in STD_LOGIC;
           req_addr : in std_logic_vector (9 downto 0);
           req_wdata : in STD_LOGIC_VECTOR (31 downto 0);
           req_ready : out STD_LOGIC;
           req_rdata : out STD_LOGIC_VECTOR (31 downto 0));
end simple_memory_interface;

architecture Behavioral of simple_memory_interface is

-- Instance of external_module
component lfsr is port (
clk : in STD_LOGIC;
reset : in STD_LOGIC;
lfsr_in : in STD_LOGIC_VECTOR (3 downto 0);
lfsr_out : inout STD_LOGIC_VECTOR (3 downto 0));
end component lfsr;

type mem_arr is array (0 to 15) of std_logic_vector(31 downto 0);
signal mem : mem_arr;

signal lfsr_val : std_logic_vector (3 downto 0);
signal count_ff : std_logic_vector (3 downto 0);
signal nxt_cnt : std_logic_vector (3 downto 0);


begin

lfsr1 : lfsr port map (clk => clk, reset => reset, lfsr_in => "1010", lfsr_out => lfsr_val);

process (clk, reset, req)

variable index : integer:= to_integer(unsigned(req_addr));

begin
    if (reset = '1') then 
        count_ff <= (others => '0');
        nxt_cnt <= "0000";
        
    elsif(clk'event and clk = '1') then
        if(req = '1' and req_rnw = '0' and count_ff = "0000") then --write
            mem(index) <= req_wdata;
        end if;
        count_ff <= nxt_cnt;
        if (req = '1' and req_rnw = '1') then
            req_rdata <= mem(index);
        else
            req_rdata <= (others => '0');
        end if;
        
    elsif ( req'event and req = '1') then
        nxt_cnt <= lfsr_val;
    else
        nxt_cnt <= count_ff + "0001";
    end if;
   
end process;

--req_rdata <= mem(index) when (req = '1' and req_rnw = '1') else (others => '0');
req_ready <= '1' when count_ff = "0000" else '0';

end Behavioral;
