

eval_continued(arr::Vector{T}) where T<:Number
    n = length(arr)
    val = arr[end]
    for i in (n-1):-1:1
        val = arr[i] + 1/var
    end
    val
end
