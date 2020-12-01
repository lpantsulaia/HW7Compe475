
module HW7LPCode(
		input[31:0] portA,
		input[31:0] portB,
		input[1:0] op,
		input[3:0] cmd,
		output reg [31:0] out,
		output reg[3:0] flag
    );
	 
	 always @(*) begin
		if(op==0) begin // dataprocesing
			case(cmd) 
			4'b0000: out = portA&portB; //and
			4'b0001: out = portA^portB; //xor
			4'b0010: out = portA-portB; //sub
			4'b0011: out = portB-portA ; //rsb
			4'b0100: out = portA+portB; //add
			4'b1010: out = portA-portB; //cmp
			4'b1100: out = portA|portB; //oor
			default: out = 0;
			endcase
		end
		else if(op==1) begin //memory operation
			case(cmd[3]) 
				0: out = portA;
				1: out = portA+portB;
				default: out = portA+portB;
			endcase
		end
		else if(op==2) 
			out = portA+portB;
		else
			out = 0;
	 end
	 
	 always @(*) begin
		if(out[31] == 1) // for N flag
			flag[3]=1;
		else
			flag[3]=0;
		if(out == 0)   // for Z falg
			flag[2]=1;
		else
			flag[2]=0;
			
		if((cmd == 0) | (cmd==10)) begin // C and O flags for sub and cmp
			flag[1] = portA<portB ? 1 : 0;
			flag[0] = ((portA[31] != portB[31]) & (portB[31] != out[31])) ? 1 : 0;
		end
		
		else if(cmd == 3) begin // C and O flags for RSB, reverse logic to above if
			flag[1] = portA>portB ? 1 : 0;
			flag[0] = ((portA[31] == portB[31]) & (portA[31] != out[31])) ? 1 : 0;
		end
		
		else if(cmd == 4) begin
			flag[1] = ((portA>out) || (out < portB)) ? 1:0;
			flag[0] = ((portA[31] == portB[31]) & (portA[31] != out[31])) ? 1:0;
			
		end
		else begin
			flag[1] = 0;
			flag[0] = 0;
		end
		
	
	 end
	 
	


endmodule
