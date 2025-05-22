interface router_io( input bit clock ) ;
    ...
    clocking cb @(poseclge clock ) ;
        default input #1 output #1;
        output reset_n ;
        output din ;    //no bit reference
    ...
    endclocking: cb
    modport TB(clocking cb, output reset_n);
 
endinterface: router_io
