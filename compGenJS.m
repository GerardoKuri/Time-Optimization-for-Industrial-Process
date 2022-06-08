%Función que recibe una población desordenada, esta función la ordena y
%regresa la mitad con mejor aptitud. 
function [F,P,Prob]=compGenJS(P,T_Mat,J_Mat)
Plen=size(P.chromosome(:),1);
Plen2=Plen/2;
[F,P,Prob]=JS_fit(P,T_Mat,J_Mat);
P.chromosome=P.chromosome(1:Plen2);
F=F(1:Plen2);
Prob=Prob(1:Plen2);
end