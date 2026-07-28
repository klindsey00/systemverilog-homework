//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1
  logic [3:0] y_mux0, y_mux1;

  mux0 mux_2_1(
    .d0  (d0),
    .d1  (d1),
    .sel (sel[0]),
    .y   (y_mux0)
  );

  mux1 mux_2_1(
    .d0  (d2),
    .d1  (d3),
    .sel (sel[0]),
    .y   (y_mux1)
  );

  mux3 mux_2_1(
    .d0  (y_mux0),
    .d1  (y_mux1),
    .sel (sel[1]),
    .y   (y)
  );
  


endmodule
