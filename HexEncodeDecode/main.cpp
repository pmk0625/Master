#include <iostream>
#include <cstring>
#include <sstream>
#include <iterator>

using namespace std;


int main(){
    stringstream ss;
    string message =    "Yeah, I'm gonna take my horse "
                        "To the old town road "
                        "I'm gonna ride 'til I can't no more "
                        "I'm gonna take my horse to the old town road "
                        "I'm gonna ride (Kio, Kio) 'til I can't no more "
                        "I got the horses in the back "
                        "Horse tack is attached "
                        "Hat is matte black "
                        "Got the boots that's black to match "
                        "Riding on a horse, ha "
                        "You can whip your Porsche "
                        "I been in the valley "
                        "You ain't been up off the porch, now "
                        "Can't nobody tell me nothing "
                        "You can't tell me nothing "
                        "Can't nobody tell me nothing "
                        "You can't tell me nothing ";
                        
                        
    string hexConvert;

    cout<<"String: "<< message << "\n";
    printf("\n");

    for (const auto &item : message) {
        ss << hex << int(item);
    }
    
    hexConvert = ss.str();
    cout<<"Hex Value: "<< hexConvert << "\n";
    printf("\n");
    
    
    
    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    /*int hexMessage = 0x596561682c2049276d20676f6e6e612074616b65206d7920686f72736520546f20746865206f6c6420746f776e20726f61642049276d20676f6e6e612072696465202774696c20492063616e2774206e6f206d6f72652049276d20676f6e6e612074616b65206d7920686f72736520746f20746865206f6c6420746f776e20726f61642049276d20676f6e6e61207269646520284b696f2c204b696f29202774696c20492063616e2774206e6f206d6f7265204920676f742074686520686f7273657320696e20746865206261636b20486f727365207461636b20697320617474616368656420486174206973206d6174746520626c61636b20476f742074686520626f6f74732074686174277320626c61636b20746f206d6174636820526964696e67206f6e206120686f7273652c20686120596f752063616e207768697020796f757220506f72736368652049206265656e20696e207468652076616c6c657920596f752061696e2774206265656e207570206f66662074686520706f7263682c206e6f772043616e2774206e6f626f64792074656c6c206d65206e6f7468696e6720596f752063616e27742074656c6c206d65206e6f7468696e672043616e2774206e6f626f64792074656c6c206d65206e6f7468696e6720596f752063616e27742074656c6c206d65206e6f7468696e6720;
    string messageConvert;
    
    ss << hexMessage;
    cout<< ss.str();*/

    return 0;
}
