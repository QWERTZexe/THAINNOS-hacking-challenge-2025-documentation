# HiddenBinary

Using binwalk, we can see that these are actually 2 binary files! Lets call them "original" and "hidden" in this README.

Extract the hidden file from the original one.

When running hidden, it gives us a key and an IV, but why and for what?

When running original, its just some kind of temperature simulation.

Now analyze original with ghidra, we can see that there are 2 functions: void useless_function1 and void useless_function2

useless_function1 prints "Alpha Emil Siegfried 128" => AES 128. So this is what our key and IV are for! But what are we supposed to decode with that?

useless_function2 prints the encoded flag, but it never gets called.

To call it, we run gdb in a [linux shell](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/README.md):

```shell
gdb <filename>
(gdb) break main
# Breakpoint 1 at 0x11f1
(gdb) run
# Starting program: /mnt/c/Users/QWERTZ/Downloads/actuator
# [Thread debugging using libthread_db enabled]
# Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

# Breakpoint 1, 0x00005555555551f1 in main ()
(gdb) call (void)useless_function2()
# Secret Password: �Ϧ�Ev�ȏ��;#ZS���C�w_��J-��7Q�
```

Now, wrap this all around in a script session, then get the bytes from the secret password and decode them using AES 128, the IV and the key. This will be a flag in the flag format.