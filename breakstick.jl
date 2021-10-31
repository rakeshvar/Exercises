using Statistics
using Plots

N = 1000

l((s, t)) = max(s, t-s, 1-t)

function f(N)
    breaks = extrema(rand(N, 2), dims=2)
    ls = l.(breaks)
    println(mean(ls))
    histogram(ls, bins=67)
end

f(N)

function g(N)
    m = 0
    for i in 1:N
        s, t = rand(2)
        if s > t
            s, t = t, s
        end
        m = (m*(i-1) + max(s, t-s, 1-t))/i
    end
    m
end
    