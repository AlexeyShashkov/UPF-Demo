module tb();

import UPF::*;

logic clk, reset_n, en, mode, mode_req, mode_ack;
logic [7:0] in;
logic [7:0] out;

upf_demo dut(
  .clk(clk),
  .reset_n(reset_n),
  .in(in),
  .en(en),
  .mode(mode),
  .mode_req(mode_req),
  .mode_ack(mode_ack),
  .out(out));

always begin
 #20 clk = ~clk;
end

initial begin
  clk = 0;
  reset_n = 1;
  in = 0;
  en = 0;
  mode = 1;
  mode_req = 0;

  assert(supply_on("/tb/dut/VDD_1", 1.0));
  assert(supply_on("/tb/dut/VDD_2", 2.0));
  assert(supply_on("/tb/dut/GND", 0.0));
  $display("VDD_1 voltage = %f", get_supply_voltage(get_supply_value("/tb/dut/VDD_1")));
  $display("VDD_2 voltage = %f", get_supply_voltage(get_supply_value("/tb/dut/VDD_2")));
  $display("GND voltage = %f", get_supply_voltage(get_supply_value("/tb/dut/GND")));

  reset_n = 0;
  @(posedge clk);
  reset_n = 1;

  @(posedge clk);
  en = 1;
  in = 1;
  @(posedge clk);
  in = 2;
  @(posedge clk);
  en = 0;

  @(posedge clk);

  mode = 0;
  mode_req = 1;
  @(posedge clk);
  mode_req = 0;

  @(1 == mode_ack);

  @(posedge clk);
  en = 1;
  in = 1;
  @(posedge clk);
  in = 2;
  @(posedge clk);
  en = 0;

  repeat(2) @(posedge clk);

  mode = 1;
  mode_req = 1;
  @(posedge clk);
  mode_req = 0;

end

endmodule: tb
