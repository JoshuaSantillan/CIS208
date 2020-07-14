### Subprogram project
>Write an assembly language program that will declare and implement a function that will do the following:

Determine if a number contains a particular digit.  If this function was written in C or C++ it would have a header that would look like:

int containsDigit(int number,int digit );

It will return 1 if the number parameter contains the digit and 0 if it does not.

This c++ code is something like this program in assembly:
```cpp
#include<iostream>

  int checkDigit(int number,int digit)
  {
     while(number)
     {
         std::cout << number << std::endl;
         std::cout << number%10 << std::endl;
         if(digit == number % 10)
             return 1;
         number /= 10;
     }
     return 0;
  }

  int main()
  {
      int numbertoCheck = 98796543;
      std::cout << checkDigit(numbertoCheck,5) << std::endl;
      return 0;
  }
  ```
  Due: Thursday, 14 November 2019, 11:55 PM