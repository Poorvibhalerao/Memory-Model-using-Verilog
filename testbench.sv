
module tb;
  wire [7:0] r_data;
  reg clk,rst,wr_en,rd_en;
  reg [1:0] addr;
  reg [7:0] w_data;
  
  memory m1(clk,rst,addr,wr_en,rd_en,w_data,r_data);
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 0; rst = 0;
    $display("Clk	rst	wr_en	rd_en	addr	w_data	r_data");
    $monitor("%0d	%0d	%0d	%0d	%0d	%0d	%0h",clk,rst,wr_en,rd_en,addr,w_data,r_data,$time);
    #1 rd_en = 1; wr_en = 0;
    w_data = 8'd4; addr = 2'd3;
    #1 rd_en = 0; wr_en = 1;
    w_data = 8'd4; addr = 2'd2;
    #4 rd_en = 1; wr_en = 0;
    #3 rst = 1;
    #10 $finish;
  end
endmodule