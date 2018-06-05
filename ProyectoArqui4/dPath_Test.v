module dpathTest;

    reg clk = 0;
    reg finish  = 0;

	DataPath dPath(clk,finish);
	

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

	
endmodule