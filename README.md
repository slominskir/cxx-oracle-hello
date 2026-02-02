# cxx-oracle-hello
Hello World Oracle Instant Client

# Overview
Hello World of C++ with Oracle Instant Client 21 (for Oracle 19+) on AlmaLinux 9.

# Quick Start
```
git clone https://github.com/slominskir/cxx-oracle-hello.git
cd cxx-oracle-hello
docker compose up
...

docker exec it dev bash

g++ -o hello hello.cpp -I/usr/include/oracle/21/client64 -L/usr/lib/oracle/21/client64/lib -locci -lclntsh -D_GLIBCXX_USE_CXX11_ABI=0

./hello

```

# C++11 Compatibility
To use C++11 (g++5.3 or greater) you must link to `libocci_gcc53.so.21.1` instead of default `libocci.so.21.1`.

To use default `libocci.so.21.1` (pre-C++11 ABI with a C++11 / g++5.3 or greater) compiler, use compiler flag `-D_GLIBCXX_USE_CXX11_ABI=0`

- https://docs.oracle.com/en/database/oracle/oracle-database/21/rnrdm/linux-platform-issues.html
- https://docs.oracle.com/en/database/oracle/oracle-database/21/lacli/installation-requirements-for-programming-environments-for-linux-x86-64.html

> **Aside**: There are [two options](https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html) for InstantClient version 21: minor version 21 and minor version 12.  Minor version 12 is explicitly listed as for use with REHL9.  That's what we're using.

> **Aside**: With CMake, using libocci.so.21.1 instead of libocci_gcc53.so.21.1 with AlmaLinux9 resulted in error: `ORA-12163: TNS:connect descriptor is too long` despite use of EasyConnect and no tnsnames.ora - this is the wild goose chase that led to a simple hello world reproducer, where I got `ORA-24960: the attribute  OCI_ATTR_USERNAME`, which is similar, but different and led to a forum on the topic.

Oracle also recommends compiler flag `-Wno-narrowing` in either case.

# Notes
- Is `dnf install libaio-devel` needed?  Nope, `libaio` is though.
- If you add `-D_GLIBCXX_USE_CXX11_ABI=0` to compile command then runtime works ([StackOverflow 42890553](https://stackoverflow.com/questions/42890553/ubuntu-ora-24960-the-attribute-oci-attr-username-is-greater-than-the-maximum-al)).  Compile time works either way.  Without flag runtime fails with odd misleading errors.

Without CXX11_ABI=0 you get:
```
[root@dev ~]# ./hello
Error: ORA-24960: the attribute  OCI_ATTR_USERNAME is greater than the maximum allowable length of 255q$&n_�
                                                                                                            ��PMbPMbService Switch config file. This file should be
# sorted with the most-uAcannot open shared object file/usr/lib64/libnuma.so.1,!��g Cpenabled!Cp��g CpA���;�lb�Pb`Y1��g CpPNb`��Cp�Tb�/root/oradiag_rootuser_roothost_3014851359_110���$Cp�[�"Cp \�"Cp����!Cp ҌCppTb1Cp��g Cp�Tb�Pb8��Cp!��Xd�␦Cp�Tb!@��CpҌCp�Tb!�Mb�Mb%&n_�
                                                                                                                                                                                                                                                                            ��ardwareCorrupted:     0 kB
AnonHugePages:         0 kB
ShmemHugePages:        0 kB
ShmemPmdMapped:        0 kB
FileHugePages:         0 kB
FilePmdMapped:         0 kB
Unaccepted:            0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
Hugetlb:               0 kB
DirectMap4k:      113664 kB
DirectMap2M:    16662528 kB
DirectMap1G:    24117248 kB
ty:                 0 kB
Writeback:             0 kB
AnonPages:        717280 kB
Mapped:           787544 kB
Shmem:            626604 kB
KReclaimable:     125920 kB
Slab:             243876 kB
SReclaimable:     125920 kB
SUnreclaim:       117956 kB
KernelStack:        9920 kB
PageTables:        59956 kB
SecPageTables:         0 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:    36372052 kB
Committed_AS:    5075368 kB
VmallocTotal:   34359738367 kB
VmallocUsed:       41000 kB
VmallocChunk:          0 kB
Percpu:      !FADRLientt�/root/oradiag_rootuser_roothost_3014851359_110�@�����W$Cp��fP1sss1(N   �=w(NI�=w(N��=w(N��=w(N��=w(NI�=w(N�h>w(N       �=w(NI�=w(Nid>w(N��=w(N��=w(N��=w(N��=w(N��?9��(N)�=w(N��=w(Nɦ=w(NI�=w(N��?9��(Ni�=w(N��=w(N)�=w(N��=w(NI�=w(NɄ=w(N��=w(N��=w(NI�=w(N��=w(N��=w(N��=w(NIi>w(N�k>w(N�h>w(N��?9��(N��=w(N��=w(N)�=w(N��=w(NI�=w(N)�=w(N��?9��(N e>w(N)g>w(NId>w(N��=w(NI�=w(N��=w(N��=w(N       �=w(N��?9��(NI�=w(N��=w(N��=w(N)�=w(N��=w(N)�=w(N�h>w(NI�=w(N��=w(N�d>w(N��=w(N)�=wp]bfiles1�_bsystemdap]b@�_b@�ab@Adb�_b@1�abdns1�dbmyhostnamea`db�_b@�db@�fb@Qib�_b@p]b@A`ibp]b@Q�ib�_b@�db@1�fbnisA�ib@jb@�/`�b��$Cp��d�ofX�c��cPc�Pc�Qc�Rcxqcwrc@yc?zc(ac'bc�hc�icH�cG�chZc�?c0nb�of�of��@diag pga ����@�Oc��d�_fP?c��� pga heap ����  ?c��c �nb�nb �nb�nb`f`foob   ob ob @8ob8ob �PobPob hobhob �ob�ob �ob�ob�ob�ob �ob�ob  �ob�ob @�ob�ob �pbpb��d��drb��0 sga heap ����  @�d@�d �pb�pb �pb�pb�pb�pb �pb�pb  qbqb @(qb(qb �@qb@qb XqbXqb pqbpqb �qb�qb�qb�qb �qb�qb  �qb�qb @�qb�qb �rbrb
                                                                                                                                                                                   �HrbHrb
                                                                                                                                                                                          � rb rb �rb�rbvbvbHvbHvbxvbxvb�vb�vb�vb�vb�vb�vwwb wb wb8wb8wbPwbPwbhwbhwb�wb�wb�wb�wb�wb�wb�wb�wb�wb�wb�wb�wbxbxb(xb(xb@xb@xbXxbXxb�xb�xb�xb�xb�xb�xb�xb�xb�xb�xbybyb
...
```
