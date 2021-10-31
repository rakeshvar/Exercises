using Plots
plotly()

function solven(n::Integer, tail::Bool)
    A = zeros(n, n)
    e = zeros(n)
    e[1] = 1
    e[end] = tail
    e[end-1] = tail

    for d in 1:(n-1)
        A[d+1, d] = 1
    end
    for d in 1:(n-2)
        A[d, d+2] = 1
    end
    for d in 1:n
        A[d, d] = -2
    end

    -A\e
end

for i in 1:10
    N = 2^i
    for lim in (true, false)
        p = solven(N, lim)
        plot(p)
    end
end
