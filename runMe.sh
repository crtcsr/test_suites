# Create the folder containing the final executables
mkdir test_lib

chmod +x runtests.sh
cp runtests.sh ./test_lib

cd test_lib
mkdir nist
mkdir testu01
cd ..

# Compile the nist test suite
cd nist_tests
make
chmod +x assess
chmod +x run_nist_tests.sh
cd ..

# Copy the files in final executable folder
cp ./nist_tests/assess ./test_lib/nist/
cp ./nist_tests/run_nist_tests.sh ./test_lib/nist/
rsync -avz ./nist_tests/templates ./test_lib/nist/

# Compile the TestU01 library and test runner
cd rap_testu01
chmod +x builder.sh
./builder.sh
chmod +x ./build/src/rap_testu01 
cd ..

# Copy the TestU01 runner in the new folder
cp ./rap_testu01/build/src/rap_testu01 ./test_lib/testu01

sudo mv ./test_lib /usr/local/test_lib