library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Top is
    port (
        rst      : in  std_logic := '0';
        bit_in   : in  std_logic;
        dequeue  : in  std_logic := '0';
        clk_tb   : in  std_logic;
	enqueue  : in  std_logic := '0'
    );
end entity;

architecture rtl of Top is
    -- Clocks dos domínios
    signal clk_100khz : std_logic := '0';
    signal clk_10khz  : std_logic := '0';

    -- Sinais entre deserializador e fila
    signal des_data_out    : std_logic_vector(7 downto 0);
    signal des_data_ready  : std_logic := '0';
    signal des_ack         : std_logic := '0';
    signal des_status      : std_logic := '0';
    signal des_full        : std_logic := '0';

    signal fila_data_in    : std_logic_vector(7 downto 0);
    signal fila_data_out   : std_logic_vector(7 downto 0);
    signal fila_len_out    : std_logic_vector(3 downto 0);
    signal fila_full       : std_logic;

    -- Controle handshake
    signal enqueue_pulse   : std_logic := '0';
    signal ack_pulse       : std_logic := '0';

begin

    -- Instancia divisor de clock
    clkdiv: entity work.clock_divider
        port map (
            clk_in      => clk_tb,
            rst         => rst,
            clk_100khz  => clk_100khz,
            clk_10khz   => clk_10khz
        );

    -- Instancia deserializador
    des: entity work.deserializador
        port map (
            status_out  => des_status,
            data_out    => des_data_out,
            data_ready  => des_data_ready,
            ack_in      => des_ack,
            write_in    => '1',           -- sempre pronto para receber bits
            data_in     => bit_in,
            clk_100kHz  => clk_100khz,
            rst         => rst,
            full        => fila_full
        );

    -- Instancia fila
    queue_inst: entity work.queue
        port map (
            data_out    => fila_data_out,
            len_out     => fila_len_out,
            dequeue_in  => dequeue,
            enqueue_in  => enqueue,
            data_in     => fila_data_in,
            clk_10kHz   => clk_10khz,
            rst         => rst
        );

    -- Fila cheia?
    fila_full <= '1' when fila_len_out = "1000" else '0';

    -- Handshake entre deserializador (produtor) e fila (consumidor)
    process(clk_10khz)
        variable ack_reg : std_logic := '0';
    begin
        if rising_edge(clk_10khz) then

            -- Default: ack baixo
            des_ack      <= '0';

            if enqueue = '1' and fila_full = '0' then
                fila_data_in  <= des_data_out;
                des_ack       <= '1';
            end if;

        end if;
    end process;
end architecture;