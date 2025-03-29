#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RESOLUTION 1920

int write_to_file(const char* file_content, size_t size)
{
  FILE* file = fopen("submit_file.cimg", "wb");
  if (file == NULL)
  {
    printf("Cannot write file");
    return 1;
  }

  fwrite(file_content, 1, size, file);
  fclose(file);

  return 0;
}

int main()
{
  int byte_for_header = 8;
  int content_byte = RESOLUTION * 4;
  unsigned char header[8] = { 0x63, 0x49, 0x4d, 0x47, 0x02, 0x00, 0x50, 0x18 };
  unsigned char content[content_byte];
  unsigned char all_file[content_byte + 8];

  for (int i = 0; i < RESOLUTION; i++)
  {
    content[i * 4] = 0x8c;
    content[i * 4 + 1] = 0x1d;
    content[i * 4 + 2] = '@';
    content[i * 4 + 3] = '-';
  }

  // merge herder and content
  memcpy(all_file, header, sizeof(header));
  memcpy(all_file + sizeof(header), content, content_byte);

  return write_to_file(all_file, sizeof(all_file));
}