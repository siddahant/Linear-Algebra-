%{
Siddahant Jain 
%}
clear; clc;
format shortG
% Import the data 
data=importdata('data.dat');
% assigne the datas 
t=data(:,1);
m=data(:,2);
plot(t,m,"xr") % plot the data time vs measurements
xlabel('time');
ylabel('measurements');
hold on 

%opetations for claculating A_new at 1
A=[ones(length(t),1), t]; 
x_hat=(inv(A'*A))*(A'*m)
A_new=A*x_hat; % 1
plot(t,A_new,'-b','linewidth',1.5) % plot line that best fits the data and plot 

A1=[ones(length(t),1), t,t.^2];

x_hat1=(inv(A1'*A1))*(A1'*m)
A_new1=A1*x_hat1;
plot(t,A_new1,'-g','linewidth',1.5) % plot the parabola that best fits the data 
legend('original data','best fit line','best fit parabola')
hold off
% find leat square error 
least_square_error = sqrt((sum((m-A_new).^2))) % for line 
least_square_error_P= sqrt((sum((m-A_new1).^2))) % for parabola 

