%%%TP N1 Codage de Huffman 
clear all,close all, clc
%1) génération du dictionnaire
x = [1 2 3 4 5 6]; 
p = [0.43 0.17 0.15 0.11 0.09 0.05];
[dict,avglen] = huffmandict(x,p); 
t=dict
for i=1:length(t)
    t{i,2}=num2str(t{i,2});
end
t
h=-sum(p.*log2(p)) %l'entropie de source
efficacite=h/avglen 

%Manipulation2:
MSG=[3 3 1 3 3 3 4 5 2 3];
hcode=huffmanenco(MSG,dict)
mbin=de2bi(MSG)
msgbef=numel(mbin)
msgafe=numel(hcode)
T=msgafe/msgbef

%%%save
infile=fopen('stream.dat','wb');
fwrite(infile,hcode,'int64');
fclose(infile);

%open
infile=fopen('stream.dat','rb');
hcode1=fread(infile,'int64');
fclose(infile);

hdeco=huffmandeco(hcode,dict)
hdecobin=de2bi(hdeco)
isequal(hdecobin,mbin)


%manipulation3:

prob=[2/24 1/24 1/24 2/24 5/24 2/24 1/24 2/24 1/24 1/24 3/24 1/24 2/24]
s={'a' 'b' 'c' 'd' 'e' 'i' 'g' 'n' 'o' 'p' 's' 't' 'l'}
MSG='LECODAGEESTINDISPENSABLE'


[dict,avglen] = huffmandict(s,prob) 
r=dict
for i=1:length(r)
    r{i,2}=num2str(r{i,2});
end
t
h=-sum(prob.*log2(prob)) %l'entropie de source
efficacite=h/avglen 


