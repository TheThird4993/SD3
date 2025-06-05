library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fila_tb is
end entity;

architecture Fila_Tb of fila_tb is
	signal dequeue     : std_logic := '0';
	signal enqueue     : std_logic := '0';
	signal f_data_out  : std_logic_vector(7 downto 0);
	signal f_data_in   : std_logic_vector(7 downto 0);
	signal f_len_out   : std_logic_vector(3 downto 0);		    --
	signal clk         : std_logic := '0';	            --
	signal rst	   : std_logic := '0';
begin
  clk_process : process
       begin
           while true loop
               clk <= not clk;
               wait for 50 ms;
           end loop;
       end process;

  Fila : entity work.queue port map
      (
	data_out => f_data_out,     -- saida da fila
	len_out => f_len_out,       -- quantidade de elementos
	dequeue_in => dequeue,      -- sinal para dequeue
	enqueue_in => enqueue,      -- sinal para enqueue
	data_in =>  f_data_in,      -- entrada da fila
	clk_10kHz => clk,           -- 100ms
	rst => rst                  -- rst
      );
  teste : process
  begin
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "01110010"; -- byte 1 <-
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "01111110"; -- byte 2
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "00000010"; -- byte 3 <-
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "00011110"; -- byte 4
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "01000010"; -- byte 5 <-
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "00000001"; -- byte 6
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "00000110"; -- byte 7 <-
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "00001110"; -- byte 8
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "10000000"; -- byte 9 <-
	wait for 100 ms;

	enqueue <= '1';
	f_data_in <= "11111111"; -- byte 10
	wait for 100 ms;

	enqueue <= '0';
	dequeue <= '1';
	wait for 1000 ms;
  end process;
end architecture;