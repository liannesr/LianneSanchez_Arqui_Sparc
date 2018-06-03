/* Data Path
   Programmed by: Lianne Sánchez Rodríguez
   Phase 4 
   Professor: Nestor Rodríguez 
*/
module DataPath(input clk, finish, memprecharge );
    
    reg clr;
    //CONTROL UNIT
    reg [5:0] op_out;
    reg [1:0] selectB;
    reg[1:0] selectD;
    // ALU INPUTS AND OUTPUTS
    wire [31:0] alu_out;
    wire N_flag;
    wire Z_flag;
    wire C_flag;
    wire V_flag;
    reg [3:0] flag_out;
    //SIGN EXTENDER OUTPUT
    wire [31:0] signExt_out;
    //MUX A
    wire [31:0] muxA_out;
    //MUX B
    wire [31:0] muxB_out;
    //MUX C
    wire [5:0] muxC_out;
    //MUX D
    wire [31:0] muxD_out;
    //MUX E
    wire [31:0] muxE_out;
    //MUX F
    wire [31:0] muxF_out;
    //MUX G
    wire [4:0] muxG_out;
    //MUX F
    wire [31:0] muxH_out;
    //MUX I
    wire [31:0] muxI_out;
    //FLAG REGISTER
    wire [3:0] fr_out;
    reg frN_out, frC_out, frV_out, frZ_out;
    //PROGRAM COUNTER
    wire [31:0] pc_out;
    //NEXT PROGRAM COUNTER
    wire [31:0] npc_out;
    //CONDITION CHECKER
    wire cc_out;
    wire a_out;
    //DATA TYPE BOX
    wire [1:0] dataType_out;
    wire sign_out;
    //REGISTER FILE
    wire [31:0] AR_out;
    wire [31:0] BR_out;
    //MAR
    wire [31:0] mar_out;
    //MDR
    wire [31:0] mdr_out;
    //IR
    wire [31:0] ir_out;
    //RAM
    wire moc_out;
    wire [31:0] data_out;
    //CONTROL UNIT
    wire [4:0] present_state; 
    wire cin_out, enable, frld_out,muxh_out,muxi_out, muxg_out, muxf_out, muxe_out, muxd0_out, muxd1_out, muxc_out,
    muxb1_out, muxb0_out, muxa_out, rfld_out, npcld_out, pcld_out, irld_out, marld_out, mdrld_out,
    rw_out, mov_out, enable_out, op5_out, op4_out, op3_out, op2_out, op1_out, op0_out;

    //CONECTION OF MODULES

    ir ir(ir_out, data_out, irld_out, clk);
    pc pc(pc_out, muxE_out, pcld_out, clk);
  
    fr fr(fr_out, flag_out, frld_out, clk);
    conditionChecker cc(cc_out, a_out, ir_out[29:25], N_flag, Z_flag, V_flag, C_flag);
    dataType dataType(dataType_out, sign_out, ir_out[24:19],cu.mux4to1_5_output);
    signExtender signex(signExt_out, ir_out[12:0]);
    mux2To1_31 muxA(muxA_out, data_out, alu_out, muxa_out);
    mux2To1_31 muxE(muxE_out, alu_out, npc_out, muxe_out);
    mux2To1_31 muxF(muxF_out, AR_out, ir_out, muxf_out);
    mux2To1_6 muxC(muxC_out, op_out, ir_out[24:19], muxc_out);
    mux2To1_5 muxG(muxG_out, ir_out[29:25], 5'b01111, muxg_out);
    mux4To1_31 muxB(muxB_out, BR_out, signExt_out, mdr_out, muxD_out, selectB);
    mux4To1_31 muxD(muxD_out, pc_out, npc_out, 32'd0, 32'd0, selectD);//change
    mux2To1_31 muxH(muxH_out, alu_out, pc_out, muxh_out);
    mux2To1_31 muxI(muxI_out, data_out, alu_out, muxi_out);
    ALU alu(alu_out, N_flag, Z_flag,V_flag,C_flag, muxF_out, muxB_out, muxC_out, cin_out);
    npc npc(npc_out, alu_out, npcld_out, clk);
    ram ram(data_out, moc_out, rw_out, mov_out, sign_out,1'b1, dataType_out, mdr_out, mar_out, memprecharge);
    mar mar(mar_out, muxH_out, marld_out, clk);
    mdr mdr(mdr_out, muxA_out, mdrld_out, clk);
    registerFile rf(AR_out, BR_out, muxG_out, alu_out, ir_out[18:14], ir_out[4:0], rfld_out, clk);
    controlUnit cu(present_state, mov_out, rw_out, marld_out, mdrld_out, irld_out, pcld_out, npcld_out, rfld_out,frld_out, cin_out,
        muxa_out, muxb0_out, muxb1_out, muxc_out, muxd0_out, muxd1_out, muxe_out, muxf_out, muxg_out, muxh_out,muxi_out, op5_out,
        op4_out, op3_out, op2_out, op1_out, op0_out,moc_out, clr, 1'b1, cc_out, clk, frN_out, frZ_out, frC_out, frV_out, ir_out);
    


    always @ (*) begin

        op_out[5] <= op5_out; op_out[4] <= op4_out; op_out[3] <= op3_out; 
        op_out[2] <= op2_out; op_out[1] <= op1_out; op_out[0] <= op0_out;
        flag_out[3] <= N_flag; 
        flag_out[2] <= Z_flag;
        flag_out[1] <= V_flag;
        flag_out[0] <= C_flag;
        frN_out <= fr_out[3];
        frZ_out <= fr_out[2];
        frV_out <= fr_out[1];
        frC_out <= fr_out[0];
        selectB[1] <= muxb1_out;
        selectB[0] <= muxb0_out;
        selectD[1] <= muxd1_out;
        selectD[0] <= muxd0_out;

    end

    //always @(posedge clk) begin
    always @(cu.mux4to1_5_output)begin 
        //$monitor("State:%d \t MAR_en:%b MAR_out:%d \t Memory_data_out:%b \t IR_en:%b \t IR_Out:%b \t MOV:%b \t MOC:%b \t R/W:%b\n", cu.mux4to1_5_output, marld_out, mar_out,data_out, irld_out,ir_out, mov_out,moc_out, rw_out);
        //$monitor("MAR_en:%b \t Memory_data_out:%b \t IR_en:%b \t IR_Out:%b \t MOV:%b \t MOC:%b \t R/W:%b\n", marld_out, data_out, irld_out,ir_out, mov_out,moc_out, rw_out);
        //$display("Memory out: %b", data_out);
        $display("state:%d PC:%d MAR:%d NPC:%d alu_out %d",  cu.mux4to1_5_output,pc_out, mar_out, npc_out, alu_out);

          // $monitor("MAR: %d IR_Out: %b , %b Data_out: %b",  mar_out, ir_out, irld_out, data_out);
          // $display("IR OUT: %b", ir_out);
           //$display("PC: %d", pc_out);
          // $display("NPC: %d", npc_out);
   // $display("ALU NETRANCES A: %b",muxF_out);
    //$display("%d %d:%b,  %d:%b, %d:%b", $time, mar_out,marld_out, pc_out,pcld_out, npc_out, npcld_out );
    //$display("PC %d", pc_out);
    //$display("nPC %d", npc_out);
   // $monitor("Time: %d MAR: %d", $time, mar_out);
    //$monitor("ENtrance MAR %d", muxH_out);
   // $display("ENtrance 0: %d, Entrance 1: %d", alu_out, pc_out);
  // $display("RAM: %b", data_out);
    //$display("ALU IN A: %b, ALU IN B: %b", muxF_out, muxB_out);
    //$display("ALU out %b", alu_out);
    //$display("muxD_out %b", muxD_out);
   // $display("muxC_out %b", muxC_out);
   // $display("muxB_out %b", muxB_out);
   // $display("PC entrance %b", muxD_out);
   // $display("sign: %b",signExt_out);
    //$display("IR : %b", ir_out);
    //$display("Data_out %b", data_out);
    //$display("RW: %b", rw_out);
    end
endmodule // DPath

