%My student number is 5054702, so q=(200+2)/1000 = 0.202

q = 0.202;
%Mutual information of different input distribution
figure
for x = 0:0.1:1
    fplot(@(p)H(x*(1-p) + (1-x)*q) - x*H(p) - (1-x)*H(q),[0 1])
    hold on
    line([0.798 0.798], [0 1])
end
title('Mutual information of different input distribution');
xlabel('Channel Error Probability p') ;
ylabel('I(X;Y)');
figure
%Binary Symmetric Channel Capacity
fplot(@(p)1-H(p),[0 1])
hold on
%Z Channel Capacity
fplot(@(p)log2(1+(1-p).*p.^(p./(1-p))),[0 1])
hold on
%Custom Channel Capacity
fplot(@(p)channel(p),[0 1])
hold on
line([0.202 0.202], [0 1])
hold on
line([0.798 0.798], [0 1])
legend('Binary Symetric Channel','Z-Channel','Custom Channel')
title('Channel capacity of different input distribution');
xlabel('Channel Error Probability p') ;
ylabel('C');


function hp = H(p)
% entropy
hp = -p.*log2(p) -((1-p).*log2(1-p));
end

function C = channel(p)
q = 0.202;
z = 2.^( (H(p)-H(q))./(1-p-q));
x = (1-q-z*q)/((1+z)*(1-p-q));
C = H(1/(z+1)) - x*H(p) - (1-x)*H(q);
end
