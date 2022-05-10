/* 
 * Author: Dr. Mark E. Lehr
 * Created on April 26th, 2019, 1:36 PM
 * Purpose:  Class specification utilizing a Dynamic 1-D Array
 */

#include "Array.h"
#include <cstdlib>
#include <ctime>
using namespace std;

Array::Array(int r,int c){
    row=r<=1?2:r>1000?1000:r;
    col=c<=1?2:c>1000?1000:c;
    data=new int*[row];
    for(int r=0;r<row;r++){
        data[r]=new int[col];
    }
    for(int r=0;r<row;r++){
        for(int c=0;c<col;c++){
            data[r][c]=rand()%90+10;
        }
    }
}   
    
int Array::getData(int r,int c)const{
    if(r>=0&&r<row&&c>=0&&c<col)return data[r][c];
    else return data[0][0];
}