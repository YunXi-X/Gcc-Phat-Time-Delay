function s=f_baseband(f0,tns,s0)

%f0  中心频率
%tns  时间
%s0 复信号
% zhong 2020.10.19

[Nrow,Ns]=size(s0);
s=zeros(Nrow,Ns);
local=exp(-1j*2*pi*f0*tns);
for i=1:Nrow
    s(i,:)=s0(i,:).*local;
end
