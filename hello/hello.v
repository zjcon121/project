// hello.v
module hello;
  initial begin
    $display("Hello, VCS!");  // 打印消息
    $finish;                  // 结束仿真
  end
endmodule
