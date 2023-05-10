----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 09:21:42 AM
-- Design Name: 
-- Module Name: APB_master - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity APB_master is
    Port ( clk : in STD_LOGIC;
           preset : in STD_LOGIC;
           transfer : in STD_LOGIC_VECTOR (1 downto 0);
           pready : in STD_LOGIC;
           prdata : in STD_LOGIC_VECTOR (31 downto 0);
           psel : inout STD_LOGIC;
           penable : out STD_LOGIC;
           paddr : out STD_LOGIC_VECTOR (31 downto 0);
           pwrite : out STD_LOGIC;
           pwdata : out STD_LOGIC_VECTOR (31 downto 0));
end APB_master;

architecture Behavioral of APB_master is
type state_type is (idle, setup, st_access);  -- Define the states
signal state : State_Type;    -- Create a signal that uses 
signal data_tmp : std_logic_vector (31 downto 0);
begin

process (clk, preset)
begin
    if (preset = '1') then
        state <= idle;
        data_tmp <= (others => '0');
    elsif (clk'event and clk = '1') then
            
        case state is
            when idle =>
                psel <= '0';
                penable <= '0';
                if(transfer /= "00") then
                state <= setup;
                end if;
            when setup =>
                psel <= '1';
                penable <= '0';
                state <= st_access;
            when st_access =>
                psel <= '1';
                penable <= '1';
                if (pready = '1') then
                    data_tmp <= prdata;
                    if(transfer /= "00") then
                        state <= setup;
                    else
                        state <= idle;
                    end if;
                end if;
        end case;
        
        pwdata <= data_tmp + '1';
        pwrite <= transfer(1);
        paddr <= x"DEADCAFE";
        
    end if;
end process;


end Behavioral;
