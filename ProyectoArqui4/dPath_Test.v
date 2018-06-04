module dpathTest;
    //Tried to do precharge of memory later did with precharge inside the ram.
    reg precharge = 0;
    reg clk = 0;
    reg finish  = 0;

	DataPath dPath(clk,precharge,finish);

	initial #4500 begin
		finish = 1;
		#2 finish = 0;
		#2 $finish;
	end
	
    //Clock Loop
	initial begin
		
		repeat (500) begin
			#10 clk = ~clk;
			// $display("Clock: %d", clk);
		end
	end
		
	initial begin
		#4 precharge = 1;
		#8 precharge = 0;
	end
	
endmodule