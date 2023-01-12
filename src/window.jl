#=
   datarows = trimmedrows(windowspan) + rolledrows(datarows, windowspan)

   rowcounts(datarows, windowspan) = (givenrows = datarows, 
                                      windowedrows = rolledrows(datarows, windowspan), 
                                      droppedrows = trimmedrows(windowspan))
=#

rolledrows(datarows, windowspan) = datarows - trimmedrows(windowspan)
trimmedrows(windowspan) = windowspan - 1

roll_sliding(datarows, windowspan) = 1:1:rolledrows(datarows, windowspan)
roll_tiling(datarows, windowspan) = 1:windowspan:rolledrows(datarows, windowspan)
roll_tiling(datarows, windowspan, tilespan) = 1:tilespan:rolledrows(datarows, windowspan)

run_sliding(datarows, windowspan) = 1:1:datarows
run_tiling(datarows, windowspan) = 1:windowspan:datarows
run_tiling(datarows, windowspan, tilespan) = 1:tilespan:datarows









