include("parser_orbitals.jl")

Nx, Ny, Nz = 100, 100, 100
xmin, xmax = -6, 6
ymin, ymax = -6, 6
zmin, zmax = -6, 6

X = LinRange(xmin, xmax, Nx)
Y = LinRange(ymin, ymax, Ny)
Z = LinRange(zmin, zmax, Nz)
N_val = Nx * Ny * Nz

open("rho.vtk", "w") do f
    write(f, "# vtk DataFile Version 2.0 \n")
    write(f, "Data animation\n")
    write(f, "ASCII\n")
    write(f, "DATASET STRUCTURED_POINTS\n")
    write(f, "DIMENSIONS $(Nx) $(Ny) $(Nz)\n")
    write(f, "ASPECT_RATIO 1.0 1.0 1.0\n")
    write(f, "ORIGIN 0.0 0.0 0.0\n")
    write(f, "POINT_DATA $(N_val)\n")
    write(f, "SCALARS Field float\n")
    write(f, "LOOKUP_TABLE default\n")
    for x in X
        for y in Y
            for z in Z
                val = abs2(ϕ(1, [x,y,z])) + abs2(ϕ(2, [x,y,z]))
                #  val *= (abs(val) < 1.0e-9)
                write(f, string(val)*"\n")
            end
        end
    end
end
