program parse_orbitals
  implicit none

  BEGIN_DOC
    Create files to parse the MO from the AO basis to the spatial basis.
  END_DOC

  integer:: mu, k
  call system("mkdir "//trim(basis))

  open(0, file = trim(basis)//"/ao_param.dat")
  write(0, '(A15)') basis
  write(0, '(I0)') ao_num
  write(0, '(I0)') ao_prim_num_max
  write(0, '(I0)') nucl_num

  open(1, file = trim(basis)//"/mo_coef.dat")
  do mu = 1, ao_num
    write(1, '(1000(F0.10, :","))') mo_coef(mu, :)
  end do

  open(2, file = trim(basis)//"/ao_coef_normalized.dat")
  do mu = 1, ao_num
    write(2, '(1000(F0.10, :","))') ao_coef_normalized(mu, :)
  end do

  open(3, file = trim(basis)//"/ao_expo.dat")
  do mu = 1, ao_num
    write(3, '(1000(F0.10, :","))') ao_expo(mu, :)
  end do

  open(4, file = trim(basis)//"/ao_power.dat")
  do mu = 1, ao_num
    write(4, '(1000(I10, :","))') ao_power(mu, :)
  end do

  open(5, file = trim(basis)//"/nuclei.dat")
  do k = 1, nucl_num
    write(5, '(1000(A2, ",", (1000(F0.10, :","))))') nucl_label(k), nucl_coord(k, :)
  end do

  open(6, file = trim(basis)//"/ao_nucl_index.dat")
  do mu = 1, ao_num
    write(6, '(I0)') ao_nucl(mu)
  end do

end program
