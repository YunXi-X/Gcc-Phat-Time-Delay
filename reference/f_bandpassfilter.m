%ͨ������Ƶ�� fd fu
%
%zhong 2020.10.16
%fs����Ƶ�ʣ�fd0Ϊ���ޣ�fu0Ϊ����
function s=f_bandpassfilter(fd0,fu0,fs,s0)
[Nrow,Ns]=size(s0);
%��������,fsΪ����Ƶ��
if fd0>fs/2
    fd=fs-fu0;
    fu=fs-fd0;
else
    fd=fd0;
    fu=fu0;
end
wp_d=fd;
wp_u=fu;
wn=[wp_d wp_u]/(fs/2);          %��һ������(fs/2Ϊ�ο�Ƶ��)
%�����ִ��˲���
[b,a]=butter(6,wn,'bandpass');  %6�״�ͨ�˲�����wp_dΪ��Ƶ��wp_uΪ��Ƶ
s=zeros(Nrow,Ns);
for i=1:Nrow
    s(i,:)=filter(b,a,s0(i,:));
end
