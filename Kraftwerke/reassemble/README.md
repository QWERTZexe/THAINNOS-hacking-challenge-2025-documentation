# reassemble

We start with a file with no ending. A keen eye may see that its actually an archive. Extract this archive to a suitable location.

Now you can see that this archive has a lot of scrambled directories. Running the `tree /F` command on it:

[Tree output](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/Kraftwerke/reassemble/tree_output.txt)

Looking at the lines 204, 88 and 166, we can see 3 files with no ending with names from 0 to 2.

Open them in a hex editor and copy the bytes from 0, 1 and 2 and make a new file with it (start with bytes from 0, end with bytes from 2).

This will produce a valid web assembly file, which can be ran on a [linux shell](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/README.md) with 

```shell
wasmtime <filepath>
```

Running the file outputs the flag.