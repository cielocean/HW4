#!/bin/bash

#running test
echo "running tests in regfile.t.v ..."
iverilog -o regfile.o regfile.t.v
./regfile.o
rm regfile.o