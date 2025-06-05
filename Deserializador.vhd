library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity deserializador is port
(  
    status_out  : out std_logic := '0';
    data_out    : out std_logic_vector(7 downto 0);
    data_ready  : out std_logic := '0';
    ack_in 	: in  std_logic := '0';  -- a cada byte que recebe
    write_in    : in  std_logic := '1'; -- sinaliza que o top ta escrevendo(?)
    data_in     : in  std_logic;
    clk_100kHz  : in  std_logic;
    rst 	: in  std_logic := '0'
);
end entity;

architecture Deserializador of deserializador is
  signal data_temp : unsigned(7 downto 0) := "00000000";
begin
    process(clk_100khz, rst)
      variable d_counter : integer := 0;
    begin
     if rst = '1' then
	     data_temp  <= "00000000";
	     data_out   <= "00000000";
	     data_ready <= '0';
	     d_counter    := 0;
	     status_out <= '0';
     end if;	
      if rising_edge(clk_100khz) then
	if (ack_in = '1') then
	     data_temp <= "00000000";
	     data_ready <= '0';
	     d_counter := 0;
	     status_out <= '1';
	end if;

	if (d_counter /= 8) and (write_in = '1') then
	     status_out <= '1';
	     data_temp <= data_temp(6 downto 0) & data_in;
	     d_counter := d_counter + 1;
	elsif (d_counter = 8) then
	     data_ready <= '1';
	     data_out <= std_logic_vector(data_temp);
	     status_out <= '0';
	end if;

     end if;
    end process;
end architecture;