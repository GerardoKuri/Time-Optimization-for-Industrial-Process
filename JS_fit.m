%Función que recibe una población de n cromosomas con una permutación de 
%la cantidad de trabajos a realizar en el problema y las matrices que 
%describen las secuencias de cada trabajo y los tiempos de uso de
%maquinaria.
%Devuelve la población ordenada por aptitud, arreglo de aptitudes
%ordenadas y arreglo de probabilidades de cada cromosoma según aptitud (este
%último arreglo solo se utiliza para la selección de ruleta.
function [fit,P,Prob]=JS_fit(P,T_Mat,J_Mat)
m=size(T_Mat(:,1),1);
J=size(J_Mat(:,1),1);
chNo=size(P.chromosome(:),1);
for c =1:chNo
    posJ=ones(J,1);
    posM=ones(m,1);
    P.chromosome(c).dG=zeros(m,50);
    for pos=1:4
        k=P.chromosome(c).gene(pos);
        len=size(find(J_Mat(k,:)),2);
        for i=1:len
            j=J_Mat(k,i);
            if (posJ(k)>posM(j))
                pre=posJ(k);
            elseif (posJ(k)<=posM(j))
                pre=posM(j);
            end
            P.chromosome(c).dG(j,pre:pre+(T_Mat(j,k)/10)-1)=k;
            posJ(k)=pre+(T_Mat(j,k)/10);
            posM(j)=pre+(T_Mat(j,k)/10);
        end
    end
    P.chromosome(c).fit=max(posM)-1;
end
[r,I]=sort([P.chromosome(:).fit]);
P.chromosome(:)=P.chromosome(I);
Prob=[];
for i=1:chNo
   fit(i)=P.chromosome(i).fit;
end

for i=1:chNo
   Prob(i)=fit(i)./sum(fit);
end
end