Design and verify a read/write system described below:

Writes should have higher priority than reads
Sytem should be able to buffer 16 read or write requests to avoid any loss
System must use APB master/slave protocol to communicate to memory interface
`
                                   rd_valid_o
                                       ^
                                       |
|-----|    |------|    |------|     |------|
| ARB | -> | FIFO | -> | APBM | <-> | APBS | => rd_data_o
|-----|    |------|    |------|     |------|
`
