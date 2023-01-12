struct SpanError <: Exception
    msg::String
end

struct TileError <: Exception
    msg::String
end

struct WeightsError <: Exception
    msg::String
end

check_span(seqlength, windowspan) =
    windowspan > seqlength && SpanError(seqlength, windowspan)

check_trimspan(seqlength, windowspan) =
    windowspan > (seqlength - windowspan + 1) && TrimSpanError(seqlength, windowspan)

check_tile(seqlength, tilespan) =
    tilespan > seqlength && TileError(seqlength, tilespan)

check_tilespan(seqlength, tilespan) =
    tilespan > (seqlength - windowspan + 1) && TrimSpanError(seqlength, tilespan)

check_weights(nweights, windowspan) =
    nweights != windowspan && WeightsError(nweights, windowspan)

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

function WeightsError(nweighting, windowspan)
    str = string("Bad weights length (", nweighting, ") != for window length (", windowspan, ").")
    err = WeightsError(str)
    throw(err)
end

