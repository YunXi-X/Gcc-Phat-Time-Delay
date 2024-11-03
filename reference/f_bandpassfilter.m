%通带上下频率 fd fu
%
%zhong 2020.10.16
%fs采样频率，fd0为下限，fu0为上限
function s=f_bandpassfilter(fd0,fu0,fs,s0)
[Nrow,Ns]=size(s0);
%采样定理,fs为采样频率
if fd0>fs/2
    fd=fs-fu0;
    fu=fs-fd0;
else
    fd=fd0;
    fu=fu0;
end
wp_d=fd;
wp_u=fu;
wn=[wp_d wp_u]/(fs/2);          %归一化处理(fs/2为参考频率)
%巴特沃茨滤波器
[b,a]=butter(6,wn,'bandpass');  %6阶带通滤波器，wp_d为低频，wp_u为高频
s=zeros(Nrow,Ns);
for i=1:Nrow
    s(i,:)=filter(b,a,s0(i,:));
end
