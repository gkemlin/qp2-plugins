# go through all projects to write energy and basis outputs
for d in */ ; do
    qp set_file $d
    qp run scf
    qp run energy_vs_basis_write
done

