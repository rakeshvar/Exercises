using Statistics

function sortedmedian(as...)
    ns = length.(as)
    c = floor(Int, sum(ns)/2)
    is = zeros(Int, length(as))
    val = nothing
    
    for k in 0:c
        nexts = [i < n ? a[i+1] : Inf for (a, i, n) in zip(as, is, ns)]
        val, at = findmin(nexts)
        is[at] += 1            
    end
    val
end

for i in 1:10
    arrs = [sort!(rand(10:99, rand(1:9)))*10 for i in 1:rand(1:9)]
    display((sortedmedian(arrs...), median(vcat(arrs...))))
end


nothing