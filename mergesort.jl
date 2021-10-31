
function mergesort(a)
	len = length(a)
	if len <= 1
		# println(a, " → ", a)
		return a
	elseif len == 2
		b = a[1] > a[2] ? [a[2], a[1]] : a
		# println(a, " → ", b)
		return b
	end

	n = floor(Int, len/2)
	l = a[1:n]
	r = a[(n+1):end]
	ls = mergesort(l)
	rs = mergesort(r)
	il, ir, nl, nr = 1, 1, n, len-n
	i = 1
	b = zero(a)
	while i <= len
		if il > nl
			b[i:end] = rs[ir:end]
			break
		elseif ir > nr
			b[i:end] = ls[il:end]
			break
		elseif ls[il] < rs[ir]
			b[i] = ls[il]
			il += 1
		else	
			b[i] = rs[ir]
			ir += 1
		end
		i += 1
	end
	# println(a, " → ", b)
	return b
end