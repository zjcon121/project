module router(
reset n, clock, frame_n,valid_n, din, dout, busy_n, valido_n, frameo_n);

input reset_n，clock;

input [15:0]din,frame_n,valid_n;

output [15:0]dout,valido_n,busy_n,frameo_n;

