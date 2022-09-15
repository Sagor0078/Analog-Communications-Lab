t = 0 : 0.001 : 1;
fc = 100;
fm = 10;
am = 1;
ac = 1;
%% generating message signal 
mt = am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t,mt,'c');
title('message signal ');
xlabel('time');
ylabel('amplitude');
%% generating carrier  signal
ct = ac*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t,ct,'c');
title('message signal ');
xlabel('time');
ylabel('amplitude');
%% generating modulated signal 
k = 0.5;
yt = ac.*(1+k*am.*sin(2*pi*fm*t)).*sin(2*pi*fc*t);
subplot(4,1,3);
plot(t,yt,'c');
title('modulated signal ');
xlabel('time');
ylabel('amplitude');
%% generating demodulated signal 
r = yt.*ct;
[b,a] = butter(4,0.04);
%[b,a] = butter(n,Wn) returns the transfer function coefficients of an nth-order lowpass digital Butterworth filter with normalized cutoff frequency Wn.
mr = filter(b,a,r);
subplot(4,1,4);
plot(t,mr,'c');
title('demodulated signal ');
xlabel('time');
ylabel('amplitude');
