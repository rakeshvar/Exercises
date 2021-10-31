
function med(a)
    lenth = length(a)
    m = round(Int, (lenth+1)/2)
    iters = 0

    function _med(i, left)
        iters += 1
        length(i) == 0 && error("zero length")
        p = a[i[1]]

        i₋ = [j for j in i if a[j] < p]
        i₌ = [j for j in i if a[j] == p]
        @show p, left, length(i), (lenth-left-length(i))
        if left + length(i₋) + length(i₌) < m
            i₊ = [j for j in i if a[j] > p]
            return _med(i₊, left+length(i₋)+length(i₌))
        elseif left + length(i₋) < m 
            @show lenth, iters, getindex.((a,), i)
            return p
        else
            return _med(i₋, left)
        end
    end

    return _med(1:lenth, 0)
end

vals = [
(17:10:97),
(97:-10:17),
([91, 1, 111, 71, 11, 31, 51]),
([1, 1]),
([1, 2, 2, 2]),
([1, 1, 2, 2]),
]

using Statistics

# for v in [rand(0:99, rand(1:2:19)) for _ in 1:10]
#     @show med(v), median(v), v
# end

for i in 1:8
    a = rand(0:10^5, 1+10^i)
    es = round(Int, log2(length(a)))
    @show length(a), es, med(a), median(a)
end

using BenchmarkTools
a = rand(0:10^7, 10^6)
@btime median(a)
# @btime med(a)
