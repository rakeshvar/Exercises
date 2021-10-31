
block(i) = (i<4) ? (1:3) : (i<7) ? (4:6) : (7:9)
block(i, j) = Iterators.product(block(i), block(j))

function doiter!(b::Matrix{Int})
    updated = false
    for j in 1:9
        for i in 1:9
            (b[i, j] > 0) && continue
            candidates = Set(1:9)
            for x in 1:9
                delete!(candidates, b[x, j])
                delete!(candidates, b[i, x])            end
            for (x, y) in block(i, j)
                delete!(candidates, b[x, y])            end
            if length(candidates) == 0
                display(b)
                error("No candidates: $i $j $candidates")            end
            if length(candidates) == 1
                b[i, j] = pop!(candidates)
                updated = true
    end end end
    updated
end

b = [
0 3 0   0 7 0   0 0 0;
6 0 0   1 9 5   0 0 0;
0 9 8   0 0 0   0 6 0;

8 0 0   0 6 0   0 0 3;
4 0 0   8 0 3   0 0 1;
7 0 0   0 2 0   0 0 6;

0 6 0   0 0 0   2 8 0;
0 0 0   4 1 9   0 0 5;
0 0 0   0 8 0   0 7 9;
]

bs = []
while doiter!(b)
    display(b)
end
