# cxx-oracle-hello
Hello World Oracle Instant Client

# Overview
Hello World of C++ with Oracle Instant Client on AlmaLinux 9.

# Quick Start
```
git clone https://github.com/slominskir/cxx-oracle-hello.git
cd cxx-oracle-hello
docker compose up

docker exec it dev bash

g++ -o hello hello.cpp -I/usr/include/oracle/21/client64 -L/usr/lib/oracle/21/client64/lib -locci -lclntsh -D_GLIBCXX_USE_CXX11_ABI=0
./hello

```

# Notes
- Is `dnf install libaio-devel` needed?  Nope, `libaio` is though.
- If you add `-D_GLIBCXX_USE_CXX11_ABI=0` to compile command it works.  Otherwise, it doesn't and fails with odd misleading errors.