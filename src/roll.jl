
function roll(data, windowspan::I, fn::F; padfirst=false, padlast=false, padding=missing) where {I<:Integer, F<:Function}
    datarows = nrows(data)
    datarows >= windowspan || throw(SpanError(datarows, windowspan))
    slider = roll_sliding(datarows, windowspan)
end

function roll(data, windowspan::I, tilespan::I, fn::F; padfirst=false, padlast=false, padding=missing) where {I<:Integer, F<:Function}
    datarows = nrows(data)
    datarows >= windowspan || throw(SpanError(datarows, windowspan))
    tiler  = roll_tiling(datarows, windowspan, tilespan)
end
