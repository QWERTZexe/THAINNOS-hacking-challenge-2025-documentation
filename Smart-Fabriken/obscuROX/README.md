# obscuROX

Looking at the file, we can see its a web assembly file, which can be ran on a [linux shell](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/README.md) with 

```shell
wasmtime <filepath>
```

Running it prints something which looks like a flag, but its obfuscated. Cyberchefs magic suggests us using an XOR cipher with the hex key 1b. Doing that, we get the flag.