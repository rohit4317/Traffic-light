`timescale 1ns/1ps

module tb_traffic_light_fsm;
    reg clk, rst;
    wire [2:0] ns_light, ew_light;

    traffic_light_fsm #(.DURATION(2)) dut (
        .clk(clk), .rst(rst),
        .ns_light(ns_light), .ew_light(ew_light)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #12 rst = 0;

        repeat (12) begin
            @(posedge clk);
            #1;
            $display("time=%0t NS={R,Y,G}:%b EW={R,Y,G}:%b",
                     $time, ns_light, ew_light);
        end

        $finish;
    end
endmodule
