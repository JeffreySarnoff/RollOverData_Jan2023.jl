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

# returned types (rough)

@inline rts(fn) = Base.return_types(fn)[max(1, end-1)]
@inline rts(fn, typs) = Base.return_types(fn, typs)[max(1, end-1)]

@inline nrts(fn) = max(1, length(rts(fn).parameters))
@inline nrts(fn, typs) = max(1, length(rts(fn,typs).parameters))

