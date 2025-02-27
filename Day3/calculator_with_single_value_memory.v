\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   |calc
      @0
         $cnt = $reset ? 0 : (>>1$cnt + 1);
         $valid = $reset ? 0 : $cnt;
         $valid_or_reset = $valid || $reset;
      ?$valid_or_reset
         @1
            $val2[31:0] = $rand2[3:0];
            $val1[31:0] = (>>2$out);
            $sum[31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
            
         @2
            $recall[31:0] = (>>2$mem[31:0]);
            $out[31:0] = ($op[2:0] == 3'b000) ? $sum : ($op[2:0] == 3'b001) ? $diff : ($op[2:0] == 3'b010) ? $prod : ($op[2:0] == 3'b011) ? $quot : $recall; 
            $mem[31:0] = $reset ? 0 : ($op[2:0] == 3'b101) ? (>>2$out[31:0]) : ($op[2:0] == 3'b110) ? (>>2$mem[31:0]): $mem[31:0];
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
