
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity de0nano1 is
  port
  (
   pin_clk    : in  std_logic;
   pin_reset_n: in  std_logic;
   pin_led_pio: out std_logic_vector(7 downto 0)
   );
end entity;

architecture arch_de0nano1 of de0nano1 is

  component my_nios1 is
    port 
    (
    clk_clk                            : in  std_logic := 'X'; 
    reset_reset_n                      : in  std_logic := 'X'; 
    led_pio_external_connection_export : out std_logic_vector
                                                 (7 downto 0) 
      );
  end component my_nios1;
  
begin

  inst_nios: component my_nios1 port map 
    (
      clk_clk                            => pin_clk, 
      reset_reset_n                      => pin_reset_n, 
      led_pio_external_connection_export => pin_led_pio 
    );
   
end architecture arch_de0nano1;
