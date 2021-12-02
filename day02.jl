# starting with julia
# https://dataframes.juliadata.org/stable/man/comparisons/
using Pkg; Pkg.instantiate(); Pkg.activate(".")
using RCall
using CSV
using DataFrames
using ShiftedArrays
# get the data

dat_raw = DataFrame(CSV.File("data/day02.txt" , header = 0))

rename!(dat_raw, [:direction, :steps])

direction_matrix = DataFrame(direction = ["forward", "up", "down"],
                            axis = [1,2,2],
                            value = [1,-1,1])

combined_data = leftjoin(dat_raw, direction_matrix, on = :direction)

combined_data.stepvalue = combined_data.value .* combined_data.steps

combine(groupby(combined_data, :axis), :stepvalue => sum)

