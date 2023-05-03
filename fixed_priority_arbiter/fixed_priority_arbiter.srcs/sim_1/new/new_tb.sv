`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 09:41:10 AM
// Design Name: 
// Module Name: new_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

 

module new_tb ();

  localparam num_ports = 4;

  logic[num_ports-1:0] req;
  logic[num_ports-1:0] gnt;

  fixed_priority_arbiter #(num_ports) fixed_priority_arbiter (.req (req), .gnt (gnt));

  initial begin
    for (int i=0; i<32; i=i+1) begin
      req = $urandom_range(0, 2**num_ports-1);
      #5;
    end
  end

//  initial begin
//    $dumpfile("fixed_priority_arbiter.vcd");
//    $dumpvars(0, new_tb);
//  end
  
endmodule