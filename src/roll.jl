
function roll(data, windowspan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    trimrows = rolledrows(datarows, windowspan)
    trimrows >= windowspan || TrimSpanError(trimrows, windowspan)
    slider = roll_sliding(datarows, windowspan)
end

function roll(data, windowspan::Integer, tilespan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    trimrows = rolledrows(datarows, windowspan)
    trimrows >= windowspan || TrimSpanError(trimrows, windowspan)
    trimrows >= tilespan || TrimTileError(trimrows, tilespan)

    window_reps = divrem(trimrows, windowspan)
    tile_reps = divrem(trimrows, tilespan)
    
    tiler  = roll_tiling(datarows, windowspan, tilespan)
    
    window_reps, tile_reps
end
