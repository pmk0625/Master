/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on April 26th, 2019, 1:36 PM
 * Purpose:  Class utilizing a Dynamic 1-D Array
 */

//System Libraries
#include <iostream>  //I/O Library
#include <cstdlib>   //srand, rand
#include <ctime>     //Time
using namespace std;

//User Libraries
#include "Array.h"

//Global Constants - Math, Science, Conversions, 2D Array Sizes

//Function Prototypes
void prntAry(const Array &,int,int);

//Executions Begin Here!
int main(int argc, char** argv) {
    //Set the random number seed
    srand(static_cast<unsigned int>(time(0)));
    
    //Declare and allocate memory for the array
    int row=11;
    int col=10;
    Array array(row,col);
    
    //Print the random 2-Digit array
    prntAry(array,row,col);
    
    //Exit stage right!
    return 0;
}

void prntAry(const Array &a,int row,int col){
    cout<<endl;
    for(int i=0;i<a.getRow();i++){
        for(int j=0;j<a.getCol();j++){
            cout<<a.getData(i,j)<<" ";
        }
        cout<<endl;
    }
    cout<<endl;
}