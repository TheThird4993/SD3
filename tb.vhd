library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture Tb of tb is
	signal dequeue  : std_logic := '0';
	signal enqueue  : std_logic := '0';
	signal t_rst    : std_logic := '0';
	signal bit_in   : std_logic;
	signal clk_tb   : std_logic := '0';
begin
  clk : process
       begin
           while true loop
               clk_tb <= not clk_tb;
               wait for 10 ms;
           end loop;
       end process;

  Top : entity work.top port map
      (
	dequeue => dequeue,
	enqueue => enqueue,
	t_rst => t_rst,
	bit_in => bit_in,
	clk_tb => clk_tb
      );

  teste : process
   begin
---------byte 1-----------
    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

   
    enqueue <= '1';
    wait for 5 ms;
   
    enqueue <= '0';
    wait for 5 ms;

---------------------------
---------byte 2------------

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

   
    enqueue <= '1';
    wait for 5 ms;
   
    enqueue <= '0';
    wait for 5 ms;

---------------------------
---------byte 3------------

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

   
    enqueue <= '1';
    wait for 5 ms;
   
    enqueue <= '0';
    wait for 5 ms;

    bit_in <= '0';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

    bit_in <= '1';
    wait for 5 ms;

   
    enqueue <= '1';
    wait for 5 ms;
   
    enqueue <= '0';
    wait for 5 ms;

---------------------------

   dequeue <= '1'; --
    wait for 5 ms;
   
    dequeue <= '0';
    wait for 5 ms;

   dequeue <= '1'; --
    wait for 5 ms;
   
    dequeue <= '0';
    wait for 5 ms;

   dequeue <= '1'; --
    wait for 5 ms;
   
    dequeue <= '0';
    wait for 5 ms;

   dequeue <= '1'; --
    wait for 5 ms;
   
    dequeue <= '0';
    wait for 5 ms;

    t_rst <= '1';
    wait for 5 ms;
   
    t_rst <= '0';
    wait for 5 ms;

 end process;
end architecture;