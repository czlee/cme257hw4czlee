using cme257hw4czlee
using Base.Test

# write your own tests here
@test all(x -> x == 101, juliaset(identity, -100:10:100, -100:10:100, 100))
@test all(x -> x == 1, juliaset(x -> 1e11, -100:10:100, -100:10:100, 100, 1e10))
