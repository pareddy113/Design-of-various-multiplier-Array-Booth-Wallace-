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
// 1st
xor n9(z[0],one[0],two[0]);
and n10(cry[0],z[0],sign[0]);
//2nd
xor n13(z[1],one[1],two[1]);
and n14(cry[1],z[1],sign[1]);
//3rd
xor n15(z[2],one[2],two[2]);
and n16(cry[2],z[2],sign[2]);
//4th
xor n17(z[3],one[3],two[3]);
and n18(cry[3],z[3],sign[3]);



code e1(one[0],two[0],sign[0],y[1],y[0],1'b0);
code e2(one[1],two[1],sign[1],y[3],y[2],y[1]);
code e3(one[2],two[2],sign[2],y[5],y[4],y[3]);
code e4(one[3],two[3],sign[3],y[7],y[6],y[5]);



//first product generation
product p0(x[0],sign[0],cry[0],one[0],two[0],sign[0],fp[0],i[0],n[0]);
product p1(x[1],i[0],n[0],one[0],two[0],sign[0],fp[1],i[1],n[1]);
product p2(x[2],i[1],n[1],one[0],two[0],sign[0],fp[2],i[2],n[2]);
product p3(x[3],i[2],n[2],one[0],two[0],sign[0],fp[3],i[3],n[3]);
product p4(x[4],i[3],n[3],one[0],two[0],sign[0],fp[4],i[4],n[4]);
product p5(x[5],i[4],n[4],one[0],two[0],sign[0],fp[5],i[5],n[5]);
product p6(x[6],i[5],n[5],one[0],two[0],sign[0],fp[6],i[6],n[6]);
product p7(x[7],i[6],n[6],one[0],two[0],sign[0],fp[7],i[7],n[7]);
xor x1(m[0],i[7],n[7]);
and a1(m[1],two[0],i[7]);
and a2(m[2],one[0],m[0]);
or o1(fp[8],m[1],m[2]);
not n1(fp[9],fp[8]);
assign p[0]=fp[0];


//second product generation
product q0(x[0],sign[1],cry[1],one[1],two[1],sign[1],sp[0],j[0],o[0]);
product q1(x[1],j[0],o[0],one[1],two[1],sign[1],sp[1],j[1],o[1]);
product q2(x[2],j[1],o[1],one[1],two[1],sign[1],sp[2],j[2],o[2]);
product q3(x[3],j[2],o[2],one[1],two[1],sign[1],sp[3],j[3],o[3]);
product q4(x[4],j[3],o[3],one[1],two[1],sign[1],sp[4],j[4],o[4]);
product q5(x[5],j[4],o[4],one[1],two[1],sign[1],sp[5],j[5],o[5]);
product q6(x[6],j[5],o[5],one[1],two[1],sign[1],sp[6],j[6],o[6]);
product q7(x[7],j[6],o[6],one[1],two[1],sign[1],sp[7],j[7],o[7]);
xor x2(m[3],j[7],o[7]);
and a3(m[4],two[1],j[7]);
and a4(m[5],one[1],m[3]);
or o2(sp[8],m[4],m[5]);
not n2(sp[9],sp[8]);
assign p[1]=fp[1];


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
xor x1(one,y0,y1);
xor x2(k[1],y2,y1);
not n1(k[0],one);
and a1(two,k[0],k[1]);
assign sign=y2;
endmodule



//generation of inner products

module product(x1,x0,x2,one,two,sign,p,i,ca);
input x1,x0,x2,sign,one,two;
output p,i,ca;
wire [2:0] k;
xor xo1(i,x1,sign);
and a1(k[1],i,one);
and a0(k[0],x0,two);
or o0(k[2],k[1],k[0]);
xor xo2(p,k[2],x2);
and a2(ca,k[2],x2);
endmodule



//adders design
module HAd(a,b,c,s);
input a,b;
output c,s;
xor x1(s,a,b);
and a1(c,a,b);
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

module MUX(i0,i1,s,o);
input i0,i1,s;
output o;
wire t,p,q;
and a1(t,s,i1);
not n0(p,s);
and a2(q,p,i0);
or a3(o,t,q);
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



module cla(n,z,o,a,b);
input [3:0] a,b;
input o;
wire [3:0] p,g,c;
wire [9:0]m;
output [3:0]n;
output z;
xor (p[0],a[0],b[0]);
and (g[0],a[0],b[0]);
xor (p[1],a[1],b[1]);
and (g[1],a[1],b[1]);
xor (p[2],a[2],b[2]);
and (g[2],a[2],b[2]);
xor (p[3],a[3],b[3]);
and (g[3],a[3],b[3]);

and (m[0],o,p[0]);
or (c[0],m[0],g[0]);
and (m[1],g[0],p[1]);
and (m[2],o,p[0],p[1]);
or (c[1],g[1],m[1],m[2]);
and (m[3],g[1],p[2]);
and (m[4],g[0],p[1],p[2]);
and (m[5],o,p[1],p[2],p[0]);
or (c[2],g[2],m[3],m[4],m[5]);
and (m[6],g[2],p[3]);
and (m[7],g[1],p[2],p[3]);
and (m[8],g[0],p[1],p[2],p[3]);
and (m[9],o,p[0],p[1],p[2],p[3]);
or (c[3],g[3],m[6],m[7],m[8],m[9]);
xor (n[0],p[0],o);
xor (n[1],p[1],c[0]);
xor (n[2],p[2],c[1]);
xor (n[3],p[3],c[2]);
assign z=c[3];
endmodule 