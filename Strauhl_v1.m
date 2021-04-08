t = Ref1.Probe02050;

p(1,:) = Ref1.VarName2;
p(2,:) = Ref1.VarName3;
p(3,:) = Ref1.VarName6;
p(4,:) = Ref1.VarName7;
p(5,:) = Ref1.VarName4;
p(6,:) = Ref1.VarName5;
% for i=1:length(p0)
% p1(i) = (p0(i)+p2(i)+p3(i)+p4(i))/4;
% end


start = 16000

for i=1:4
    
meanp(i) = mean(p(i,length(t)/2-200:length(t)/2-100))

for j=1:length(t)
    if j > length(t)/2 && (abs(meanp(i)*1.01) < abs(p(i,j)))
        start(i) = j
        starttime(i) = t(j)
        break;
    end
end
    
Fs = 1/.005;
N = length(t)-start(i);
    
figure(1)
plot(t,p(i,:))
hold on
xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

figure(2)
plot(t,p(i,:))
hold on
%xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

Y = zeros(N+1);

Y(i,:) = fft(p(i,start(i):end));
freq = 0:Fs/N:Fs;
mags(i,:) = abs(Y(i));

figure(3)
plot(freq,Y(i,:))
hold on
xlim([0 3])

Ym=Y(i,2:end)

[~,I] = max(abs(Ym(i)))

Strouhal(1,i) = (I)*Fs/N
end

%%

t = Ref2.Probe02050;

p(1,:) = Ref2.VarName2;
p(2,:) = Ref2.VarName3;
p(3,:) = Ref2.VarName6;
p(4,:) = Ref2.VarName7;
p(5,:) = Ref2.VarName4;
p(6,:) = Ref2.VarName5;
% for i=1:length(p0)
% p1(i) = (p0(i)+p2(i)+p3(i)+p4(i))/4;
% end

for i=1:4
    
meanp = mean(p(i,length(t)/2:length(t)/2+100))

for j=1:length(t)
    if j > length(t)/2 && (abs(meanp*1.5) < abs(p(i,j)))
        start = j
        starttime = t(j)
        break;
    end
end
    
Fs = 1/.003;
N = length(t)-start;
    
figure(1)
plot(t,p(i,:))
hold on
xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

figure(2)
plot(t,p(i,:))
hold on
%xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

Y = zeros(N+1);

Y(i,:) = fft(p(i,start:end));
freq = 0:Fs/N:Fs;
mags = abs(Y);

figure(3)
plot(freq,Y(i,:))
hold on
xlim([0 3])

Ym=Y(i,2:end);

[Ym,I] = max(abs(Ym));

Strouhal(2,i) = (I)*Fs/N;
end

%%

t = Ref2.Probe02050;

p(1,:) = Ref2.VarName2;
%p(2,:) = Ref2.VarName3;
%p(3,:) = Ref2.VarName4;
%p(4,:) = Ref2.VarName5;
% p(5,:) = Ref2.VarName4;
% p(6,:) = Ref2.VarName5;
% for i=1:length(p0)
% p1(i) = (p0(i)+p2(i)+p3(i)+p4(i))/4;
% end

for i=1:2
    
meanp = mean(p(i,length(t)/2:length(t)/2+100))

for j=1:length(t)
% %     if j > length(t)/2 && (abs(meanp*1.5) < abs(p(i,j)))
%         start = j
%         starttime = t(j)
%         break;
%     end
end

start = 30000;
    
Fs = 1/.002;
N = length(t)-start;
    
figure(1)
plot(t,p(i,:))
hold on
%xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

figure(2)
plot(t,p(i,:))
hold on
%xlim([85,max(t)])
ylim([-.5,.5])
legend('Probe 1','Probe 2','Probe 5','Probe 6','Probe 3','Probe 4')

Y = zeros(N+1);

Y(i,:) = fft(p(i,start:end));
freq = 0:Fs/N:Fs;
mags = abs(Y);

figure(3)
plot(freq,Y(i,:))
hold on
xlim([0 3])

Ym=Y(i,2:end);

[Ym,I] = max(abs(Ym));

Strouhal(2,i) = (I)*Fs/N
end
%%
%mean Strouhal
mSt = mean(Strouhal,2)



