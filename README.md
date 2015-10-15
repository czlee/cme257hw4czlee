# cme257hw4czlee: Julia sets

This package contains one function:

    juliaset{T<:Real}(R::Function, x::AbstractVector{T}, y::AbstractVector{T},
            n_iter=50, escape_tol=1e10)

`R(z)` is expected to be a rational function of the form `P(z)/Q(z)`, where `P`
and `Q` are polynomials in `z` without common divisors.

The function returns an `length(x)`-by-`length(y)` matrix whose `[i,j]`-th
element denotes the number of iterations it took the norm of `z[i,j] = x[i] +
im*y[j]` to exceed `escape_tol`, where in each iteration `z[i,j]` is replaced by
`R(z[i,j])`. If it takes longer than `n_iter` iterations, the relevant element
of the returned matrix will be `n_iter+1`.

## Example
``` julia
using cme257hw4czlee
using PyPlot
R = z -> (5z^4 + 3z^2 + z) / (z^2 - 9z + 3)
x = -5:0.025:5
y = -5:0.025:5
J = juliaset(R, x, y);
matshow(J)
```