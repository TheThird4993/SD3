library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
    port (
        clk_in      : in  std_logic;  -- 1 MHz clock input
        rst         : in  std_logic;  -- synchronous reset
        clk_100khz  : out std_logic;
        clk_10khz   : out std_logic
    );
end entity;

architecture rtl of clock_divider is
    signal count_100khz : unsigned(2 downto 0) := (others => '0'); -- 1MHz/(2*5) = 100kHz
    signal count_10khz  : unsigned(4 downto 0) := (others => '0'); -- 1MHz/(2*50) = 10kHz
    signal clk_100khz_i : std_logic := '0';
    signal clk_10khz_i  : std_logic := '0';
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then
            if rst = '1' then
                count_100khz <= (others => '0');
                count_10khz  <= (others => '0');
                clk_100khz_i <= '0';
                clk_10khz_i  <= '0';
            else
                -- Divide para 100kHz
                if count_100khz = 4 then
                    count_100khz <= (others => '0');
                    clk_100khz_i <= not clk_100khz_i;
                else
                    count_100khz <= count_100khz + 1;
                end if;

                -- Divide para 10kHz
                if count_10khz = 49 then
                    count_10khz <= (others => '0');
                    clk_10khz_i <= not clk_10khz_i;
                else
                    count_10khz <= count_10khz + 1;
                end if;
            end if;
        end if;
    end process;

    clk_100khz <= clk_100khz_i;
    clk_10khz  <= clk_10khz_i;
end architecture;