# create projects for all basis in given basis list file
# takes 4 arguments :
# 1 = basis list file
# 2 = molecule name
# 3 = distances file

# create csv file if it does not exists
FILE=./nrj_basis.csv
if [ -f "$FILE" ]; then
    echo "$FILE already exists."
else
    echo "creating $FILE..."
    echo "basis          ,Nb,D    ,energy" > $FILE
fi

# create all projects for the given basis and D lists
while read D; do
    echo "2
H2 molecule
H    $D  0.0   0.0
H   -$D  0.0   0.0" > $2.xyz
    while read basis; do
        echo "Creating $2, basis = $basis, D = $D"
        qp create_ezfio -b $basis $2.xyz -o "$2_$basis-$D"
    done < $1
done < $3
