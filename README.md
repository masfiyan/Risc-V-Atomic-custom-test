# Risc-V-Atomic-custom-test

```bash
riscv64-unknown-elf-gcc -march=rv32g -mabi=ilp32f -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles -DENTROPY=0xdeadbeef -DLFSR_BITS=9 -fno-tree-loop-distribute-patterns  -T link.ld atomic_test.S -o atomic_test
```


```bash
spike --isa=rv32g -d --log-commits atomic_test &> atomic_test.log
```
