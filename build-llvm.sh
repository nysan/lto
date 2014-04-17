#!/bin/sh
# Static library demo
set -e
# Create static library's object file, libhello-static.o.
# I'm using the name libhello-static to clearly
# differentiate the static library from the
# dynamic library examples, but you don't need to use
# "-static" in the names of your
# object files or static libraries.
CFLAGS="-flto -O3 -Wall -fno-exceptions -funwind-tables -finline-functions -fgnu89-inline -fno-keep-inline-functions"

clang $CFLAGS -c -o libhello-static.o libhello.c

# Create static library.

ar rcs libhello-static.a libhello-static.o

# At this point we could just copy libhello-static.a
# somewhere else to use it.
# For demo purposes, we'll just keep the library
# in the current directory.

# Compile demo_use program file.

clang  $CFLAGS -c hello.c -o hello.o

# Create demo_use program; -L. causes "." to be searched during
# creation of the program.  Note that this command causes
# the relevant object file in libhello-static.a to be
# incorporated into file demo_use_static.

clang $CFLAGS -Wl,--as-needed  -o demo_llvm hello.o -L. -lhello-static

# Execute the program.

./demo_llvm
