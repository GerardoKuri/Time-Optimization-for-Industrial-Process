
function [P]=pop_init_JS(chNo,T_Mat,J_Mat)
m=size(T_Mat(:,1),1);
J=size(J_Mat(:,1),1);
vec=[1:4];
e=perms(vec);
for i = 1:chNo
    n=randi(size(e,1));
    P.chromosome(i).gene(:,1:size(e(1,:),2))=e(n,:);
end
end