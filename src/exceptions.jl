struct SpanError <: Exception
    msg::String
end

struct TileError <: Exception
    msg::String
end

struct WeightError <: Exception
    msg::String
end

SpanError(seqlength, windowspan) =
    SpanError("\n\tBad window span ($windowspan) for length $seqlength.\n" )

TrimSpanError(seqlength, windowspan) =
    SpanError("\n\tBad window span ($windowspan) for trimmed length $seqlength.\n" )

TileError(seqlength, tilespan) =
    SpanError("\n\tBad tile span ($tilespan) for length $seqlength.\n" )

TrimTileError(seqlength, tilespan) =
    SpanError("\n\tBad tile span ($tilespan) for trimmed length $seqlength.\n" )

WeightError(nweighting, windowspan) =
    WeightError("\n\twindowspan ($windowspan) != length(weighting) ($nweighting))).\n" )

