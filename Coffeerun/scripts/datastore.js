(function (window) {
    'use strict';

    var App = window.App || {};
    var Promise = window.Promise;
    function DataStore(){
        // console.log('running the DataStore function');
        this.data = {};
    }

    function promiseResolvedWith(value){
        var promise = new Promise(function (resolve, reject) {
            resolve(value);
        });
        return promise;
    }

    DataStore.prototype.add = function(key, val) {return promiseResolvedWith(null);}
    DataStore.prototype.get = function(key)      {return promiseResolvedWith(this.data[key]);}
    DataStore.prototype.getAll = function()      {return promiseResolvedWith(this.data);     }
    DataStore.prototype.remove = function(key)   {delete this.data[key];
                                                  return promiseResolvedWith(null)}

    /*class DataStore{
        constructor() {
            this.data = {};
        }

        promiseResolvedWith(value){
            var promise = new Promise(function (resolve, reject) {
                resolve(value);
            });
            return promise;
        }

        add(key, val) {return promiseResolvedWith(null);}
        get(key)      {return promiseResolvedWith(this.data[key]);}
        getAll()      {return promiseResolvedWith(this.data);     }

        remove(key)   {
            delete this.data[key];
            return promiseResolvedWith(null)}
        }
    */
    App.DataStore = DataStore;
    window.App = App;

})(window);
