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
       psnrm

using StatsBase, VectorizedStatistics,
      Accumulators, MovingRings

include("utils.jl")
include("roll.jl")
include("run.jl")

end  # RollOverData

