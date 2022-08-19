- [$ModuleTemplate](#moduletemplate)
  - [Arguments/Mutators for string-type parameters`::max`](#argumentsmutators-for-string-type-parametersmax)
    - [Expected Render 📌](#expected-render-)
  - [Exected Outputs / Test Cases](#exected-outputs--test-cases)
    - [Case: Template](#case-template)
    - [Case: Args](#case-args)
    - [Case: Render](#case-render)
    - [ext2](#ext2)
    - [ex1: Parameters](#ex1-parameters)
    - [ex1: output1](#ex1-output1)
  - [📌 experimental psuedo grammar](#-experimental-psuedo-grammar)

## Todo: Move to marking

- Columns don't have to line up with it's other columns on different lines
- instead:
  - Object2_Line2 will align with Object1_Line2, Object3_Line2, Object4_Line2 ...

```ps1
Invoke-GHRepoList -GitRepoOwner JustinGrote -Flags Source | ?{ $_.pushedAt.Year -gt 2020 } | sort pushedAt | Fl

```

# $ModuleTemplate 

```yml
{template}
{desc::max80}
{desc::max=80}
{desc::max=80,padLeft=10,min=80}

# add
{user::PadLeft}
PadRight
PadBefore, or After render

```

 | term                    | Description                                                                                                                            |
 | ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
 | `{keyName}`             | value of kwargs['KeyName']                                                                                                             |
 | `{userName::max5}`      | value of kwargs['KeyName']                                                                                                             |
 | `{optional::?fallback}` | if `optional` is missing, use `fallback` <br/>Otherwiset it depends whether the template uses strict mode, or non-fatal null fallbacks |


## Arguments/Mutators for string-type parameters`::max` 

| Arg                 | Description                              |
| ------------------- | ---------------------------------------- |
| `?default`          | fallback for missing, **or null** values |
| `max=[int]`         | truncate length                          |
| `max=[int],fromEnd` | truncate length from end                 |

### Expected Render 📌

| Arg                              | Description |
| -------------------------------- | ----------- |
| `{name}`                         | `Alexander` |
| `{name::max3}`                   | `Ale`       |
| `{name::max3,fromEnd}`           | `der`       |
| `{name::?John} {lastName::?Doe}` | `John Doe`  |

next add padding and 

- `max` => limits str length


## Exected Outputs / Test Cases

### Case: Template

```yml
{name::max3} {species}
{name::max=3,fromEnd} {species}
```
### Case: Args

### Case: Render

----

### ext2

### ex1: Parameters



```yml
name: Alexander
species: Cat
```

### ex1: output1

## 📌 experimental psuedo grammar


**Simples expression**

name::max


<!-- ```yml
#
name::max
``` -->

## 📌 Ideas for templates with args / grammar


```yml
str::max=3[int]
    truncates string
```

```yml
# abbr
{name::max3} {species}

# explicit notation
# is this excessive?
{name::max=3,fromEnd} {species}
{name::max=3,fromEnd=1} {species}
{name::max=3,fromEnd=true} {species}

# disable/remove default params?
{name::someParam=null} {species}
# shorthand is omitting the key's -> value
{name::someParam=} {species}


{name::max3,fromEnd} {species}
{name::max=3,fromEnd=true} {species}

```
