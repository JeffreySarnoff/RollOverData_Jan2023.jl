struct SpanError <: Exception
    msg::String
end

struct TileError <: Exception
    msg::String
end

struct WeightError <: Exception
    msg::String
end

function SpanError(seqlength, windowspan)
    str = string("Bad window span (", windowspan, ") for length (", seqlength, ").")
    err = SpanError(str)
    throw(err)
end

function TrimSpanError(seqlength, windowspan)
    str = string("Bad window span (", windowspan, ") for trimmed length (", seqlength, ").")
    err = SpanError(str)
    throw(err)
end

function TileError(seqlength, tilespan)
    str = string("Bad tile span (", tilespan, ") for length (", seqlength, ").")
    err = TileError(str)
    throw(err)
end

function TrimTileError(seqlength, tilespan)
    str = string("Bad tile span (", tilespan, ") for trimmed length (", seqlength, ").")
    err = TileError(str)
    throw(err)
end

function WeightError(nweighting, windowspan)
    str = string("Bad weights length (", nweighting, ") for window length (", windowspan, ").")
    err = WeightError(str)
    throw(err)
end

