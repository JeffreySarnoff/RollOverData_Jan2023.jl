#=
    Basic rolls neither provide padding nor offer tapering.
    A basic roll always drops those data elements at the 
      start of the data which cannot be completely resolved
      under the windowed function: this eliminates the initial
      (windowsize - 1) evaluands from the result.
   The initial (windowsize - 1) data elements are used to
      resolve the first value of the windowed function.
=#


     
=#
