module wallace(x,y,p);
input [7:0] x,y;
output [15:0] p;
wire [6:0] ip1;
wire [7:0] ip2,ip3,ip4,ip5,ip6,ip7,ip8,si,iip;
wire [6:0] s1,s2,s3,s4,s5,s6;
wire [7:0] c1,c2,c3,c4,c5,c6,c7;
wire c;
// first AND array
and fi1(p[0],y[0],x[0]);
and fi2(ip1[0],y[0],x[1]);
and fi3(ip1[1],y[0],x[2]);
and fi4(ip1[2],y[0],x[3]);
and fi5(ip1[3],y[0],x[4]);
and fi6(ip1[4],y[0],x[5]);
and fi7(ip1[5],y[0],x[6]);
and fi8(ip1[6],y[0],x[7]);
not n1(si[0],ip1[6]);

// second AND array and NOT GATES
and se1(ip2[0],y[1],x[0]);
and se2(ip2[1],y[1],x[1]);
and se3(ip2[2],y[1],x[2]);
and se4(ip2[3],y[1],x[3]);
and se5(ip2[4],y[1],x[4]);
and se6(ip2[5],y[1],x[5]);
and se7(ip2[6],y[1],x[6]);
and se8(ip2[7],y[1],x[7]);
not n2(si[1],ip2[7]);

//third

and th1(ip3[0],y[2],x[0]);
and th2(ip3[1],y[2],x[1]);
and th3(ip3[2],y[2],x[2]);
and th4(ip3[3],y[2],x[3]);
and th5(ip3[4],y[2],x[4]);
and th6(ip3[5],y[2],x[5]);
and th7(ip3[6],y[2],x[6]);
and th8(ip3[7],y[2],x[7]);
not n3(si[2],ip3[7]);

//fourth

and fo1(ip4[0],y[3],x[0]);
and fo2(ip4[1],y[3],x[1]);
and fo3(ip4[2],y[3],x[2]);
and fo4(ip4[3],y[3],x[3]);
and fo5(ip4[4],y[3],x[4]);
and fo6(ip4[5],y[3],x[5]);
and fo7(ip4[6],y[3],x[6]);
and fo8(ip4[7],y[3],x[7]);
not n4(si[3],ip4[7]);

//fifth

and fif1(ip5[0],y[4],x[0]);
and fif2(ip5[1],y[4],x[1]);
and fif3(ip5[2],y[4],x[2]);
and fif4(ip5[3],y[4],x[3]);
and fif5(ip5[4],y[4],x[4]);
and fif6(ip5[5],y[4],x[5]);
and fif7(ip5[6],y[4],x[6]);
and fif8(ip5[7],y[4],x[7]);
not n5(si[4],ip5[7]);

//sixth

and si1(ip6[0],y[5],x[0]);
and si2(ip6[1],y[5],x[1]);
and si3(ip6[2],y[5],x[2]);
and si4(ip6[3],y[5],x[3]);
and si5(ip6[4],y[5],x[4]);
and si6(ip6[5],y[5],x[5]);
and si7(ip6[6],y[5],x[6]);
and si8(ip6[7],y[5],x[7]);
not n6(si[5],ip6[7]);

//seventh

and sev1(ip7[0],y[6],x[0]);
and sev2(ip7[1],y[6],x[1]);
and sev3(ip7[2],y[6],x[2]);
and sev4(ip7[3],y[6],x[3]);
and sev5(ip7[4],y[6],x[4]);
and sev6(ip7[5],y[6],x[5]);
and sev7(ip7[6],y[6],x[6]);
and sev8(ip7[7],y[6],x[7]);
not n7(si[6],ip7[7]);

//eight

and eii1(iip[0],y[7],x[0]);
and eii2(iip[1],y[7],x[1]);
and eii3(iip[2],y[7],x[2]);
and eii4(iip[3],y[7],x[3]);
and eii5(iip[4],y[7],x[4]);
and eii6(iip[5],y[7],x[5]);
and eii7(iip[6],y[7],x[6]);
and eii8(iip[7],y[7],x[7]);

xor ei1(ip8[0],y[7],iip[0]);
xor ei2(ip8[1],y[7],iip[1]);
xor ei3(ip8[2],y[7],iip[2]);
xor ei4(ip8[3],y[7],iip[3]);
xor ei5(ip8[4],y[7],iip[4]);
xor ei6(ip8[5],y[7],iip[5]);
xor ei7(ip8[6],y[7],iip[6]);
xor ei8(ip8[7],y[7],iip[7]);
not n8(si[7],ip8[7]);


//first adder array
HA ha1(ip1[0],ip2[0],c1[0],p[1]);
FA fa1(ip1[1],ip2[1],ip3[0],c1[1],s1[0]);
FA fa2(ip1[2],ip2[2],ip3[1],c1[2],s1[1]);
FA fa3(ip1[3],ip2[3],ip3[2],c1[3],s1[2]);
FA fa4(ip1[4],ip2[4],ip3[3],c1[4],s1[3]);
FA fa5(ip1[5],ip2[5],ip3[4],c1[5],s1[4]);
FA fa6(ip1[6],ip2[6],ip3[5],c1[6],s1[5]);
FA fa7(si[0],si[1],ip3[6],c1[7],s1[6]);

//second adder array
HA ha2(s1[0],c1[0],c2[0],p[2]);
FA sa1(s1[1],c1[1],ip4[0],c2[1],s2[0]);
FA sa2(s1[2],c1[2],ip4[1],c2[2],s2[1]);
FA sa3(s1[3],c1[3],ip4[2],c2[3],s2[2]);
FA sa4(s1[4],c1[4],ip4[3],c2[4],s2[3]);
FA sa5(s1[5],c1[5],ip4[4],c2[5],s2[4]);
FA sa6(s1[6],c1[6],ip4[5],c2[6],s2[5]);
FA sa7(si[2],c1[7],ip4[6],c2[7],s2[6]);

//third adder

HA ha3(s2[0],c2[0],c3[0],p[3]);
FA ta1(s2[1],ip5[0],c2[1],c3[1],s3[0]);
FA ta2(s2[2],ip5[1],c2[2],c3[2],s3[1]);
FA ta3(s2[3],ip5[2],c2[3],c3[3],s3[2]);
FA ta4(s2[4],ip5[3],c2[4],c3[4],s3[3]);
FA ta5(s2[5],ip5[4],c2[5],c3[5],s3[4]);
FA ta6(s2[6],ip5[5],c2[6],c3[6],s3[5]);
FA ta7(si[3],ip5[6],c2[7],c3[7],s3[6]);

//fourth adder

HA ha4(s3[0],c3[0],c4[0],p[4]);
FA foa1(s3[1],ip6[0],c3[1],c4[1],s4[0]);
FA foa2(s3[2],ip6[1],c3[2],c4[2],s4[1]);
FA foa3(s3[3],ip6[2],c3[3],c4[3],s4[2]);
FA foa4(s3[4],ip6[3],c3[4],c4[4],s4[3]);
FA foa5(s3[5],ip6[4],c3[5],c4[5],s4[4]);
FA foa6(s3[6],ip6[5],c3[6],c4[6],s4[5]);
FA foa7(si[4],ip6[6],c3[7],c4[7],s4[6]);

//fifth adder

HA ha5(s4[0],c4[0],c5[0],p[5]);
FA fia1(s4[1],ip7[0],c4[1],c5[1],s5[0]);
FA fia2(s4[2],ip7[1],c4[2],c5[2],s5[1]);
FA fia3(s4[3],ip7[2],c4[3],c5[3],s5[2]);
FA fia4(s4[4],ip7[3],c4[4],c5[4],s5[3]);
FA fia5(s4[5],ip7[4],c4[5],c5[5],s5[4]);
FA fia6(s4[6],ip7[5],c4[6],c5[6],s5[5]);
FA fia7(si[5],ip7[6],c4[7],c5[7],s5[6]);

//sixth adder


HA ha6(s5[0],c5[0],c6[0],p[6]);
FA sia1(s5[1],ip8[0],c5[1],c6[1],s6[0]);
FA sia2(s5[2],ip8[1],c5[2],c6[2],s6[1]);
FA sia3(s5[3],ip8[2],c5[3],c6[3],s6[2]);
FA sia4(s5[4],ip8[3],c5[4],c6[4],s6[3]);
FA sia5(s5[5],ip8[4],c5[5],c6[5],s6[4]);
FA sia6(s5[6],ip8[5],c5[6],c6[6],s6[5]);
FA sia7(si[6],ip8[6],c5[7],c6[7],s6[6]);

//seventh adder


FAd sea0(s6[0],c6[0],y[7],c7[0],p[7]);
FAd sea1(s6[1],c6[1],c7[0],c7[1],p[8]);
FAd sea2(s6[2],c6[2],c7[1],c7[2],p[9]);
FAd sea3(s6[3],c6[3],c7[2],c7[3],p[10]);
FAd sea4(s6[4],c6[4],c7[3],c7[4],p[11]);
FAd sea5(s6[5],c6[5],c7[4],c7[5],p[12]);
FAd sea6(s6[6],c6[6],c7[5],c7[6],p[13]);
FAd sea7(si[7],c6[7],c7[6],c7[7],p[14]);
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
wire x,y;
xor x1(x,a,b);
xnor x2(y,a,b);
MUX m1(x,y,c,sm);
MUX m2(a,c,x,cy);

endmodule

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
wire x,y,z;
xor x1(x,a,b);
xor x2(sm,x,c);
and a1(y,a,b);
and a2(z,x,c);
or o1(cy,y,z);
endmodule

