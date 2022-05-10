/* 
 * Author: Dr. Mark E. Lehr
 * Created on April 26th, 2019, 1:36 PM
 * Purpose:  Class specification utilizing a Dynamic 1-D Array
 */

#ifndef ARRAY_H
#define ARRAY_H

class Array{
    private:
        int row;
        int col;
        int **data;
    public:
        Array(int,int);
        ~Array(){
            for(int row=0;row<this->row;row++){
                delete []data[row];
            }
            delete []data;
        }
        int getData(int,int)const;
        int getRow()const{return row;}
        int getCol()const{return col;}
};

#endif /* ARRAY_H */

