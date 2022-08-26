module wallace(x,y,p);
input [7:0] x,y;
  
output [15:0] p;

wire [6:0] ip0,ip1,ip2,ip3,ip4,ip5,ip6,ip7;
wire [7:0] si,iip;
wire [6:0] s1,s2,s3,s4,s5,s6;
wire [7:0] c1,c2,c3,c4,c5,c6,c7;
wire c;
  
// first AND array
and_array aa1(y[0], x, {ip0[5:0],p[0]}, si[0]);
not nsi0(ip0[6],si[0]);

// second AND array and NOT GATES
and_array aa2(y[1], x, ip1, si[1]);

//third
and_array aa3(y[2], x, ip2, si[2]);

//fourth
and_array aa4(y[3], x, ip3, si[3]);

//fifth
and_array aa5(y[4], x, ip4, si[4]);

//sixth
and_array aa6(y[5], x, ip5, si[5]);

//seventh
and_array aa7(y[6], x, ip6, si[6]);

//eight
wire niip7;
and_array aa8(y[7], x, iip[6:0], niip7);
not neii8(iip[7], niip7);

xor ei1(ip7[0],y[7],iip[0]);
xor ei2(ip7[1],y[7],iip[1]);
xor ei3(ip7[2],y[7],iip[2]);
xor ei4(ip7[3],y[7],iip[3]);
xor ei5(ip7[4],y[7],iip[4]);
xor ei6(ip7[5],y[7],iip[5]);
xor ei7(ip7[6],y[7],iip[6]);
xnor ei8(si[7],y[7],iip[7]);

  
//first adder array
adder_array ada1(si[0], ip0, {si[1],ip1}, ip2, s1, c1, p[1]);

//second adder array
adder_array ada2(si[2], s1, c1, ip3, s2, c2, p[2]);

//third adder
adder_array ada3(si[3], s2, c2, ip4, s3, c3, p[3]);

//fourth adder
adder_array ada4(si[4], s3, c3, ip5, s4, c4, p[4]);

//fifth adder
adder_array ada5(si[5], s4, c4, ip6, s5, c5, p[5]);

//sixth adder
adder_array ada6(si[6], s5, c5, ip7, s6, c6, p[6]);

  
//seventh adder
FA sea0(s6[0],c6[0],y[7],c7[0],p[7]);
FA sea1(s6[1],c6[1],c7[0],c7[1],p[8]);
FA sea2(s6[2],c6[2],c7[1],c7[2],p[9]);
FA sea3(s6[3],c6[3],c7[2],c7[3],p[10]);
FA sea4(s6[4],c6[4],c7[3],c7[4],p[11]);
FA sea5(s6[5],c6[5],c7[4],c7[5],p[12]);
FA sea6(s6[6],c6[6],c7[5],c7[6],p[13]);
FA sea7(si[7],c6[7],c7[6],c7[7],p[14]);
HA ha8(c7[7],1'b1,c,p[15]);

endmodule

module HA(a,b,c,s);
input a,b;
  
output c,s;
  
xor x1(s,a,b);
and a1(c,a,b);
endmodule

module FA(a,b,c,cy,sm);
input a,b,c;
  
output cy,sm;
  
wire x,y,z;
  
xor x1(x,a,b);
xor x2(sm,x,c);
and a1(y,a,b);
and a2(z,x,c);
or o1(cy,y,z);
endmodule

module and_array(y, x, ip, si);
input y;
input [7:0] x;
  
output [6:0] ip;
output si;
  
and se1(ip[0],y,x[0]);
and se2(ip[1],y,x[1]);
and se3(ip[2],y,x[2]);
and se4(ip[3],y,x[3]);
and se5(ip[4],y,x[4]);
and se6(ip[5],y,x[5]);
and se7(ip[6],y,x[6]);
nand se8(si,  y,x[7]);
endmodule

module adder_array(si, s1, c1, ip, s2, c2, p);
input si;
input [6:0] s1;
input [7:0] c1;
input [6:0] ip;

output [6:0] s2;
output [7:0] c2;
output p;

HA ha1(s1[0],c1[0],      c2[0],p);
FA ta1(s1[1],c1[1],ip[0],c2[1],s2[0]);
FA ta2(s1[2],c1[2],ip[1],c2[2],s2[1]);
FA ta3(s1[3],c1[3],ip[2],c2[3],s2[2]);
FA ta4(s1[4],c1[4],ip[3],c2[4],s2[3]);
FA ta5(s1[5],c1[5],ip[4],c2[5],s2[4]);
FA ta6(s1[6],c1[6],ip[5],c2[6],s2[5]);
FA ta7(si,   c1[7],ip[6],c2[7],s2[6]);
endmodule

/*
module MUX(i0,i1,s,o);
input i0,i1,s;
output o;
wire t,p,q;
and a1(t,s,i1);
not n0(p,s);
and a2(q,p,i0);
or a3(o,t,q);
endmodule

module FAd(a,b,c,cy,sm);  
input a,b,c;
output cy,sm;
wire x,y;
xor x1(x,a,b);
xnor x2(y,a,b);
MUX m1(x,y,c,sm);
MUX m2(a,c,x,cy);
endmodule
*/
