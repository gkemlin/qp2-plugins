Dmin = 1.4
Dmax = 1.4
Dstep = 0.005

BtoA = 0.529177210903

open("D_list.txt", "w") do f
    for D in Dmin:Dstep:Dmax
        write(f, "$(D*BtoA/2)\n")
    end
end
