# Wishbone connected HyperRAM memory driver

This is an implementation of a HyperRAM memory driver connected to Wishbone bus.

Currently implemented:
- working with wb_clk_i clock (external HyperRAM clock is two times smaller due to DDR)
- read and write to both memory and register space (inside HyperRAM chip)
- single 32 bit access to memory space (no burst)
- single 16 bit access to register space (inside HyperRAM chip)
- adjusting timings (tacc, tcsh, tpre, tpost and read timeout) via registers (accessible via Wishbone)
- fixed latency (1x/2x) or variable latency (according to RWDS signal state during CA phase) - configurable in register
- read timeout in case of external HyperRAM connection failure

TODO:
- make it faster
- reimplement CSR registers
- add burst transfers
- cache up to few writes (in DFF SRAM) with instant acknowledging on Wishbone bus
- add additional Wishbone bus for connecting external sram as cache

# License

This project is [licensed under Apache 2](LICENSE)
