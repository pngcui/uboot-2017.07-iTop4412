#include <common.h>
#include <config.h>
#include <asm/io.h>

void s_init(void)
{
   writel(readl(0x1002330c) | 0x300, 0x1002330c);
   writel(0, 0x11000c08);

   /* led test */
   writel(0x10, 0x11000060);
   writel(0x2, 0x11000064);

   writel(0x1, 0x11000100);
   writel(0x1, 0x11000104);
}
