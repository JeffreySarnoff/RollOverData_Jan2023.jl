struct Pad{T}
    padding::T
    padfirst::Bool
    padlast::Bool
    padfirstn::Int
    padlastn::Int
end

Pad(padding::T; padfirst::Bool=false,padlast::Bool=false,padfirstn::Int=0,padlastn::Int=0) where {T} =
    Pad{T}(padding, padfirst, padlast, padfirstn, padlastn)

NoPad = Pad(nothing)

roll(data, fn::Function) = map(fn, data)

function roll(data, windowspan::Integer, fn::Function; padding::Pad=NoPad)
    datarows = nrows(data)
    trimrows = rolledrows(datarows, windowspan)
    trimrows >= windowspan || TrimSpanError(trimrows, windowspan)

    rows_trimmed = trimmedrows(windowspan)
    rettype = rts(fn, (eltype(data),))
    
    padfirst = padding.padfirst || padding.padfirstn > 0
    padlast = padding.padlast || padding.padlastn > 0
  
    if padding.padfirst && padding.padfirstn == 0
       if padding.padlastn == 0
           padding.padfirstn = rows_trimmed
       else
           padding.padfirstn = rows_trimmed - padding.padlastn
       end
    elseif padding.padlast && padding.padlastn == 0
       if padding.padfirstn == 0
           padding.padlastn = rows_trimmed
       else
           padding.padlastn = rows_trimmed - padding.padfirstn
       end
    end
  
    if padding.padfirst && padding.padlast
       padb = div(trimrows+1, 2)
       padend = rows_trimmed - padbgn
       result  = Vector{Union{rettype, typeof(padding)}}(undef, datarows)
       result[1:padbgn] .= padding
       result[datarows-padend:datarows] .= padding
       result[padbgn+1:datarows-padend-1] .= zero(rettype)
    end
    
    if !padfirst && !padlast
       result  = Vector{rettype}(undef, rows_trimmed)
    else
       result  = Vector{rettype}(undef, datarows)
    end
  
    if padfirst || padlast
       result = zeros(eltype(data), datarows)
    else
       result = zeros(eltype(data), trimrows)
    end
       
    slider = roll_sliding(datarows, windowspan)
end

function roll(data, windowspan::Integer, tilespan::Integer, fn::Function;
              padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    trimrows = rolledrows(datarows, windowspan)
    trimrows >= windowspan || TrimSpanError(trimrows, windowspan)
    trimrows >= tilespan || TrimTileError(trimrows, tilespan)

    window_reps = divrem(trimrows, windowspan)
    tile_reps = divrem(trimrows, tilespan)
    
    tiler  = roll_tiling(datarows, windowspan, tilespan)
    
    window_reps, tile_reps
end
