`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 22:39:07
// Design Name: 
// Module Name: VendingMachineTB
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


module VendingMachineTB;

//Inputs
reg CLK;
reg RST;
reg START;
reg CANCEL;
reg [2:0] PRODUCT_CODE;
reg ONLINE_PAYMENT;
reg [6:0] COINS;

//OUTPUTS
wire [3:0] STATE;
wire DISPENSE_PRODUCT;
wire [6:0] RETURN_CHANGE_VALUE;
wire [6:0] PRODUCT_PRICE_VALUE;

// Clock generate
always begin

   #5 CLK = ~CLK;       // 10ns or 100MHz

end

initial begin
   CLK = 1'b0;
   RST = 1'b1;
   START = 1'b0;
   CANCEL = 1'b0;
   COINS = 1'b0;
   ONLINE_PAYMENT=0;
   PRODUCT_CODE = 3'b000;
   
   // Remove reset
   #100 RST = 1'b0;
   #100 ;
   
   // PEN Dispense with online payment
   START = 1'b1;
   ONLINE_PAYMENT = 1'b1;
   #30 START = 1'b0;
   ONLINE_PAYMENT = 1'b0;
   #50;
   START = 1'b1;
   PRODUCT_CODE = 3'b001; //Notebook
   COINS = 7'd60;
   #30 START = 1'b0;
   
   #50;
   START = 1'b1;
   PRODUCT_CODE = 3'b100; //Water
   COINS = 7'd20;
   #30 START = 1'b0;
   
   #50;
   START = 1'b1;
   PRODUCT_CODE = 3'b100; //Notebook
   COINS = 7'd30;
   #30 START = 1'b0;
   
   #50 $finish;
end

// DUT - Design under TEst
VendingMachine DUT(
    .i_clk        (CLK),               // Clock Signal
    .i_rst        (RST),       // Reset Signal(Active High)
    
    .i_start      (START),             // Start Signal
    .i_cancel     (CANCEL),            // Cancel Signal
    .i_product_code (PRODUCT_CODE),      // [6:0]Product selection input signal
    .i_online_payment (ONLINE_PAYMENT),    // Online payment signal
    .i_total_coin_value (COINS),  // Total no of valid coins inserted
    
    .o_state           (STATE),             // Indicates current state
    .o_dispense_product(DISPENSE_PRODUCT),  // To dispense the product
    .o_return_change   (RETURN_CHANGE_VALUE),     // Return change value
    .o_product_price   (PRODUCT_PRICE_VALUE)      // Indicate the price of the selected product
    );
    

endmodule
