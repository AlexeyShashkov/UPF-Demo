typedef enum int unsigned
{
  S0,
  S1,
  S2,
  S3,
  S4,
  S5,
  S6,
  S7,
  S8,
  S9
} pmu_fsm_states_e;

module power_control(
  input logic clk,
  input logic reset_n,
  input logic mode,
  input logic mode_req,
  output logic iso_en,
  output logic ret_save,
  output logic ret_restore,
  output logic mode_ack,
  output logic d1_sw_disable);

pmu_fsm_states_e present_state = S0;
pmu_fsm_states_e next_state = S0;

// Present state logic.
always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    present_state <= S0;
  end else begin
    present_state <= next_state;
  end
end

// Next state logic.
always_comb begin
  // Default.
  next_state = present_state;
  case (present_state)
    S0: if (0 == mode && 1 == mode_req) next_state = S1;
    S1: if (1) next_state = S2;
    S2: if (1) next_state = S3;
    S3: if (1) next_state = S4;
    S4: if (1) next_state = S5;
    S5: if (1 == mode && 1 == mode_req) next_state = S6;
    S6: if (1) next_state = S7;
    S7: if (1) next_state = S8;
    S8: if (1) next_state = S9;
    S9: if (1) next_state = S0;
  endcase
end

logic w_iso_en;
logic w_ret_save;
logic w_ret_restore;
logic w_mode_ack;
logic w_d1_sw_disable;

// Output logic.
always_comb begin
  w_iso_en = 0;
  w_ret_save = 0;
  w_ret_restore = 0;
  w_mode_ack = 0;
  w_d1_sw_disable = 0;

  case (present_state)
    S0: begin
    end
    S1: begin
      w_iso_en = 1;
    end
    S2: begin
      w_iso_en = 1;
      w_ret_save = 1;
    end
    S3: begin
      w_iso_en = 1;
      w_d1_sw_disable = 1;
    end
    S4: begin
      w_iso_en = 1;
      w_d1_sw_disable = 1;
      w_mode_ack = 1;
    end
    S5: begin
      w_iso_en = 1;
      w_d1_sw_disable = 1;
    end
    S6: begin
      w_iso_en = 1;
    end
    S7: begin
      w_iso_en = 1;
      w_ret_restore = 1;
    end
    S8: begin
    end
    S9: begin
      w_mode_ack = 1;
    end
    default: begin
    end
  endcase
end

// Output registers.
always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    iso_en <= 0;
    ret_save <= 0;
    ret_restore <= 0;
    mode_ack <= 0;
    d1_sw_disable <= 0;
  end else begin
    iso_en <= w_iso_en;
    ret_save <= w_ret_save;
    ret_restore <= w_ret_restore;
    mode_ack <= w_mode_ack;
    d1_sw_disable <= w_d1_sw_disable;
  end
end

endmodule: power_control


module sum_acc(
  input logic clk,
  input logic reset_n,
  input logic [7:0] in,
  input logic en,
  output logic en_delay,
  output logic [7:0] out);

logic [7:0] acc;

always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    acc <= 0;
  end else if (en) begin
    acc <= acc + in;
  end
end

assign out = acc;

logic en_d;

always_ff @(posedge clk or negedge reset_n) begin
  if (!reset_n) begin
    en_d <= 0;
  end else begin
    en_d <= en;
  end
end

assign en_delay = en_d;

endmodule: sum_acc

module mux(
  input logic [7:0] in_0,
  input logic [7:0] in_1,
  input logic sel,
  output logic [7:0] out);

assign out = sel ? in_1 : in_0;

endmodule: mux

module clk_gate(
  input logic clk_in,
  input logic en_n,
  output logic clk_out);

logic en_clk;
always_latch begin
  if (~clk_in) begin
    en_clk <= ~en_n;
  end
end

assign clk_out = clk_in & en_clk;

endmodule: clk_gate


module upf_demo(
  input logic clk,
  input logic reset_n,
  input logic [7:0] in,
  input logic en,
  input logic mode,
  input logic mode_req,
  output logic mode_ack,
  output logic [7:0] out);

logic w_en_delay;
logic [7:0] w_out_0;
logic [7:0] w_out_1;
logic w_gated_clk;
logic en_1;

// Power Control Signals.
logic w_iso_en;
logic w_ret_save;
logic w_ret_restore;
logic w_d1_sw_disable;

sum_acc sum_acc_0(
  .clk(clk),
  .reset_n(reset_n),
  .in(in),
  .en(en),
  .en_delay(w_en_delay),
  .out(w_out_0));

clk_gate clk_gate_0(
  .clk_in(clk),
  .en_n(w_iso_en),
  .clk_out(w_gated_clk));

assign en_1 = w_en_delay & mode;
  
sum_acc sum_acc_1(
  .clk(w_gated_clk),
  .reset_n(reset_n),
  .in(w_out_0),
  .en(en_1),
  .en_delay(),
  .out(w_out_1));

mux mux_0(
  .in_0(w_out_0),
  .in_1(w_out_1),
  .sel(mode),
  .out(out));

power_control power_control_0(
  .clk(clk),
  .reset_n(reset_n),
  .mode(mode),
  .mode_req(mode_req),
  .iso_en(w_iso_en),
  .ret_save(w_ret_save),
  .ret_restore(w_ret_restore),
  .mode_ack(mode_ack),
  .d1_sw_disable(w_d1_sw_disable));

endmodule: upf_demo
