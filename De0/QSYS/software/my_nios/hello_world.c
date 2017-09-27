 #include <stdio.h>
#include <system.h>
#include <altera_avalon_pio_regs.h>

void simple_loop_delay()
{
   int l;
   for (l=0; l<100000;l++);

}

int main()
{
  printf("Hello from Nios II!\n");

  while(1)
  {
     IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE, 0xaa);
     simple_loop_delay();

     IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE, 0x55);
     simple_loop_delay();
  }

  return 0;
}
