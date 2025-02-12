# Noise to Signal

In my opinion, the most difficult challenge of the ctf. You have a private key and a "random" binary file. When binwalking over the random.bin file:

```binwalk
┌──(user㉿MSI)-[/home]
└─$ binwalk random.bin

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
3145728       0x300000        Executable script, shebang: "/bin/sh  #"
```

We can see there is an embedded shell script in the random.bin:

```sh
set -x                                                                                                                    #
LETS="dd if=$0 bs=5"                                                                                                          #
MAKE="12 skip="                                                                                                               #
THIS="14340 count=1"                                                                                                          #
THE="opens"                                                                                                                   #
UGLIEST="sl pke"                                                                                                              #
CODE="yutl -decry"                                                                                                            #
EVER="pt -inkey priva"                                                                                                        #
JUST="te_ke"                                                                                                                  #
FOR="y_guent"                                                                                                                 #
FUN="her.pem"                                                                                                                 #
${LETS}${MAKE}${THIS}|${THE}${UGLIEST}${CODE}${EVER}${JUST}${FOR}${FUN}                                                       #
exit
```

We can recycle this shell code to make our own one, which tries every possible block, not just 14340. Have a look at
[this script](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/Telekommunikation/Noise%20to%20Signal/script.sh)

Once its done, open the output file and Ctrl + F for "THAINNOS", ideally you will find the flag.