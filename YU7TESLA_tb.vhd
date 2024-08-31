library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity YU7TESLA_tb is
end entity YU7TESLA_tb;

architecture rtl of YU7TESLA_tb is
    
    constant period_time : time      := 83333 ps;
    signal   finished    : std_logic := '0';
    
    signal CLK : std_logic;
    signal LED : std_logic;
    
    component YU7TESLA is
        port(
            CLK : in     std_logic;
            LED : buffer std_logic := '0'
        );
    end component YU7TESLA;
    
begin

    sim_time_proc: process
    begin
        wait for 200 ms;
        finished <= '1';
        wait;
    end process sim_time_proc;

    clk_proc: process
    begin
        while finished /= '1' loop
            CLK <= '0';
            wait for period_time/2;
            CLK <= '1';
            wait for period_time/2;
        end loop;
        wait;
    end process clk_proc;
    
    u1: YU7TESLA
    port map
    (
        CLK => CLK,
        LED => LED
    );

end architecture rtl; 