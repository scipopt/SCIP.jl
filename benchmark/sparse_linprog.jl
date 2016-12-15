using JuMP
using SCIP

function create_model(n::Int)
    m = Model(solver=SCIPSolver())
    @variable(m, x[1:n] >= 0)
    for i=1:n
        @constraint(m, 2x[i] - x[n+1-i] >= i)
    end
    @objective(m, :Min, sum(x[i] for i=1:n))
    JuMP.build(m)
end

# do it once to precompile
create_model(2)

for n in [10,100,1000,2000]
    println(n)
    @time create_model(n)
end

# benchmark run by rschwarz on 2016/12/09, before 0f426f1:
# $ julia sparse_linprog.jl
# 10
#   0.002850 seconds (328 allocations: 23.344 KB)
# 100
#   0.003571 seconds (1.70 k allocations: 203.953 KB)
# 1000
#   0.055860 seconds (16.20 k allocations: 8.760 MB)
# 2000
#   0.222766 seconds (33.21 k allocations: 32.780 MB, 4.31% gc time)

# after 0f426f1:
# $ julia sparse_linprog.jl
# 10
#   0.002882 seconds (353 allocations: 25.938 KB)
# 100
#   0.002924 seconds (1.90 k allocations: 155.313 KB)
# 1000
#   0.004558 seconds (18.21 k allocations: 1.383 MB)
# 2000
#   0.006455 seconds (37.22 k allocations: 2.766 MB)
