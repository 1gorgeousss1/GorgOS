#ifndef PORTS_H
#define PORTS_H
unsigned char read_port(unsigned short port);
void write_port(unsigned short port, unsigned char data);
// write_port(0x3d4, 14) - Старший байт
// write_port(0x3d4, 15) - Младший байт
#endif            // PORTS_H
