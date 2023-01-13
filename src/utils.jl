#=

- nrows
- ncols
- rts (returned types)
- nrts (length(rts))

- isview
- asview
- viewall

=#

"""
    nrows(x)

count the rows of x
""" nrows

"""
    ncols(x)

count the columns of x
""" ncols

nrows(x::AbstractVector) = length(x)
nrows(x::AbstractArray) = size(x)[1]
nrows(x) = isempty(size(x)) ? 1 : size(x)[1]

ncols(x::AbstractVector) = 1
ncols(x::AbstractArray) = size(x)[2]
ncols(x) = isempty(size(x)) ? 1 : size(x)[2]

# returned types (rough) and tally(returned types)
# more specific when `typs` are provided

@inline rts(fn) = Base.return_types(fn)[max(1, end-1)]
@inline rts(fn, typs) = Base.return_types(fn, typs)[max(1, end-1)]

@inline nrts(fn) = max(1, length(rts(fn).parameters))
@inline nrts(fn, typs) = max(1, length(rts(fn,typs).parameters))

# views

@inline isview(data) = isa(data, SubArray) 
@inline asview(data) = isview(data) ? data : viewall(data)

@inline viewall(data::A) where {T, A<:AbstractArray{T,1}} = view(data, :)
@inline viewall(data::A) where {T, A<:AbstractArray{T,2}} = view(data, :, :)
@inline viewall(data::A) where {T, A<:AbstractArray{T,3}} = view(data, :, :, :)
@inline viewall(data::A) where {T, A<:AbstractArray{T,4}} = view(data, :, :, :, :)

@inline viewall(data::Tuple{Vararg{T,N}}) where {T,N} = viewall(convert(Vector{T}, data))
Base.convert(::Type{Vector{T}}, tup::Tuple{Vararg{T,N}}) where {T,N} = [ tup... ]

