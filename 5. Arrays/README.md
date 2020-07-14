### Arrays
>Write an assembly language function that will do the following:

 - Provide a function that will take 3 parameters:
	 - The base address of a word (16 bit) array
	 - the length of the array
	 - an integer (scalar)

The function will iterate over the array and will multiply the scalar by each element in the array. Each element of the array will then be changed to the scalar multiple. This is an example

```a1: dw 1,2,3,4,5```

This looks like:

```
a1[0] a1[1] a1[2] a1[3] a1[4]
1	   2 	  3 	4 	  5
```

if the function is called with the above array and a scalar of 5 then the result would be:

```
a1[0] a1[1] a1[2] a1[3] a1[4]
5 	   10 	 15 	20 	  25
```
Due: Thursday, 28 November 2019, 12:00 AM