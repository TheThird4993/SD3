library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity;

architecture Tb of tb is
	signal dequeue  : std_logic := '0';
	signal enqueue  : std_logic := '0';
	signal rst    : std_logic := '0';
	signal bit_in   : std_logic;
	signal clk_tb   : std_logic := '0';
begin
  clk_process : process
    begin
     while true loop
        clk_tb <= not clk_tb;
        wait for 0.5 us; -- meio período de 1 MHz
     end loop;
  end process;

  Top : entity work.top port map
      (
	dequeue => dequeue,
	enqueue => enqueue,
	rst => rst,
	bit_in => bit_in,
	clk_tb => clk_tb
      );

  teste : process
   begin

---------byte 1-----------
    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

   
    enqueue <= '1';
    wait for 10 us;
   
    enqueue <= '0';
    wait for 10 us;

---------------------------
---------byte 2------------

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

   
    enqueue <= '1';
    wait for 10 us;
   
    enqueue <= '0';
    wait for 10 us;

---------------------------
---------byte 3------------

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

   
    enqueue <= '1';
    wait for 10 us;
   
    enqueue <= '0';
    wait for 10 us;

    bit_in <= '0';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

    bit_in <= '1';
    wait for 10 us;

   
    enqueue <= '1';
    wait for 10 us;
   
    enqueue <= '0';
    wait for 10 us;

---------------------------

   dequeue <= '1'; --
    wait for 10 us;
   
    dequeue <= '0';
     wait for 10 us;

   dequeue <= '1'; --
    wait for 10 us;
   
    dequeue <= '0';
    wait for 10 us;

   dequeue <= '1'; --
    wait for 10 us;
   
    dequeue <= '0';
    wait for 10 us;

   dequeue <= '1'; --
    wait for 10 us;
   
    dequeue <= '0';
    wait for 10 us;

    rst <= '1';
    wait for 10 us;
   
    rst <= '0';
    wait for 10 us;

 end process;
end architecture;