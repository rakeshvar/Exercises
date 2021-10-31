
function quicksort!(a, x=1, y=length(a))
    if x < y
        i = x-1
        for j in x:y
            if (a[j] < a[y]) || (j==y)
                i = i+1
                a[j], a[i] = a[i], a[j]
            end
        end
        
        quicksort!(a, x, i-1)
        quicksort!(a, i+1, y)        
    end
end
