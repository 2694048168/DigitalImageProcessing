function g = endpoints(f)
% ENDPOINTS Computes end points of a binary image.
%   G = ENDPOINTS(F) computes the end points of the binary image F
%   and returns them in the binary image G. 
    
persistent lut
    
if isempty(lut)
    lut = makelut(@endpoint_fcn, 3);
end
    
g = applylut(f,lut);
    
%-------------------------------------------------------------------%
function is_end_point = endpoint_fcn(nhood)
%   Determines if a pixel is an end point.
%   IS_END_POINT = ENDPOINT_FCN(NHOOD) accepts a 3-by-3 binary
%   neighborhood, NHOOD, and returns a 1 if the center element is an
%   end point; otherwise it returns a 0. 
    
is_end_point = nhood(2,2) & (sum(nhood(:)) == 2);

end  % ending function