module RollOverData

export Seq, seq,
       roll, run,
       window, slide, tile,
       # from StatsBase
       nobs, mean, var, std, skewness, kurtosis

using StatsBase, VectorizedStatistics,
      Accumulators, MovingRings

end  # RollOverData

