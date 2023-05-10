----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2023 09:27:44 AM
-- Design Name: 
-- Module Name: APB_slave - Behavioral
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

entity APB_slave is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           psel : in STD_LOGIC;
           penable : in STD_LOGIC;
           paddr : in STD_LOGIC_VECTOR (9 downto 0);
           pwrite : in STD_LOGIC;
           pwdata : in STD_LOGIC_VECTOR (31 downto 0);
           prdata : out STD_LOGIC_VECTOR (31 downto 0);
           pready : out STD_LOGIC);
end APB_slave;

architecture Behavioral of APB_slave is

-- Instance of external_module
component simple_memory_interface is port ( 
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           req : in STD_LOGIC;
           req_rnw : in STD_LOGIC;
           req_addr : in STD_LOGIC_VECTOR (9 downto 0);
           req_wdata : in STD_LOGIC_VECTOR (31 downto 0);
           req_ready : out STD_LOGIC;
           req_rdata : out STD_LOGIC_VECTOR (31 downto 0));
end component simple_memory_interface;
signal apb_req : std_logic;
signal not_pwrite : std_logic;
begin

smi_unit : simple_memory_interface port map (clk => clk, reset => reset, req => apb_req, req_rnw => not_pwrite,
                            req_addr => paddr, req_wdata => pwdata, req_ready => pready, req_rdata => prdata);
                            
apb_req <= psel and penable;
not_pwrite <= not pwrite;

end Behavioral;
