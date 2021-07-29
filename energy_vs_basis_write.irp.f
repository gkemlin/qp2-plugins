program energy_vs_basis_write
  implicit none

  BEGIN_DOC
  Add basis, Nb, energy to a csv file which contains results for different
  basis
  END_DOC

  double precision D

  D = abs(nucl_coord(1, 1) - nucl_coord(2, 1))

  open(0, file = "nrj_basis.csv", position='append')
  write(0, '(1000(A15, ",", I0, ",", F0.4, ",", F0.10))') basis, ao_num, D, hf_energy

end
