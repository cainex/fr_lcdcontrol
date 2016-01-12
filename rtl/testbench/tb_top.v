//
// Created        : Sat Jan  2 2016
// Primary Contact: Daniel Grabowski
//
// Description: 

`timescale 1ns/1ns

module tb_top();

  reg clk, reset, init_done;
  wire [3:0] sf_d;
  wire sf_ceo;
  wire [7:0] led;
  wire lcd_e, lcd_rs, lcd_rw;

  initial $display("LCD_CONTROLLER tb_top");


  initial begin
    clk <= 0;
    forever #10 clk <= ~clk;
  end

  initial begin
    reset <= 1'b0;
    #120 reset <= 1'b1;
  end

  initial begin 
    init_done <= 1'b0;
    #2000 init_done <= 1'b1;
  end

  initial begin
    #2000000 $finish;
  end

`ifdef DUMPS
  initial $display("Dumping enabled");
  initial $dumpvars;
`endif

// DUT Instance
  lcd_control lcd_control(
	      .clk(clk),
	      .reset(reset),
	      .init_done(init_done),

	      .sf_d(sf_d),
	      .sf_ceo(sf_ceo),

	      .led(led),
	      .lcd_e(lcd_e),
	      .lcd_rs(lcd_rs),
	      .lcd_rw(lcd_rw));


endmodule //tb_top
