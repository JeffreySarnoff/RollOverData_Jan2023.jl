
#= ---- generalized sequence ---- =#

"""
    Seq
"""
const Seq = Union{AbstractArray{T,N},NTuple{N,T}} where {N,T}

"""
    seq
"""
seq(x::AbstractArray{T,N}) where {N,T} = x
seq(x::NTuple{N,T}) where {N,T} = x

