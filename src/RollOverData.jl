module RollOverData

export Seq, seq,
       roll, run,
       window, slide, tile,
       # from StatsBase
       nobs, minimum, maximum, extrema, span,
       mean, var, std, skewness, kurtosis,
       genmean, genvar, geomean, harmmean,
       median, middle, mode,
       mad, variation,
       autocor, autocov,
       entropy, 
       # from StatsBase f(x,y)
       maxad, meanad, msd, rmsd,
       cor, crosscor, corkendall, corspearman,
       cov, crosscov,
       crossentropy,
       psnrm, gkldiv

using StatsBase, VectorizedStatistics,
      MovingRings, IncrementalAccumulators

include("exceptions.jl")
include("utils.jl")
include("window.jl")
include("basic_rolls.jl")
include("roll.jl")
include("run.jl")

end  # RollOverData

