module cme257hw4czlee

export juliaset

"""
Returns an `length(x)`-by-`length(y)` matrix whose `[i,j]`-th element denotes
the number of iterations it took the norm of `z[i,j] = x[i] + im*y[j]` to exceed
`escape_tol`, where in each iteration `z[i,j]` is replaced by `R(z[i,j])`.
If it takes longer than `n_iter` iterations, the relevant element of the
returned matrix will be `n_iter+1`.
"""
function juliaset{T<:Real}(R::Function, x::AbstractVector{T}, y::AbstractVector{T}, n_iter=25, escape_tol=1e10)
    Z = repmat(x,1,length(y)) + im*repmat(y',length(x),1)
    notescaped = n_iter+1
    A = notescaped*ones(Int, length(x), length(y))
    for i in 1:n_iter
        Z = map(R, Z)
        escaped_this_round = map((z,a) -> abs(z) > escape_tol && a == notescaped, Z, A)
        A[escaped_this_round] = i
    end
    return A
end

end # module
