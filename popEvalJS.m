%Funci�n que recibe una poblaci�n no necesariamente ordenada por aptitud
%y la matriz descriptiva de las secuencias de trabajo y de tiempo de uso de 
%maquinaria del problema.
%Devuelve la aptitud del cromosoma mejor adaptado,la aptitud promedio de
%la poblaci�n.
function [best,mean]=popEvalJS(P,T_Mat,J_Mat)
[F,P,Prob]=JS_fit(P,T_Mat,J_Mat);
len=size(F(:),1);
best=F(1);
mean=sum(F)/len;
%distance=P.chromosome(1).;
end