# Binary File Diff

We see a snippet of a github page.

Namely: https://github.com/polaco1782/linux-static-binaries/blob/master/armv7l-eabihf/bsdiff

By [manually saving the website oneselves](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/Telekommunikation/Binary%20File%20Diff/original.html), we can compare them using the diff command, which will show some natural differences, like diff styles, icons and paths. But it will also show some randomly placed chars which are scattered all around the html. Put them together and you get a flag in the format THAINNOS{}