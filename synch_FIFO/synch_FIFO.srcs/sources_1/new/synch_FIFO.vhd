----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2023 03:41:37 PM
-- Design Name: 
-- Module Name: synch_FIFO - Behavioral
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
use ieee.std_logic_signed.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity synch_FIFO is
generic (
    depth : integer := 8;
    data_width : integer := 8);
Port ( clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    wr_en : in STD_LOGIC;  --write enable
    data_in : in STD_LOGIC_VECTOR (data_width-1 downto 0);
    rd_en : in STD_LOGIC;  --read enable
    data_out : inout STD_LOGIC_VECTOR (data_width-1 downto 0);
    full : out STD_LOGIC;
    empty : out STD_LOGIC);
end synch_FIFO;

architecture Behavioral of synch_FIFO is
type mem_arr is array (0 to depth) of std_logic_vector(data_width-1 downto 0);
signal mem : mem_arr;
signal wr_ptr : integer;
signal rd_ptr : integer;
begin

process (clk, reset)
begin
    if (reset='1') then
        rd_ptr <= 0;
        wr_ptr <= 0;
        full <= '0';
        empty <= '1';
        data_out <= (others => '0');
        mem <= (others => data_out);
        
    elsif (clk'event and clk='1') then
        if(wr_en = '1') then
            mem(wr_ptr) <= data_in;
            if (wr_ptr = depth) then
                wr_ptr <= 0;
            else
                wr_ptr <= wr_ptr + 1;
            end if;
        end if;
        
        if(rd_en = '1') then
            data_out <= mem(rd_ptr);
            if (rd_ptr = depth) then
                rd_ptr <= 0;
            else
                rd_ptr <= rd_ptr + 1;
            end if;
        end if;
    end if;

end process;

full <= '1' when (wr_ptr-1 = rd_ptr or (wr_ptr = depth and rd_ptr = 0)) else '0';
empty <= '1' when (wr_ptr = rd_ptr) else '0';


end Behavioral;
