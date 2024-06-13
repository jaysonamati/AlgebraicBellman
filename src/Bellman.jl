module Bellman

using AlgebraicDynamics

include("SDPCore.jl")


using .SDPCore

## Val : ℝ
## M : Vector
## t n : ℕ
## State : X t
## Policy : X t → Y t n
## next : X t → Y t n → X (suc t)
## reward : X t → Y t n → X (suc t) → Val
## PolicySeq : Set

export bi

function optExt(decisionStep::Integer,ps::PolicySeq, policies::Vector{Policy})
    policy = Policy
    policies_in_seq = ps.policies
    highest_val = 0
    for (i,pol) in enumerate(policies)
        currentState = pol.currentState
        action       = pol.control
        nextState    = nexts(decisionStep, currentState, action)[0]
        policy_val   = reward(decisionStep, currentState, action, nextState)
        if policy_val > highest_val
            policy = Policy(currentState,action)
        else
            policy
        end 
        append!(policies_in_seq, pol)
    end
    return policy
end

function isOptExt()
    return false
end

function isOptPolSeq()
    false
end

function isBellman()
    false
end

function bi(t::Integer, n::Integer, sdp::SDP)
    policySeq = []
    # t = 0
    for i in n:-1:1
        for j in 1:t
            #?
        end
    end
    return policySeq
end

end