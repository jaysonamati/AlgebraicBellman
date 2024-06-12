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

function optExt(ps::PolicySeq, policies::Vector{Policy})
    policies_in_seq = ps.policies
    highest_val = 0
    for (i,pol) in enumerate(policies)
        append!(policies_in_seq, pol)
    end
    return Policy
end

function bi(t::Integer, n::Integer, sdp::SDP)
    policySeq = []
    return policySeq
end

end