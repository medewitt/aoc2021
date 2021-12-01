# starting with julia

using Pkg; Pkg.instantiate(); Pkg.activate(".")
using RCall
using CSV
using DataFrames
using ShiftedArrays
# get the data

dat_raw = DataFrame(CSV.File("data/day01.txt" , header = 0))

show(dat_raw)

lagcol = combine(dat_raw, :Column1 => Base.Fix2(lag, 1) => :Column1Lag)

dat_raw[:,:Column1Lag] = lagcol.Column1Lag

dat_raw[:,:Increase]  = dat_raw.Column1Lag .< dat_raw.Column1

show(dat_raw)

dat_clean = dropmissing(dat_raw, :Column1Lag)

println("there are ",sum(dat_clean.Increase), " instances where there is an increase")