library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is port
(
   	dequeue   : in std_logic := '0';
	enqueue   : in std_logic := '0';
	t_rst     : in std_logic := '0';
	bit_in    : in std_logic;
	clk_tb	  : in std_logic
);
end entity;

architecture Top of top is
	signal f_data_out   : std_logic_vector(7 downto 0);
	signal f_data_in    : std_logic_vector(7 downto 0);
	signal f_clk	    : std_logic := '0';
	signal f_len_out    : std_logic_vector(3 downto 0);

	signal d_data_out   : std_logic_vector(7 downto 0);
	signal d_data_in    : std_logic; 
	signal d_ack_in     : std_logic := '0';
	signal d_clk	    : std_logic := '0';
	signal d_write_in   : std_logic := '0';
	signal d_status_out : std_logic := '0';
	signal d_data_ready : std_logic;
	signal d_full	    : std_logic;
	
	signal lixo         : std_logic_vector(7 downto 0);
	signal temp	    : std_logic_vector(7 downto 0);

	signal t_data_in    : std_logic;
	
begin
   Deserializador: entity work.deserializador port map
      (
	status_out => d_status_out, -- se pode receber bits
        data_out => d_data_out,     -- saida 8bits
        data_ready => d_data_ready, -- se o pacote esta pronto
        ack_in => d_ack_in,         -- se a fila recebeu
        write_in => d_write_in,	    -- sinaliza que o top ta "escrevendo"(?)
        data_in => t_data_in,       -- entrada 1bit
        clk_100kHz => d_clk,        -- 10ms
        rst => t_rst,                -- rst
	full => d_full
      );

   Fila: entity work.queue port map
      (
	data_out => f_data_out,     -- saida da fila
	len_out => f_len_out,       -- quantidade de elementos
	dequeue_in => dequeue,      -- sinal para dequeue
	enqueue_in => enqueue,      -- sinal para enqueue
	data_in =>  f_data_in,      -- entrada da fila
	clk_10kHz => f_clk,         -- 100ms
	rst => t_rst                -- rst
      );

   clk_100Khz : process
       begin
           while true loop
               d_clk <= not d_clk;
               wait for 10 ms;
           end loop;
       end process;

   clk_10Khz : process
       begin
           while true loop
               f_clk <= not f_clk;
               wait for 100 ms;
           end loop;
       end process;

  teste: process(clk_tb)
    begin
     if(rising_edge(clk_tb)) then
-------- parte do deserializador -------------------
       if f_len_out = "1000" then
	  d_full <= '1';
       else
	  d_full <= '0';
       end if;

       if d_status_out = '0' then
	  t_data_in <= bit_in;
	  d_write_in <= '1';
       elsif d_data_ready = '1' then
	  temp <= d_data_out;
    	  d_ack_in <= '1';
       end if;
-------- parte da fila -----------------------------

       d_write_in <= '0';

       if enqueue = '1' and f_len_out < "1000" then
	  f_data_in <= temp;
       elsif dequeue = '1' and f_len_out /= "0000" then
	  lixo <= f_data_out;
       end if;
-----------------------------------------------------
   end if;
  end process;
end architecture;