#=
   datarows = rows_windowed(datarows, windowspan) + rows_dropped(windowspan)

   rowcounts(ndatarows, windowspan, tilespan = 1) = 
       ( given = ndatarows,
         windowed = rows_windowed(ndatarows, windowspan), 
         dropped = rows_dropped(windowspan),
         tiled = rows_tiled(ndatarows, tilespan),
         untiled = rows_untiled(ndatarows, tilespan)
       )
=#

rows_windowed(ndatarows, windowspan) = ndatarows - rows_dropped(windowspan)
rows_tiled(ndatarows, tilespan=1) = ndatarows - rows_untiled(ndatarows, tilespan)
rows_dropped(windowspan) = windowspan - 1
rows_untiled(ndatarows, tilespan=1) = rem(ndatarows, tilespan)

function rows_unmatched(ndatarows, windowspan, tilespan)
    ntiles, untileds = divrem(ndatarows, tilespan)
    nwindows, unwindoweds = divrem(ndatarows, windowspan)
    ntiles2, untileds2 = divrem(ndatarows - unwindoweds, tilespan)
    nwindows2, unwindoweds2 = divrem(ndatarows - untileds, windowspan)
    nums1 = (tiles=ntiles, windows=nwindows, untiled = untileds, unwindowed = unwindoweds)
    nums2 = (tiles=ntiles2, windows=nwindows2, untiled = untileds2, unwindowed = unwindoweds2)
    (nums1, nums2)
end

roll_sliding(datarows, windowspan) = 1:1:rolledrows(datarows, windowspan)
roll_tiling(datarows, windowspan) = 1:windowspan:rolledrows(datarows, windowspan)
roll_tiling(datarows, windowspan, tilespan) = 1:tilespan:rolledrows(datarows, windowspan)

run_sliding(datarows, windowspan) = 1:1:datarows
run_tiling(datarows, windowspan) = 1:windowspan:datarows
run_tiling(datarows, windowspan, tilespan) = 1:tilespan:datarows









