module SDPCore

using Catlab;

export Policy
export PolicySeq
export SDP
export State
export Ctrl

export reward
# Sequential Decision Problmes

## t n : ℕ
## State : X t
## Policy : Y t n
## Val : ℝ

## We have to define what State is, what Policy is and what an action is, in a general manner..
## 
struct Ctrl{Y}
  ctrl::Y
end

## Try to use UnionAll Types for this for more flexibility
mutable struct State{X}
  x::X
end

mutable struct Policy{X, Y}
  currentState::State{X}
  control::Ctrl{Y}
end

function actions(currentState::State, policy::Policy)
  return policy.controls
end

function optimalAction(controls::Vector{Ctrl}, current_state::State)
end

function nexts(decisions::Integer, current_state::State, applied_action::Ctrl)
  possibleNexts = []
  possibleNexts
end

mutable struct PolicySeq{T<:Integer,N<:Integer, X, Y}
  decisions::T
  state_steps::N
  # Maybe we should have a Val for a PolicySeq
  policies::Vector{Policy{X, Y}}
  function PolicySeq{T, N, X, Y}(decisions::T, state_steps::N, policies::Vector{Policy{X, Y}}) where T<:Integer where N<:Integer where X where Y
    new(decisions, state_steps, policies)
  end
end

struct Trajectory{X,Y}
  steps::Vector{State{X}}
  controls::Vector{Ctrl{Y}}
end

function trj(ps::PolicySeq, start_state::State)
  return Trajectory
end

function val(ps::PolicySeq, start_state::State)
  total_val = 0
  return total_val
end

function reward(current_decision_step::Integer, current_state::State, action_at_state::Ctrl, next_state::State)
  action_reward = 0
  return action_reward
end

mutable struct SDP{T,N,X,Y,V}
  t::T
  n::N
  state::Function
  states::Vector{State{X}}
  controls::Vector{Ctrl{Y}}
  nexts::Function
  policy::Function
  reward::Function
end

end