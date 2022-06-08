%Esta función recibe la población entera y el porcentaje que se desea mutar
%en la población
%La función toma el porcentaje menos apto de la población y lo muta
%con respecto al método scramble.
%La función regresa la población con el porcentaje mutado
function P=scramble(P,por)
Plen=size(P.chromosome(:),1);
Clen=size(P.chromosome(1).gene(:),1);
Mlen=round(Plen*(por/100));
for i = 1:Mlen
    xPoint=randi([1,round(Clen/2)]);
    xPoint2=xPoint+round(Clen/3);
    string=P.chromosome(Plen-i+1).gene(xPoint+1:xPoint2);
    p=randperm(size(string,2));
    string=string(p);
    P.chromosome(Plen-i+1).gene(1:round(2*(Clen/3)))=[P.chromosome(Plen-i+1).gene(1:xPoint),P.chromosome(Plen-i+1).gene(xPoint2+1:Clen)];
    P.chromosome(Plen-i+1).gene(round(2*(Clen/3))+1:Clen)=0;
    xPoint3=randi([1,round(2*(Clen/3))]);
    P.chromosome(Plen-i+1).gene(1:Clen)=[P.chromosome(Plen-i+1).gene(1:xPoint3),string,P.chromosome(Plen-i+1).gene(xPoint3+1:round(2*(Clen/3)))];
end
end