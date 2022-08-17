module hybrid(x,y,p);
input [7:0] x,y;
output [15:0] p;
wire [7:0] i,j,k,l,n,o,q,r;
wire [9:0] fp,sp,tp,fop;
wire [3:0] one,two,sign;
wire [6:0] c0,ip0;
wire [12:0] c1,ip1;
wire [6:0] c2;
wire [11:0] m;
wire [3:0] cry,z;
// carry generation

// module code(one,two,sign,y2,y1,y0);
code I6(one[0],two[0],sign[0],y[1],y[0],1'b0);
code I7(one[1],two[1],sign[1],y[3],y[2],y[1]);
code I8(one[2],two[2],sign[2],y[5],y[4],y[3]);
code I9(one[3],two[3],sign[3],y[7],y[6],y[5]);
  
// 1st
xor I0(z[0],one[0],two[0]);
and I1(cry[0],z[0],sign[0]);
//2nd
xor I2(z[1],one[1],two[1]);
and I3(cry[1],z[1],sign[1]);
//3rd
xor I4(z[2],one[2],two[2]);
and I5(cry[2],z[2],sign[2]);
//4th
xor I11(z[3],one[3],two[3]); // cadence I10'a izin vermedi garip bir sekilde
and I12(cry[3],z[3],sign[3]);

//first product generation
  
// module product(x1,x0,x2,one,two,sign,p,i,ca);
product I15(x[0],sign[0],cry[0],one[0],two[0],sign[0],fp[0],i[0],n[0]);
product I16(x[1],i[0],n[0],one[0],two[0],sign[0],fp[1],i[1],n[1]);
product I17(x[2],i[1],n[1],one[0],two[0],sign[0],fp[2],i[2],n[2]);
product I18(x[3],i[2],n[2],one[0],two[0],sign[0],fp[3],i[3],n[3]);
product I19(x[4],i[3],n[3],one[0],two[0],sign[0],fp[4],i[4],n[4]);
product I20(x[5],i[4],n[4],one[0],two[0],sign[0],fp[5],i[5],n[5]);
product I21(x[6],i[5],n[5],one[0],two[0],sign[0],fp[6],i[6],n[6]);
product I22(x[7],i[6],n[6],one[0],two[0],sign[0],fp[7],i[7],n[7]);
xor I23(m[0],i[7],n[7]);
and I24(m[1],two[0],i[7]);
and I25(m[2],one[0],m[0]);
or I26(fp[8],m[1],m[2]);
not I27(fp[9],fp[8]);
assign p[0]=fp[0];
assign p[1]=fp[1];

//second product generation
// module product(x1,x0,x2,one,two,sign,p,i,ca);
product I28(x[0],sign[1],cry[1],one[1],two[1],sign[1],sp[0],j[0],o[0]);
product I29(x[1],j[0],o[0],one[1],two[1],sign[1],sp[1],j[1],o[1]);
product I30(x[2],j[1],o[1],one[1],two[1],sign[1],sp[2],j[2],o[2]);
product I31(x[3],j[2],o[2],one[1],two[1],sign[1],sp[3],j[3],o[3]);
product I32(x[4],j[3],o[3],one[1],two[1],sign[1],sp[4],j[4],o[4]);
product I33(x[5],j[4],o[4],one[1],two[1],sign[1],sp[5],j[5],o[5]);
product I34(x[6],j[5],o[5],one[1],two[1],sign[1],sp[6],j[6],o[6]);
product I35(x[7],j[6],o[6],one[1],two[1],sign[1],sp[7],j[7],o[7]);
xor I36(m[3],j[7],o[7]);
and I37(m[4],two[1],j[7]);
and I38(m[5],one[1],m[3]);
or I39(sp[8],m[4],m[5]);
not I40(sp[9],sp[8]);

//third product
product r0(x[0],sign[2],cry[2],one[2],two[2],sign[2],tp[0],k[0],q[0]);
product r1(x[1],k[0],q[0],one[2],two[2],sign[2],tp[1],k[1],q[1]);
product r2(x[2],k[1],q[1],one[2],two[2],sign[2],tp[2],k[2],q[2]);
product r3(x[3],k[2],q[2],one[2],two[2],sign[2],tp[3],k[3],q[3]);
product r4(x[4],k[3],q[3],one[2],two[2],sign[2],tp[4],k[4],q[4]);
product r5(x[5],k[4],q[4],one[2],two[2],sign[2],tp[5],k[5],q[5]);
product r6(x[6],k[5],q[5],one[2],two[2],sign[2],tp[6],k[6],q[6]);
product r7(x[7],k[6],q[6],one[2],two[2],sign[2],tp[7],k[7],q[7]);
xor x3(m[6],k[7],q[7]);
and a5(m[7],two[2],k[7]);
and a6(m[8],one[2],m[6]);
or o3(tp[8],m[7],m[8]);
not n3(tp[9],tp[8]);

//fourth product
product s0(x[0],sign[3],cry[3],one[3],two[3],sign[3],fop[0],l[0],r[0]);
product s1(x[1],l[0],r[0],one[3],two[3],sign[3],fop[1],l[1],r[1]);
product s2(x[2],l[1],r[1],one[3],two[3],sign[3],fop[2],l[2],r[2]);
product s3(x[3],l[2],r[2],one[3],two[3],sign[3],fop[3],l[3],r[3]);
product s4(x[4],l[3],r[3],one[3],two[3],sign[3],fop[4],l[4],r[4]);
product s5(x[5],l[4],r[4],one[3],two[3],sign[3],fop[5],l[5],r[5]);
product s6(x[6],l[5],r[5],one[3],two[3],sign[3],fop[6],l[6],r[6]);
product s7(x[7],l[6],r[6],one[3],two[3],sign[3],fop[7],l[7],r[7]);
xor x4(m[9],l[7],r[7]);
and a7(m[10],two[3],l[7]);
and a8(m[11],one[3],m[9]);
or o4(fop[8],m[10],m[11]);
not n4(fop[9],fop[8]);

//addition
// 1st lvl add
HAd h1(fp[2],sp[0],c1[0],ip1[0]);
HAd h30(fp[3],sp[1],c1[1],ip1[1]);
FAd h2(fp[4],sp[2],tp[0],c1[2],ip1[2]);
FAd h3(fp[5],sp[3],tp[1],c1[3],ip1[3]);
FAd h4(fp[6],sp[4],tp[2],c0[0],ip0[0]);
FAd h5(fp[7],sp[5],tp[3],c0[1],ip0[1]);
FAd h6(fp[8],sp[6],tp[4],c0[2],ip0[2]);
FAd h7(fp[8],sp[7],tp[5],c0[3],ip0[3]);
FAd h8(fp[8],sp[8],tp[6],c0[4],ip0[4]);
FAd h9(fp[9],sp[9],tp[7],c0[5],ip0[5]);
FAd h10(fop[6],tp[8],1'b1,c0[6],ip0[6]);
assign p[2]=ip1[0];

// 2nd lvl add
HAd h11(fop[0],ip0[0],c1[4],ip1[4]);
FAd h12(fop[1],ip0[1],c0[0],c1[5],ip1[5]);
FAd h13(fop[2],ip0[2],c0[1],c1[6],ip1[6]);
FAd h14(fop[3],ip0[3],c0[2],c1[7],ip1[7]);
FAd h15(fop[4],ip0[4],c0[3],c1[8],ip1[8]);
FAd h16(fop[5],ip0[5],c0[4],c1[9],ip1[9]);
HAd h17(ip0[6],c0[5],c1[10],ip1[10]);
FAd h18(fop[7],tp[9],c0[6],c1[11],ip1[11]);
HAd h19(fop[8],1'b1,c1[12],ip1[12]);

//3th add
cla cla1(p[6:3],c2[0],1'b0,ip1[4:1],c1[3:0]);
cla cla2(p[10:7],c2[1],c2[0],ip1[8:5],c1[7:4]);
cla cla3(p[14:11],c2[2],c2[1],ip1[12:9],c1[11:8]);

FA sa16(c1[12],fop[9],c2[2],c2[3],p[15]);
endmodule



// generation of codes

module code(one,two,sign,y2,y1,y0);
input y2,y1,y0;
output one,two,sign;
wire [1:0]k;
xor I0(one,y0,y1);
xor I1(k[1],y2,y1);
not I2(k[0],one);
and I3(two,k[0],k[1]);

// assign buffer icin iki not?
// ya da sign'i inputOutput secince duzeliyor
assign sign=y2;
endmodule



//generation of inner products

module product(x1,x0,x2,one,two,sign,p,i,ca);
input x1,x0,x2,sign,one,two;
output p,i,ca;
wire [2:0] k;
xor I0(i,x1,sign);
and I1(k[1],i,one);
and I2(k[0],x0,two);
or I3(k[2],k[1],k[0]);
xor I4(p,k[2],x2);
and I5(ca,k[2],x2);
endmodule



//adders design
module HAd(a,b,c,s);
input a,b;
output c,s;
xor I0(s,a,b);
and I1(c,a,b);
endmodule

module MUX(i0,i1,s,o);
input i0,i1,s;
output o;
wire t,p,q;
and I0(t,s,i1);
not I1(p,s);
and I2(q,p,i0);
or I3(o,t,q);
endmodule

module FAd(a,b,c,cy,sm);
input a,b,c;
output cy,sm;
wire x,y;
xor I0(x,a,b);

// xnor'u ayrica cizebiliriz, bakmak lazim
//xnor x2(y,a,b);
wire z;
xor I1(z,a,b);
not I2(y,z);

MUX I3(x,y,c,sm);
MUX I4(a,c,x,cy);
endmodule

module FA(a,b,c,cy,sm);
input a,b,c;
output cy,sm;
wire x,y,z;
xor I0(x,a,b);
xor I1(sm,x,c);
and I2(y,a,b);
and I3(z,x,c);
or I4(cy,y,z);
endmodule



module cla(n,z,o,a,b);
input [3:0] a,b;
input o;
  
wire [3:0] p,g,c;
wire [9:0]m;
  
output [3:0]n;
output z;
  
xor I0(p[0],a[0],b[0]);
and I1(g[0],a[0],b[0]);
xor I2(p[1],a[1],b[1]);
and I3(g[1],a[1],b[1]);
xor I4(p[2],a[2],b[2]);
and I5(g[2],a[2],b[2]);
xor I6(p[3],a[3],b[3]);
and I7(g[3],a[3],b[3]);

and I8(m[0],o,p[0]);
or I9(c[0],m[0],g[0]);
and I10(m[1],g[0],p[1]);

// burada and3 yapabiliriz simdilik 2 andli yapalim.
//and I11(m[2],o,p[0],p[1]);
wire op0;
and I11(op0, o, p[0]);
and I26(m[2], op0, p[1]);
  
//or I12(c[1],g[1],m[1],m[2]);
wire g1m1;
or I12(g1m1, g[1], m[1]);
or I27(c[1], g1m1, m[2]);

and I13(m[3],g[1],p[2]);
  
//and I14(m[4],g[0],p[1],p[2]);
wire g0p1;
and I14(g0p1, g[0], p[1]);
and I28(m[4], g0p1, p[2]);
  
// and4 lazim aslinda
//and I15(m[5],o,p[1],p[2],p[0]);
wire op1;
and I15(op1, o, p[1]);
wire op1p2;
and I29(op1p2, op1, p[2]);
and I30(m[5], op1p2, p[0]);

// or4 lazim aslinda
//or I16(c[2],g[2],m[3],m[4],m[5]);
wire g2m3;
or I16(g2m3, g[2], m[3]);
wire g2m3m4;
or I31(g2m3m4, g2m3, m[4]);
or I32(c[2], g2m3m4, m[5]);
  
and I17(m[6],g[2],p[3]);
  
//and I18(m[7],g[1],p[2],p[3]);
wire g1p2;
and I18(g1p2, g[1], p[2]);
and I33(m[7], g1p2, p[3]);
  
//and I19(m[8],g[0],p[1],p[2],p[3]);
//wire g0p1; // yukarida tanimlandi
//and I19(g0p1p2, g0p1, p[2]) = m[4] // yukarida tanimlandi
and I19(m[8], m[4], p[3]);
  
//and I20(m[9],o,p[0],p[1],p[2],p[3]);
//wire op0p1 = m2 // yukarida tanimlandi
wire m2p2;
and I20(m2p2, m[2], p[2]);
and I34(m[9], m2p2, p[3]);

// aslinda or5 lazim.
//or I21(c[3],g[3],m[6],m[7],m[8],m[9]);
wire g3m6;
or I21(g3m6, g[3], m[6]);
wire g3m6m7;
or I35(g3m6m7, g3m6, m[7]);
wire g3m6m7m8;
or I36(g3m6m7m8, g3m6m7, m[8]);
or I37(c[3], g3m6m7m8, m[9]);
  
xor I22(n[0],p[0],o);
xor I23(n[1],p[1],c[0]);
xor I24(n[2],p[2],c[1]);
xor I25(n[3],p[3],c[2]);
  
assign z=c[3];
endmodule 
