
function roll(data, windowspan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    datarows >= windowspan || throw(SpanError(datarows, windowspan))
    slider = roll_sliding(datarows, windowspan)
end

function roll(data, windowspan::Integer, tilespan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    trimrows = trimmedrows(windowspan)
    trimrows >= windowspan || throw(SpanError(datarows, windowspan))
    trimrows >= tilespan || throw(TileError(trimrows, tilespan))
    window_reps = divrem(trimrows, windowspan)
    tile_reps = divrem(trimrows, tilespan)
    
    tiler  = roll_tiling(datarows, windowspan, tilespan)
end
