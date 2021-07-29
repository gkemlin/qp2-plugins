# plot orbitals from QP2 that are parsed in `parse_orbitals.jl`
using GLMakie

include("parser_orbitals.jl")

function iso(x, isovalue, isorange)
    abs(x) > (isovalue-isorange) && abs(x) < (isovalue+isorange)
end

#  r = LinRange(-3.2, 3.2, 41)
#  orbital_1 = [ ϕ(1, [x,y,z]) for x = r, y = r, z = r].^2
#  volume(orbital_1, algorithm = :iso, isorange = 0.0005, isovalue = 0.002, transparency=true)

r = LinRange(-5, 5, 41)
orbital_2 = [ ϕ(2, [x,y,z]) for x = r, y = r, z = r].^2
volume(orbital_2, algorithm = :iso, isorange = 0.0005, isovalue = 0.002, transparency=true)

#  r = LinRange(-5, 5, 41)
#  density = orbital_1 .+ orbital_2
#  volume(density, algorithm = :iso, isorange = 0.0005, isovalue = 0.002, transparency=true)



