#include "buffer.h"

  int
buffer_0_read(unsigned int fd, char *buf, unsigned int len)
{
  if (buffer_flush(buffer_1) == -1) return -1;
  return buffer_read(fd, buf, len);
}

char buffer_0_space[BUFFER_INSIZE];
static buffer it = BUFFER_INIT(buffer_0_read, 0, buffer_0_space, sizeof(buffer_0_space));
buffer *buffer_0 = &it;
