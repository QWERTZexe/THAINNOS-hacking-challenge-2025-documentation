# Produktionszeichnung

Looking at the pdf in an editor window, we can see a javasript code:

```js
function() {
    window.close();
    var x = 42 + 42;
    var a = (x * 2 / 2) + [0].reduce((_, val) => val, 0); 
    var b = ((arr) => arr[0] - arr[1] + arr[2] - arr[3] / 6)([a, 10, 8, a]);
    var c = [String.fromCharCode((a + 2) / 2), String.fromCharCode(b * 3 - 140)].join('');
    var z = Array.from({ length: 4 }, (_, i) => i + 1).concat([77]).join('');
    var p1 = z.includes('77') ? ['T','H','A', 'IN', 'NOS'].join('') : 'ERROR';
    var p2 = (() => String.fromCharCode(...[123, 80, 68, 70, 105, 115]))();
    var p3 = ['A', 'w', 'e', 's', 'o', 'm', 'e'].reduce((acc, char) => acc + char, '');
    var p4 = String.fromCharCode(125);
    var parts = [c, p1, p2, p3, p4];
    var f = parts.reduce((acc, part) => acc + part, '');
    var distract = Array(20).fill(0).map((_, i) => Math.cos(i * Math.PI / 180) * f.length);
    var base64Encoded = btoa(f);
    app.alert(base64Encoded.split('').reverse().join(''));
}
```

Running this code will give us the flag (It alerts the base 64 encoded reversed flag, but we can modify the alert to directly alert ``f``)