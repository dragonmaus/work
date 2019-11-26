#include <unistd.h>
#include "open.h"

  int
main(int argc, const char **argv)
{
  register int fd;

  if (!--argc) _exit(2);
  while (*++argv) {
    fd = open_read(*argv);
    if (fd == -1) _exit(1);
    if (fsync(fd) == -1) _exit(1);
    close(fd);
  }
  return 0;
}
