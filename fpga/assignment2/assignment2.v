module assignment2(
     input A,
     input B,
     input C,
     input D,
 
     output reg X,
);

     reg P,Q,R,S,T,U,V,W;
     
     not (P, A);
     not (Q, B);
     not (R, C);
     not (S, D);
     and (T, Q, S);
     and (U, P, B, C);
     and (V, R, S);
     or (W, T, U);
     or (X, W, V);
     
endmodule
