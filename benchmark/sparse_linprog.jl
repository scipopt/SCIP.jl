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
