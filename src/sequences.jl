
#= ---- generalized sequence ---- =#

"""
    Seq
"""
const Seq = Union{AbstractArray{T,N}, NTuple{N,T}} where {N,T}

"""
    seq
"""
seq(x::AbstractArray{T,N}) where {N,T} = x
seq(x::NTuple{N,T}) where {N,T} = x

function rangeup(start, step, stop)
    span = stop - start
    multisteps, singlesteps = divrem( span, step )
    singlestepsup = fma(-multisteps, step, stop)
    startfrom = span - singlestepsup
    startfrom
end

    
subseq(x::Seq, subpart::LinRange
