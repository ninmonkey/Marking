- [Power Query](#power-query)
  - [Table.FromValue( x )](#tablefromvalue-x-)
- [DAX](#dax)
    - [`{` and `}` table literals?](#-and--table-literals)
    - [Method1](#method1)
    - [Method2](#method2)
  - [Dynamically Generated in  reports](#dynamically-generated-in--reports)


# Power Query

## Table.FromValue( x )

- optional parameters are currrently just name

<!-- lang:pq -->
```sql
= Table.FromValue( { "Bob" } )
= Table.FromValue( { "Bob" }, [DefaultColumnName = "Name"])
```

# DAX

<!-- ## Mode: Calculated on model creation -->

### `{` and `}` table literals?

### Method1

```dax
EVALUATE{ 
	( "Species",  "Cat" ),
	( "Name", "Jen" )	
}
```
EVALUATE { 1, 2, 3 ,4 }

**Output**

| Value1    | Value 2 |
| --------- | ------- |
| "Species" | "Cat"   |
| "Name"    | "Jen"   |

----

### Method2 
```dax
EVALUATE{ 
	( "Species",  "Cat" ),
	( "Name", "Jen" )	
}
```
EVALUATE { 1, 2, 3 }

**Output**

| Value1 |
| ------ |
| 1      |
| 2      |
| 3      |


## Dynamically Generated in  reports

- generateseries
- cannot be 


