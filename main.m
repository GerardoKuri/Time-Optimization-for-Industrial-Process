clear all;
close all;
clc;
format long g;
%%
%Captura de parámetros iniciales 
M=1000;
delta=1;
chroNo=20;
D=0;
deltaVar=inf;
deltaIt=10;
Max=1;
porMut=10;

%%
%Captura de matrices de tiempos y secuencias de trabajos
T_Mat=[30 120 0 120;
       10 30 0 30;
       0 20 20 0;
       0 30 30 0;
       0 0 90 0;
       0 30 0 0;
       0 0 30 0];
J_Mat=[1 2 0 0 0 0;
       4 6 3 1 2 0;
       4 7 3 5 0 0;
       1 2 0 0 0 0];
tic
%%
%Generación de población y evalución de población generada
for j=1:Max
P=pop_init_JS(chroNo,T_Mat,J_Mat);
[best,mean]=popEvalJS(P,T_Mat,J_Mat);
[fit,P,Prob]=JS_fit(P,T_Mat,J_Mat);
cont=0;
D=0;
deltaVar=inf;
%%
%Generación y evalución de generaciones: criterio de término es iteraciones
%máximas = M y promedio de aptitud > epsilon 
while cont<M & D<deltaIt
    %Selección de parejas a cruzar
    P=selecJS('Poli',P,T_Mat,J_Mat);
    %Cruza de población 
    P=OxJS(P);
    %P=heuristic(P,C_Mat,porMut);
    P=scramble(P,porMut);
    %Criterio elitista: Competencia genética
    [F,P,Prob]=compGenJS(P,T_Mat,J_Mat);
    
    %P=heuristic(P,C_Mat,porMut);
    %Evaluación de nueva generación y captura del hijo medio y mejor
    %adaptado
    [best,mean]=popEvalJS(P,T_Mat,J_Mat);
    cont=cont+1;
    X(cont)=cont;
    Ymean(cont)=mean;
    Ybest(cont)=best;
    %Ydist(cont)=distance;
    %%
    %Cálculo del diferencial entre cada  generación
    Delta=mean-deltaVar;
    if (Delta)<delta
        D=D+1;
    else
        D=0;
    end
    deltaVar=mean;
end
fAcum(j)=Ymean(cont);
end
figure(2)
boxplot(fAcum);
title('distance');
ylim([27 42]);
hold on;
ylabel('distance');
xlabel('100 It, Tournament, PMx, 5% Heuristic Mut, Comp Gen');
%%
%Gráfica de Hijo Medio
figure(1)
subplot(111);
plot(X,Ymean,'-b');
hold on;
plot(X,Ymean,'*k');
title('Hijo Medio');
ylabel('Aptitud');
xlabel('Iteración #');
hold on;
% %%
% %Gráfica de menor distancia
% subplot(1,2,2);
% plot(X,Ydist,'-b');
% hold on;
% plot(X,Ydist,'*k');
% title('Menor distancia');
% ylabel('Distancia');
% xlabel('Iteración #');
% hold on;
