L(n, m=10) = collect(reshape((1:n^2).%m, n, n))
M(n, m=9) = rand(0:m, n, n)

function detm!(x::AbstractMatrix{F}) where F
	n = size(x, 1)
	n == 1 && return x[]
	
	ipivot = 0
	for i in 1:n
		if x[i, 1] != 0
			ipivot = i
			break
		end
	end
	if ipivot == 0
		return zero(F)
	end
	
	for i in 1:n
		i == ipivot && continue
		x[i, 1] == 0 && continue
		v = x[i, 1]/x[ipivot, 1]
		x[i, 1] = 0
		for k in 2:n
			x[i, k] -= v*x[ipivot, k]
		end
	end

	y = @view x[1:end .!= ipivot, 2:end]
	if x[ipivot, 1] ≈ zero(F)
		return zero(F)
	else
		(iseven(ipivot) ? -one(F) : one(F))*x[ipivot, 1]*detm!(y)
	end
end

function det3by3(x)
	n = size(x, 1)
	mo(m) = (m-1)%n+1
	sum(0:n-1) do d
		prod(1:n) do i
			x[mo(i+d), i]
		end
	end -
	sum(0:n-1) do d
		prod(1:n) do i
			x[mo(n+1-i+d), i]
		end
	end
end

function det3(x)
	n = size(x, 1)
	mo(m) = (m-1)%n+1
	s = ""
	t = ""
	
	for d in 0:n-1
		s *= "\n+"
		t *= "\n+"
		for i in 1:n
			s *= " * x[$(mo(i+d)), $i]"
			t *= " * $(x[mo(i+d), i])"
		end
	end 
	for d in 0:n-1
		s *= "\n-"
		t *= "\n-"
		for i in 1:n
			s *= " * x[$(mo(n+1-i+d)), $i]"
			t *= " * $(x[mo(n+1-i+d), i])"
		end
	end 
	print(s, t)
end