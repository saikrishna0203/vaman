module assignment1(
     input A,
     input B,
     input C,
     input D,
 
     output reg V,
);

     reg P,Q,R,S,T,U;
     
     not (P, B);
     not (Q, C);
     and (R, B, Q);
     and (S, A, P, C);
     and (T, P, D);
     or (U, R, S);
     or (V, U, T);
     
endmodule
