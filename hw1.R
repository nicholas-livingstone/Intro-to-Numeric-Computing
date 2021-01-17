library(ggplot2)

x = seq(-1,1,length.out = 100)

#F(X)
f <- function(x)((1 + x^2)^-1)

#Exact Derivative function
exact_diff <- function(x){}
body(exact_diff) <- D(body(f), 'x')

#Estimated Derivative function
onesidediff <- function(f, x, h){
  formula <- function(x)(((f(x + h) - f(x))/h))
  return(formula)
}

#Estimated Centered Derivative function
centerdiff <- function(f, x, h){
  formula <- function(x)(((f(x + h) - f(x - h))/(2*h)))
  return(formula)
}


#One-sided approximation with given parameters
one_side_estimate = onesidediff(f, x, 1e-4)

#Centered Approximation with given paramters 
centered_estimate = centerdiff(f, x, 1e-4)

#calculated error between the one-sided difference and the true difference
one_side_error = function(x)(abs(one_side_estimate(x) - exact_diff(x)))
centered_error = function(x)(abs(centered_estimate(x) - exact_diff(x)))

# p1 <- ggplot(data.frame(x = c(-1,1)), aes(x=x)) + stat_function(fun = estimate, colour="red", size = 2) + stat_function(fun = exact_diff, size = 1)

one_side_error_plot <- ggplot(data.frame(x = c(-1,1)), aes(x=x)) + stat_function(fun = one_side_error)
one_side_error_plot <- one_side_error_plot + scale_x_continuous(name = "X") + scale_y_continuous(name="Abs(Error)") + ggtitle("Error Between One-Sided Difference Derivative Approximation and True Derivative")
centered_error_plot <- ggplot(data.frame(x = c(-1,1)), aes(x=x)) + stat_function(fun = centered_error)
centered_error_plot <- centered_error_plot + scale_x_continuous(name = "X") + scale_y_continuous(name="Abs(Error)") + ggtitle("Error Between Centered Difference Derivative Approximation and True Derivative")
one_side_error_plot
centered_error_plot
