----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 09:16:47 AM
-- Design Name: 
-- Module Name: APB_system - Behavioral
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

entity APB_system is
generic (
       depth : integer := 16;
       data_width : integer := 32);
Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       rd_en : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       valid : inout STD_LOGIC;
       data : out STD_LOGIC_VECTOR (31 downto 0));
end APB_system;

architecture Behavioral of APB_system is

component fixed_arb is port (
       req : in STD_LOGIC_VECTOR (1 downto 0);
       gnt : out STD_LOGIC_VECTOR (1 downto 0));
end component fixed_arb;

component synch_FIFO is
generic (
    depth : integer := depth;
    data_width : integer := data_width);
Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       wr_en : in STD_LOGIC;  --write enable
       data_in : in STD_LOGIC_VECTOR (data_width-1 downto 0);
       rd_en : in STD_LOGIC;  --read enable
       data_out : inout STD_LOGIC_VECTOR (data_width-1 downto 0);
       full : inout STD_LOGIC;
       empty : inout STD_LOGIC);
end component synch_FIFO;

component APB_master is
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
end component APB_master;

component APB_slave is
Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       psel : in STD_LOGIC;
       penable : in STD_LOGIC;
       paddr : in STD_LOGIC_VECTOR (9 downto 0);
       pwrite : in STD_LOGIC;
       pwdata : in STD_LOGIC_VECTOR (31 downto 0);
       prdata : out STD_LOGIC_VECTOR (31 downto 0);
       pready : out STD_LOGIC);
end component APB_slave;

signal wr_rd : std_logic_vector (1 downto 0);
signal system_data_in : STD_LOGIC_VECTOR (data_width-1 downto 0);
signal fifo_data_out : STD_LOGIC_VECTOR (data_width-1 downto 0);
signal fifo_full : std_logic;
signal fifo_empty : std_logic;
signal paddr : std_logic_vector (31 downto 0);
signal pready : std_logic;
signal psel : std_logic;
signal penable : std_logic;
signal pwrite : std_logic;
signal pwdata : std_logic_vector (31 downto 0);
signal prdata : std_logic_vector (31 downto 0);

begin

arb_unit : fixed_arb port map (req(0) => wr_en, req(1) => rd_en, gnt => wr_rd ); 

fifo_unit : synch_FIFO generic map (depth => depth, data_width => data_width)
port map (clk => clk, reset => reset, wr_en => wr_rd(0), data_in => system_data_in, 
                                    rd_en => wr_rd(1), data_out => fifo_data_out, full => fifo_full, empty => fifo_empty);
   
apb_master_unit : APB_master port map (clk => clk, preset => reset, transfer => wr_rd, pready => pready, prdata => fifo_data_out,
                                                     psel => psel, penable => penable, paddr => paddr, pwrite => pwrite, pwdata => pwdata);

apb_slave_unit : APB_slave port map (clk => clk, reset => reset, psel => psel, penable => penable, paddr => paddr(9 downto 0),
                                                    pwrite => pwrite, pwdata => pwdata, prdata => prdata, pready => pready);

--wr_rd(1) <= '1' when (fifo_empty /= '1' and penable = '0') else '0';
valid <= '1' when (pready = '1' and pwrite = '0') else '0';
data <= prdata when (valid = '1') else (others => '0');
system_data_in <= x"34FDA78E";

end Behavioral;
