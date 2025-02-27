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
      @1
         $val2[31:0] = $rand2[3:0];
         $cnt = $reset ? 0 : (>>1$cnt + 1);
         $val1[31:0] = (>>2$out);
         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $prod[31:0] = $val1 * $val2;
         $quot[31:0] = $val1 / $val2;
      @2
         $valid = $cnt;
         $re = !$valid || $reset;
         $out[31:0] = $re ? 0 : ($op[1:0] == 0) ? $sum : ($op[1:0] == 1) ? $diff : ($op[1:0] == 2) ? $prod : $quot; 
   
   
   
   
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
