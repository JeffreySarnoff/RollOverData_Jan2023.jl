
function roll(data, windowspan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    datarows >= windowspan || throw(SpanError(datarows, windowspan))
    slider = roll_sliding(datarows, windowspan)
end

function roll(data, windowspan::Integer, tilespan::Integer, fn::Function; padfirst=false, padlast=false, padding=missing)
    datarows = nrows(data)
    datarows >= windowspan || throw(SpanError(datarows, windowspan))
    tiler  = roll_tiling(datarows, windowspan, tilespan)
end
