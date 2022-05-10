/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on March 12th, 2019, 2:21 PM
 */

//System Libraries
#include <iostream> //I/O Stream
#include <cstdlib>  //Random Number functions
#include <ctime>    //Time functions
using namespace std;

int **fillAry(int,int);                 //Fill the Array
void prntDat(const int* const*,int,int);//Print the 2-D Array
void destroy(int **,int);               //Destroy the Array

int main(int argc, char** argv) {
    //Set the random number seed
    srand(static_cast<unsigned int>(time(0)));
    //Create 2-D array
    int row=3,col=2;
    int **ary=fillAry(row,col);
    //Print result
    prntDat(ary,row,col);
    //Reclaim allocated memory
    destroy(ary,row);
    //Exit Stage right
    return 1;
}
int **fillAry(int r,int c){
    //Size the 2-D Array
    int **ary=new int*[r];
    for(int rw=0;rw<r;rw++){
        ary[rw]=new int[c];
    }
    //Fill memory with random 1-Digit numbers
    for(int rw=0;rw<r;rw++){
        for(int cl=0;cl<c;cl++){
            ary[rw][cl]=rand()%10;
        }
    }
    return ary;
}
void prntDat(const int* const *a,int r,int c){
    cout<<endl;
    for(int rw=0;rw<r;rw++){
        for(int cl=0;cl<c;cl++){
            cout<<a[rw][cl]<<" ";
        }
        cout<<endl;
    }
    cout<<endl;
}
void destroy(int ** ary,int row){
    for(int rw=0;rw<row;rw++){
        delete [] ary[rw];
    }
    delete []ary;
}