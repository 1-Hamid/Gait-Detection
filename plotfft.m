function plotfft(data,smprt)

    L=length(data);
    
    Y=fft(data);
    P2=abs(Y/L);
    P1=P2(1:L/2+1);
    P1(2:end-1)=2*P1(2:end-1);
    f=smprt*(0:(L/2))/L;
    
    plot(f,P1);
    title('Fourier of signal')
    xlabel('f(Hz)');
    ylabel('|P1(f)|');
    
end