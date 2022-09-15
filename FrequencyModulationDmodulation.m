fs = 10000;
t = (0:0.1*fs)/fs;
fc = 500;
fm = 35;
ac = 1;
am = 1;
B = 15; % modulating index
fdev = 50;
%% generating message signal 
mt = am*cos(2*pi*fm*t);
subplot(4,1,1);
plot(t,mt,'c');
title('message signal')
xlabel('time');
ylabel('amplitude');
grid on;
%% generating message signal
ct = ac*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t,ct,'c');
title('carrier signal');
xlabel('time');
ylabel('amplitude');
grid on;
%% generating frequecy modulating signal
yt = ac.*sin((2*pi*fc*t)+(B*am.*sin(2*pi*fm*t)));
subplot(4,1,3);
plot(t,yt,'c');
title('frequency modulating signal');
xlabel('time');
ylabel('amplitude');
grid on;
%% generating frequency demodulating signals
x = diff(yt);
y = abs(x);
[b,a] = butter(3,0.02);
final = filter(b,a,y);
subplot(4,1,4);
plot(t,final,'c');
title('frequency demodulating signal');
xlabel('time')
ylabel('amplitude');
