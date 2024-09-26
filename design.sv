module memory(clk,reset,addr,wr_en,rd_en,wdata,rdata);
 
  input wire clk;
  input wire reset;
    
    //control signals
  input wire [1:0] addr;
  input wire  wr_en;
  input wire rd_en;
    
    //data signals
  input wire  [7:0] wdata;
  output reg [7:0] rdata;
  
  //Memory
  reg [7:0] mem [0:3];

  //Reset 
  always @(posedge reset) 
    for(int i=0;i<4;i++) mem[i]=8'hFF;
   
  // Write data to Memory
  always @(posedge clk) 
    begin
    if (wr_en)    
      mem[addr] <= wdata;
    end

  // Read data from memory
  always @(posedge clk)
    begin
    if (rd_en) 
      rdata <= mem[addr];
    end

endmodule