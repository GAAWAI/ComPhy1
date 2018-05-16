function y = TaylorreiheSin(x_array,n)

% 'x_array' is the input array for evaluation
% 'n' is the maximum degree of the polynomial
% This function is based on symbolic toolbox

syms x
taylor_sin = taylor(sin(x),x,'Order',n);

y = subs(taylor_sin,x,x_array);

end