library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity queue is port
(  
    data_out    : out std_logic_vector(7 downto 0);
    len_out     : out std_logic_vector(3 downto 0) := "0000";
    dequeue_in 	: in  std_logic := '0';
    enqueue_in  : in  std_logic := '1';
    data_in     : in  std_logic_vector(7 downto 0);
    clk_10kHz   : in  std_logic;
    rst 	: in  std_logic := '0'
);
end entity;

architecture Queue of queue is
  type vetor_de_vetores is array (natural range <>) of std_logic_vector(7 downto 0);

  signal is_full  : std_logic := '0';
  signal is_empty : std_logic := '1';
  signal dequeue  : std_logic := '0';
  signal vetores  : vetor_de_vetores(0 to 7);
begin
    process(clk_10khz, rst)
	variable init : integer := 1;
    begin
     if rst = '1' then
	dequeue <= '0';
	len_out <= "0000";
	is_full <= '0';
	is_empty <= '0';
	  for i in 0 to 7 loop
    	     vetores(i) <= "00000000";
          end loop;
     end if;	

     if init = 1 then
	init := 0;
	for i in 0 to 7 loop
    	     vetores(i) <= "00000000";
          end loop;
     end if;

      if rising_edge(clk_10khz) then
	if enqueue_in = '1' and is_full = '0' then
	  if len_out = "1000" then
	     is_full <= '1';
	  else
	     is_empty <= '0'; 
	     vetores(to_integer(unsigned(len_out))) <= data_in;
	     len_out <= std_logic_vector(unsigned(len_out) + 1);
	  end if;

	elsif dequeue = '1' and is_empty = '0' then
	  if len_out = "0000" then
	     is_empty <= '1';
	  else
	     is_full <= '0';
	     data_out <= vetores(0);
	     len_out <= std_logic_vector(unsigned(len_out) - 1);

             for i in 0 to 6 loop
    	       vetores(i) <= vetores(i+1);
             end loop;
	       vetores(7) <= "00000000";
	  end if;
	end if;
	dequeue <= dequeue_in;
     end if;
    end process;
end architecture;
