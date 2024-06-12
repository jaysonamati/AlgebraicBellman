""" Some description of this package
implement Backwards induction
apply it to 2-3 simple examples [generation problem, random walk, your favorite!]
More concretely:
compute an optimal policy sequence (for, say, n=3 steps)
compute all trajectories (or a sample)
sort them by probability
show the first few examples
say something about the computational cost (complexity)
You don’t need to prove correctness, or implement the dependent types, but you need to have a “generic” (polymorphic / parametric) solver so that a user can supply a sequential decision problem (X, Y, next, reward, …) and get a solution (a sequence of optimal policies).
You can assume that the state and action types are finite, so that the solution space also is finite.
Make sure to provide some test cases and expected outputs.
"""
module AlgebraicBellman

using Catlab
using Reexport

include("Bellman.jl")

@reexport using .Bellman

export random_walk

function random_walk(N, init::Int=0)
    trace = Int[init]
    for t in 1:N
        if randn() > 0
           push!(trace, trace[end] + 1)
        else
           push!(trace, trace[end] - 1)
        end
    end
 
    trace
 end

end
