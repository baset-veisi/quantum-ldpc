clear all

errs_max = 500; % total number of errors to observe

SNRdBvec = 0:4; % range of SNR values to test

load H_girth6.mat
%load H_girth4.mat

[m, n] = size(H);

c = zeros(1,n); % the all-0 word is always a codeword

tx = 1-2*c; % BPSK modulator: 0 --> +1; 1 --> -1

WER_SP = zeros(size(SNRdBvec));
WER_ML = zeros(size(SNRdBvec));

ind_SNR = 0;


for SNRdB = SNRdBvec
    
    ind_SNR = ind_SNR + 1;
    
    disp(SNRdB)
    
    SNRlin = 10^(SNRdB/10); % transformation from dB to linear units
    
    sigma = sqrt(1/(2*SNRlin)); % standard deviation of the AWGN, because SNR = 1/(2*sigma^2)
    
    errs_SP = 0;  % initialization of the number of erred codewords
    errs_ML = 0;
    word_counter = 0;
    
    while errs_SP < errs_max
        word_counter = word_counter + 1;
        
        rx = tx + sigma * randn(1, n);
        
        [decoded_bits_sp] = sp_decoder(rx, H, sigma);
        [decoded_bits_ms] = ms_decoder(rx, H, sigma);
        
        if any( xor(c, decoded_bits_sp) )
            errs_SP = errs_SP + 1;
        end
        if any( xor(c, decoded_bits_ms) )
            errs_ML = errs_ML + 1;
        end
        
    end
    
    WER_SP(ind_SNR) = errs_SP / word_counter;
    WER_ML(ind_SNR) = errs_ML / word_counter;
end

%%
figure, semilogy(SNRdBvec, WER_SP, 'ko-')
hold on, grid on
semilogy(SNRdBvec, WER_ML, 'mo-')
xlabel('1/(2*\sigma^2) [dB]')
ylabel('WER')
semilogy(0:10, qfunc(sqrt(2*10.^((0:10)/10))), 'r+-')
semilogy(-2.82*[1 1], [1e-6 1e-3], 'k-', 'LineWidth', 2)

legend('SP girth=6', 'Uncoded', 'Capacity')

xdB = linspace(0,6,100);
xlin = 10.^(xdB/10);
semilogy(xdB, 4*qfunc(sqrt(2*3*xlin))+3*qfunc(sqrt(2*4*xlin)),'k--')
xdB = linspace(0,8,100);
xlin = 10.^(xdB/10);
semilogy(xdB, 2*qfunc(sqrt(2*2*xlin))+5*qfunc(sqrt(2*4*xlin)),'b--')
ylim([1e-6 1e-1])
