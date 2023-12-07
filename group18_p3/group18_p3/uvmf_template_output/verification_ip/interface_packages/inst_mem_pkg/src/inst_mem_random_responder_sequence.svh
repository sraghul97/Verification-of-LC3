class inst_mem_random_responder_sequence extends inst_mem_responder_sequence;
    `uvm_object_utils(inst_mem_random_responder_sequence)

    function new(string name = "inst_mem_random_responder_sequence");
        super.new(name);
    endfunction

   typedef bit [15 : 0] bit_t;

    bit_t memory[bit_t];

    virtual function void initialize();
        int init_address = 16'h3008;

        memory[16'h3000] = 16'hE000; 
        memory[16'h3001] = 16'hE200; 
        memory[16'h3002] = 16'hE400; 
        memory[16'h3003] = 16'hE600; 
        memory[16'h3004] = 16'hE800; 
        memory[16'h3005] = 16'hEA00; 
        memory[16'h3006] = 16'hEC00; 
        memory[16'h3007] = 16'hEE00; 

        for(int fd=0; fd<8; fd++)
        begin
          for(int de=0; de<8; de++)
          begin
            for(int k=0; k<32; k++)
            begin
              memory[init_address][15:12] = 4'b0001; 
              memory[init_address][11:9] = fd;
              memory[init_address][8:6] = de;
              memory[init_address][5] = 1'b1;
              memory[init_address][4:0] = k; 
              init_address++;
            end
          end
        end

        for(int fd=0; fd<8; fd++)
        begin
          for(int de=0; de<8; de++)
          begin
            for(int k=0; k<8; k++)
            begin
              memory[init_address][15:12] = 4'b0001; 
              memory[init_address][11:9] = fd;
              memory[init_address][8:6] = de;
              memory[init_address][5:3] = 3'b000;
              memory[init_address][2:0] = k; 
              init_address++;
            end
          end
        end

        for(int fd=0; fd<8; fd++)
	begin
          for(int de=0; de<8; de++)
	  begin
            for(int k=0; k<32; k++)
	    begin
              memory[init_address][15:12] = 4'b0101;                     
              memory[init_address][11:9] = fd;
              memory[init_address][8:6] = de;
              memory[init_address][5] = 1'b1;
              memory[init_address][4:0] = k; 
              init_address++;
            end
          end
        end

        for(int fd=0; fd<8; fd++)begin
          for(int de=0; de<8; de++)begin
            for(int k=0; k<8; k++)begin
              memory[init_address][15:12] = 4'b0101; 
              memory[init_address][11:9] = fd;
              memory[init_address][8:6] = de;
              memory[init_address][5:3] = 3'b000;
              memory[init_address][2:0] = k; 
              init_address++;
            end
          end
        end

        for(int fd=0; fd<8; fd++)begin
          for(int de=0; de<8; de++)begin
            memory[init_address][15:12] = 4'b1001; 
            memory[init_address][11:9] = fd;
            memory[init_address][8:6] = de;
            memory[init_address][5:0] = 6'b111111;
            init_address++;
          end
        end
    endfunction

    virtual task body();
      bit[15:0] tmp = 16'h3000;
      req = inst_mem_transaction::type_id::create("req");
      initialize();

      forever begin
        start_item(req);
        finish_item(req);
        if(memory.exists(tmp))begin
          req.instr_dout = memory[tmp];
          tmp++;
        end else begin
          req.instr_dout = memory[16'h3008];
        end
      end
    endtask

endclass
