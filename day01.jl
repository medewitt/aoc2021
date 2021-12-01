# starting with julia

using Pkg; Pkg.instantiate(); Pkg.activate(".")
using RCall
using CSV
using DataFrames
using ShiftedArrays
# get the data

dat_raw = DataFrame(CSV.File("data/day01.txt" , header = 0))

show(dat_raw)

lagcol = combine(dat_raw, :Column1 => Base.Fix2(lag, 2) => :Column1Lag)

dat_raw[:,:Column1Lag] = lagcol.Column1Lag

dat_raw[:,:Increase]  = dat_raw.Column1 .> dat_raw.Column1Lag

show(dat_raw)

dat__clean = dropmissing(dat_raw, :Column1Lag)

dat__clean