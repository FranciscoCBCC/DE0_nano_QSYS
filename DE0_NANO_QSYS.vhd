library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity de0nano1 is
   port
    (
     pin_clk         : in    std_logic;
     pin_reset_n     : in    std_logic;
  
     pin_led_pio     : out   std_logic_vector(7 downto 0);
  
     pin_sdram_addr  : out   std_logic_vector(12 downto 0);            pin_sdram_ba    : out   std_logic_vector(1 downto 0);            pin_sdram_cas_n : out   std_logic;                                pin_sdram_cke   : out   std_logic;                                pin_sdram_cs_n  : out   std_logic;                                pin_sdram_dq    : inout std_logic_vector(15 downto 0) := (others => 'X'); 
     pin_sdram_dqm   : out   std_logic_vector(1 downto 0);            pin_sdram_ras_n : out   std_logic;                                pin_sdram_we_n  : out   std_logic;
     pin_sdram_clk   : out   std_logic  
     );
end entity;

architecture arch_de0nano1 of de0nano1 is

  component my_nios1 is
    port 
    (
     clk_clk              : in  std_logic := 'X'; 
     reset_reset_n        : in  std_logic := 'X'; 
     led_pio_external_connection_export : out std_logic_vector(7 downto 0);
     sdram_addr           : out   std_logic_vector(12 downto 0); 
     sdram_ba             : out   std_logic_vector(1 downto 0);  
     sdram_cas_n          : out   std_logic;                     
     sdram_cke            : out   std_logic;                     
     sdram_cs_n           : out   std_logic;                     
     sdram_dq             : inout std_logic_vector(15 downto 0) := (others => 'X'); 
     sdram_dqm            : out   std_logic_vector(1 downto 0);  
     sdram_ras_n          : out   std_logic;                     
     sdram_we_n           : out   std_logic                      
      );
  end component my_nios1;
  
begin

  inst_nios: component my_nios1 port map 
    (
      clk_clk                            => pin_clk, 
      reset_reset_n                      => pin_reset_n, 
      led_pio_external_connection_export => pin_led_pio,
      sdram_addr                         => pin_sdram_addr, 
      sdram_ba                           => pin_sdram_ba, 
      sdram_cas_n                        => pin_sdram_cas_n ,  
      sdram_cke                          => pin_sdram_cke,  
      sdram_cs_n                         => pin_sdram_cs_n,  
      sdram_dq                           => pin_sdram_dq, 
      sdram_dqm                          => pin_sdram_dqm ,  
      sdram_ras_n                        => pin_sdram_ras_n,   
      sdram_we_n                         => pin_sdram_we_n  
    );
  
    pin_sdram_clk <= pin_clk;
    
end architecture arch_de0nano1;
