## todo: ImportExcel Ideas Templates


[Refresh PQ using PAD .crossjoin.co.uk/2022/02/27/refreshing-excel-power-query-queries-with-vba-and-power-automate-for-desktop](https://blog.crossjoin.co.uk/2022/02/27/refreshing-excel-power-query-queries-with-vba-and-power-automate-for-desktop/)
    - I could replace PowerAutomate with Powershell 

## todo: `Dev.Nin\Str` add more `template` types

### calculated properties on `Dev.Nin\str`


```ps1
 ls . | & { Process { $_.Length } }
 | str { $_|hex }
 ls . | %{ $_.Length }
 | str { $_|hex } # or something cool in here
```

#### maybe? 

```
ls . |  fnLength
| str { $_|hex }
    #| Should -be (gi . | % PSPath | % Length) # true
1 1 1 1 1 1 1 1 1 1 1 1 1 1 158 4128 34 1046 253 18 393 995 168
 483885 3 1288 0 16 675580 0 791 188

### wip

```yml
  - name: enclose,
    description: 'surround using "()","{}", "[]", or free form from param'
    test: [   
        input: "a", "[]"
        result: "[a]",

        input: "a", "{}"
        result: "{b}"
    ]

```