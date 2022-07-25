# GDB bug minimal example

This project demonstrates a nice GDB bug (as of GDB 12.1), that results in a GDB
crash.

To repro:

1. install GCC ARM. this was tested with the following version:

   https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2?revision=ca0cbf9c-9de2-491c-ac48-898b5bbc0443&hash=B47BBB3CB50E721BC11083961C4DF5CA

2. run `make` to build the example app
3. you'll need a recent copy of gdb, for example, `sudo apt install
   gdb-multiarch` on Ubuntu 22.04 (at the time of this writing):

   ```plaintext
   ❯ apt show gdb-multiarch
   Package: gdb-multiarch
   Version: 12.0.90-0ubuntu1
   ```

4. run this command to see the bug:

   ```plaintext
   ❯ gdb-multiarch ./app.elf -batch --ex 'disassemble __malloc_unlock,+2'
   threads module disabled
   Dump of assembler code from 0x88b8 to 0x88ba:


   Fatal signal: Segmentation fault
   ----- Backtrace -----
   0x558bd8e38187 ???
   0x558bd8f3a599 ???
   0x558bd8f3a762 ???
   0x7f3a807de51f ???
           ./signal/../sysdeps/unix/sysv/linux/x86_64/libc_sigaction.c:0
   0x558bd929929d ???
   0x558bd9298f56 ???
   0x558bd929a4c2 ???
   0x558bd929a65a ???
   0x558bd8eca1a1 ???
   0x558bd8eca867 ???
   0x558bd8ecb08c ???
   0x558bd8ecc3cb ???
   0x558bd8e64a11 ???
   0x558bd8e65e19 ???
   0x558bd8e6d764 ???
   0x558bd91fda44 ???
   0x558bd9005cb5 ???
   0x558bd9005d84 ???
   0x558bd90077e3 ???
   0x558bd900830e ???
   0x558bd8d620df ???
   0x7f3a807c5d8f __libc_start_call_main
           ../sysdeps/nptl/libc_start_call_main.h:58
   0x7f3a807c5e3f __libc_start_main_impl
           ../csu/libc-start.c:392
   0x558bd8d67e24 ???
   0xffffffffffffffff ???
   ---------------------
   A fatal error internal to GDB has been detected, further
   debugging is not possible.  GDB will now terminate.

   This is a bug, please report it.  For instructions, see:
   <https://www.gnu.org/software/gdb/bugs/>.
```
