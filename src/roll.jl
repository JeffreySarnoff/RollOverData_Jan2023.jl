roll(data, fn::Function) = map(fn, data)

function roll(data, windowspan::Integer, fn::Function;  
              padfirst::Union{Bool,Int}=false, padlast::Union{Bool,Int}=false, padding=missing)
    datarows = nrows(data)
    trimrows = rolledrows(datarows, windowspan)
    trimrows >= windowspan || TrimSpanError(trimrows, windowspan)

    rows_trimmed = trimmedrows(windowspan)
    rettype = rts(fn, (eltype(data),))
    
    padfirst = padfirst == 0 ? false : padfirst
    padlast = padlast == 0 ? false : padlast
  
    if padfirst && padlast
       padbgn = div(trimrows+1, 2)
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
    if padfirst
       
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
