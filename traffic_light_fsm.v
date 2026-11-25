`timescale 1ns/1ps

module traffic_light_fsm #(
    parameter integer DURATION = 4
) (
    input  wire clk,
    input  wire rst,
    output reg  [2:0] ns_light, // {red, yellow, green}
    output reg  [2:0] ew_light  // {red, yellow, green}
);

    localparam [1:0] NS_GREEN  = 2'd0,
                     NS_YELLOW = 2'd1,
                     EW_GREEN  = 2'd2,
                     EW_YELLOW = 2'd3;

    reg [1:0] state;
    integer count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= NS_GREEN;
            count <= 0;
        end else begin
            if (count == DURATION - 1) begin
                count <= 0;
                case (state)
                    NS_GREEN:  state <= NS_YELLOW;
                    NS_YELLOW: state <= EW_GREEN;
                    EW_GREEN:  state <= EW_YELLOW;
                    EW_YELLOW: state <= NS_GREEN;
                    default:   state <= NS_GREEN;
                endcase
            end else begin
                count <= count + 1;
            end
        end
    end

    always @(*) begin
        ns_light = 3'b100;
        ew_light = 3'b100;
        case (state)
            NS_GREEN:  begin ns_light = 3'b001; ew_light = 3'b100; end
            NS_YELLOW: begin ns_light = 3'b010; ew_light = 3'b100; end
            EW_GREEN:  begin ns_light = 3'b100; ew_light = 3'b001; end
            EW_YELLOW: begin ns_light = 3'b100; ew_light = 3'b010; end
            default:   begin ns_light = 3'b100; ew_light = 3'b100; end
        endcase
    end

endmodule
