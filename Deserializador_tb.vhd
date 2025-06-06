library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity des_tb is
end entity;

architecture Des_Tb of des_tb is
	signal d_data_out   : std_logic_vector(7 downto 0); --
	signal d_data_in    : std_logic; 		    --
	signal d_ack_in     : std_logic := '0';
	signal d_write_in   : std_logic := '0';
	signal d_status_out : std_logic := '0';
	signal d_data_ready : std_logic;		    --
	signal clk          : std_logic := '0';	            --
	signal rst	    : std_logic := '0';
	signal is_full      : std_logic := '0';
begin
  clk_process : process
       begin
           while true loop
               clk <= not clk;
               wait for 5 ms;
           end loop;
       end process;

  Deserializador : entity work.deserializador port map
      (
	status_out => d_status_out, -- se pode receber bits
        data_out => d_data_out,     -- saida 8bits
        data_ready => d_data_ready, -- se o pacote esta pronto
        ack_in => d_ack_in,         -- se a fila recebeu
        write_in => d_write_in,	    -- sinaliza que o top ta "escrevendo"(?)
        data_in => d_data_in,       -- entrada 1bit
        clk_100kHz => clk,          -- 10us
        rst => rst,                 -- rst
        full => is_full
      );

  teste : process
   begin
------------ byte 1----------------- "11010100"
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;

------------ byte invalido -------- "0001100"
	d_write_in <= '0';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '0';
	d_data_in <= '0';
	wait for 10 ms;

	d_write_in <= '0';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '0';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '0';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '0';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '0';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '0';
	d_data_in <= '0';
	wait for 10 ms;

	--rst <= '1';
	--wait for 10 ms;

-------------ack------------------

	d_ack_in <= '1';
	wait for 10 ms;
	
	d_ack_in <= '0';
	wait for 10 ms;

------------is full---------------

	is_full <= '1';
	wait for 10 ms;
	
	is_full <= '0';
	wait for 10 ms;

------------ byte 2----------------- "00011100"
	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;

------------ byte 3----------------- "11111100"
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '1';
	wait for 10 ms;

	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
	
	d_write_in <= '1';
	d_data_in <= '0';
	wait for 10 ms;
  end process;
end architecture;