
module top(input clk, output D1, output D2, output D3, output D4, output D5);
   
   reg center = 0;
   reg ready = 0;
   reg [23:0]     divider;
   reg [23:0]	  gap;
   reg [3:0]      rot;
   reg [25:0]     konami;
   

   always @(posedge clk) begin


      if (ready) 
        begin
           if (divider == 12000000) 
              begin
		konami <= 0;
                divider <= 0;
                konami <= {konami + 1};
		case (konami)
		 1 : rot[2] <= 1;
		 2 : rot[2] <= 0;
		 3 : rot[2] <= 1;
		 4 : rot[2] <= 0;
		 5 : rot[0] <= 1;
		 6 : rot[0] <= 0;
		 7 : rot[0] <= 1;
		 8 : rot[0] <= 0;
		 9 : rot[1] <= 1;
		 10 : rot[1] <= 0;
		 11 : rot[3] <= 1;
		 12 : rot[3] <= 0;
		 13 : rot[1] <= 1;
		 14 : rot[1] <= 0;
		 15 : rot[3] <= 1;
		 16 : rot[3] <= 0;
		 17 : begin
			rot[1] <= 1;
			rot[3] <= 1;
		      end
		 18 : begin
			rot[1] <= 0;
			rot[3] <= 0;
		      end
		 19 : begin
			rot[2] <= 1;
			rot[0] <= 1;
		      end
		 20 : begin
			rot[2] <= 0;
			rot[0] <= 0;
		      end
		 21 : begin
			rot[0] <= 1;
			rot[1] <= 1;
			rot[2] <= 1;
			rot[3] <= 1;
		      end
		 22 : begin
			rot[0] <= 0;
			rot[1] <= 0;
			rot[2] <= 0;
			rot[3] <= 0;
		      end
		 23 : center <= 1;
		 24 : center <= 0;
		 25 : konami <= 0;
		 default : rot <= 1'b0;
		endcase
		//rot <= {rot + 1};
              end
	   else
	    begin
		divider <= {divider + 1};
	    end
           end
      else 
        begin
	   gap <= 0;
           ready <= 1;
           rot <= 1'b1;
	   center <= 1'b1;
           divider <= 0;
        end
   end
   



   assign D1 = rot[0];
   assign D2 = rot[1];
   assign D3 = rot[2];
   assign D4 = rot[3];
   assign D5 = center[0];
//   assign D5 = rot[0];
endmodule // top
