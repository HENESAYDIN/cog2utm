%% CO�RAF�DEN UTM(6) D�L�M D�N���M�
clear all;clc;
format long g

[Filename,PathName] = uigetfile('*.*','select point file');
A=xlsread(Filename);
B=A(:,1);
L=A(:,2);
%datum ve elipsoid tan�mlan�r
ellipsoid=almanac('earth','wgs84','meters');
%% utm 6 tan�mlan�r
z = utmzone(B(1),L(1))
utmstruct=defaultm('utm');
utmstruct.zone= z;
utmstruct.geoid = ellipsoid;
utmstruct = defaultm(utmstruct);
%% utm 6 derece hesaplan�r
[y1,x1]=mfwdtran(utmstruct,B,L);
sonuc=[x1 y1];
utmkoor=[x1 y1 A(:,3)];
%% dosyaya yazd�rma

xlswrite(Filename,utmkoor);
xlswrite('pointfile.xls',utmkoor,'(B,L)->(6 UTM)');
