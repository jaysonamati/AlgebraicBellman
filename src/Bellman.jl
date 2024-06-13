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
    true
end

function isOptPolSeq()
    true
end

function isBellman()
    true
end

function bi(t::Integer, n::Integer, sdp::SDP)
    policySeq = PolicySeq(t,n,[])
    policies_in_seq = []
    for i in n:-1:1
        # Starting from the last state add a policy that maximizes reward
        policy = sdp.policy()
        available_actions = policy.actions
        optimal_action = Ctrl
        highest_reward = 0
        for act in enumerate(available_actions)
            # Assign highest values action to optimal_action
        end
        # Add optimal policy to the policies of PolicySeq
        # Move to the "next" state
    end
    return policySeq
end

end