
extreme(n) = tan((π/2)*(1-1/n))/n

using Plots

plot(extreme.(1:100))


tan((π/2)*(1-1/n))/n -> 2/π   

tan((π/2)*(1-2/n))/n -> 1/π