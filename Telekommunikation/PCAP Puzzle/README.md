# PCAP Puzzle

Open the file in Wireshark.

Hit Ctrl + F and search for 12345, 23456 and 34567 respectively. Copy the hex bytes of all search results (all packages with that info have the same content) and put them together, you get:

12345:
``9C@Eu@#0909aPNHeader: 0xAA55AA55 | Version: 1 byte | Payload Length: 2 bytes | Payload: variable length``

23456: ``42 ist exklusiv, oder? Julius aus Nr. 3 ist dieser Meinung``

34567: ``UU}anf{{x|Tf[\BLR_BnMZF[[B]PX_D``

Wir haben also etwas zu entschlüsseln (34567) und den Weg, wie man es entschlüsselt (23456): XOR mit 42 und dann Caesar mit offset 3. Macht man dies erhält man das flag.