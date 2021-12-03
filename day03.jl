using Pkg; Pkg.instantiate(); Pkg.activate(".")
using CSV
using DataFrames
A = Array{Float64}(undef, 12, 5)
open("data/day03.txt") do f
 
    # line_number
  line = 1  
 
  # read till end of file
  while ! eof(f) 
 
     # read a new / next line for every iteration          
     s = readline(f)
     
     for i in 1:5
        println("$s")
        A[line,i] = parse(Int, SubString(s, i, i))
     end

     line += 1
     println("$line . $s")
  end
 
end

show(A)

gamma_one = 0
gamma_zero = 0

for i in size(A)[2]
    if A[i,1] > 0
        gamma_one += 1
    else
        gamma_zero += 1
    end
end

gamma_one
gamma_zero