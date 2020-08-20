function g = dftcorr(f, w)
% DFTCORR 2-D correlation in the frequency domain.
%   G = DFTCORR(F, W) performs the correlation of a mask, W, with
%   image F. The output, G, is the correlation image, of class
%   double. The output is of the same size as F. When, as is
%   generally true in practice, the mask image is much smaller than
%   G, wraparound error is negligible if W is padded to size(F).
    
[M, N] = size(f);
f = fft2(f);
w = conj(fft2(w, M, N));
g = real(ifft2(w.*f));
    
end % ending function
    