%{
Function that approximates first derivative using the limit of a difference
quotient i.e. as h approaches 0. Also produces plot of original function
and derivative. 

Parameters
----------

 f : function
    function to approximate derivative of, must be differentiable
 x : vector
    interval of which to computer the derivative
 h : float
    constant 'h' that affects accuracy of approximation

Returns
-------

fp : function
    derivative function
%}  
function fp = onesidediff(f,x,h)
    fp = (f(x+h) - f(x))./h;
end
