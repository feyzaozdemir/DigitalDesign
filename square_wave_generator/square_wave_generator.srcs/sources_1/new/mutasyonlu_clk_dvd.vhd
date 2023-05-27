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

entity clock_divider is
Port ( clk : in STD_LOGIC;
       freq : in integer;
       dvd_clk : out STD_LOGIC);
end clock_divider;

--Kullanılan fpga'in frekansı 50MHz olarak kabul edilsin
--bir clock darbesinin 20 ns sürdüğü anlamına gelir.

architecture Behavioral of clock_divider is
signal cnt : integer := 0;
signal cnt_lim : integer := 1000;
signal tmp : std_logic := '1';
begin

--cnt_lim <= 100000000 / freq;

process (clk)
begin
    if (clk'event and clk = '1') then
        if (cnt = cnt_lim) then
            if (tmp <= '0') then
                tmp <= not tmp;
                cnt <= cnt + 1;
            elsif (tmp <= '1') then
                tmp <= not tmp;
                cnt <= 0;
            end if;
        elsif (cnt = cnt_lim + 1) then
            tmp <= not tmp;
            cnt <= cnt + 1;
        elsif (cnt = cnt_lim + 2) then
            tmp <= not tmp;
            cnt <= 0;
        else
            cnt <= cnt + 1;
        end if;
    end if;
end process;

dvd_clk <= tmp;


end Behavioral;
