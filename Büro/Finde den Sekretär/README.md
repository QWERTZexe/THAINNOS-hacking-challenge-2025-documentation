# Finde den Sekretär

The file provided in this challenge is a linux executable ELF.

When running the file in a [linux shell](https://github.com/QWERTZexe/THAINNOS-hacking-challenge-2025-documentation/blob/main/README.md) we can see that the program asks us for a password. Upon entering nonsense we get this output:

```ascii
Enter the secret code: rgwhugrhurg
So findest du den Flag wohl nie!
 Frag doch mal einen der Sekretaere der Weltregierung, sie alle heissen Linus mit Vornamen!
 Aber Vorsicht, sie sind alle hochspezialisiert und du brauchst daher je nach Aufgabe den richtigen...
 Ob dir aus deinem Linus Team vielleicht Mr Strings helfen kann?
 ```

Linus is a wordplay to the creator of linux whose forename was Linus.

Mr Strings is a wordplay to the linux command "strings" which we will now execute on this file.

```sh
strings ./Code_v2
```

If you look around in the output for a bit, you will notice something like this:

```ascii	
@@StrengGeheimerCode
Enter the secret code:
Korrekt: %s
So findest du den Flag wohl nie!
 Frag doch mal einen der Sekretaere der Weltregierung, sie alle heissen Linus mit Vornamen!
 Aber Vorsicht, sie sind alle hochspezialisiert und du brauchst daher je nach Aufgabe den richtigen...
 Ob dir aus deinem Linus Team vielleicht Mr Strings helfen kann?
```

We can see, the code is "StrengGeheimerCode".

Run the program again and input the correct password and you will get the flag