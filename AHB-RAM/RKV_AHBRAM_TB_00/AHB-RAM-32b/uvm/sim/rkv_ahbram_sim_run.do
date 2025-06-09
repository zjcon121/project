# 创建本地库
vlib ./work
# 将逻辑库名映射库路径
vmap work ./work
# 编译verilog源代码
vlog -work work ./design/*.v
# 启动仿真器
vsim -voptargs=+acc work.design_tb
# 添加波形
add wave design_tb/*
# 执行仿真
run 1us
