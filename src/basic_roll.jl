#=
    Basic rolls neither provide padding nor offer tapering.
    A basic roll always drops those data elements at the 
      start of the data which cannot be completely resolved
      under the windowed function: this eliminates the initial
      (windowsize - 1) evaluands from the result.
   The initial (windowsize - 1) data elements are used to
      resolve the first value of the windowed function.

   for example
       data = [1,2,3,4,5,6]; windowspan = 4; fn = mean;
       datalen = length(data) # == 6;
       max_addtospan = datalen - windowspan # == 2
       addtospan = 0:max_addtospan

       the result contains three means
           mean(data[1+0:windowspan+0])
           mean(data[1+1:windowspan+1])
           mean(data[1+2:windowspan+2])

       result = map(i->fn(data[1+i:windowspan+i]), addtospan)
=#

