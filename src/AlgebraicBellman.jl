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
include("SDPCore.jl")

@reexport using .Bellman
@reexport using .SDPCore

export random_walk
export generation_next

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

# The generation example

B  = State(1)
BT = State(3)
GS = State(3)
GU = State(2)

B_B   = Ctrl("remain_at_b")
GU_B  = Ctrl("a")
GU_GU = Ctrl("a")
GU_BT = Ctrl("b")
BT_GS = Ctrl("c")
GS_GS = Ctrl("d")

function generation_state(n::Int64)
    if n == 1
        B
    elseif n == 2
        GU
    elseif n == 3
        GT
    elseif n == 4
        GS
end

function generation_next(state::State{Int64}, action::Ctrl{String})
    if state === B && action === B_B
        return [B]
    elseif state == BT && action == BT_GS
        return [GS]
    elseif state == GS && action == GS_GS
        return [GS]
    elseif state == GU && action == GU_GU
        return [GU]
    elseif state == GU && action == GU_BT
        return [BT]
    elseif state == GU && action == GU_B
        return [B]
    else
        println("Action or State is not defined for generation problem")
    end
end

function generation_policy(state::State{Int64})

end

function generation_reward(state::State{Int64}, action::Ctrl{String}, next_state::State{Int64})

end

generation_states   = [B, BT, GS, GU]
generation_controls = [B_B, GU_B, GU_GU, GU_BT, BT_GS, GS_GS]
generation_policy   = Policy(GU,GU_B)


generation_sdp = SDP(3,3,generation_state,generation_states, generation_controls, generation_next, generation_policy,generation_reward)



end
