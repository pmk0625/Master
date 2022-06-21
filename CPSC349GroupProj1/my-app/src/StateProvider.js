import React, { createContext, useContext, useReducer } from "react";

/* Preparing the data layer */
export const StateContext = createContext();

/* Higher order component used to wrap the app in the state provider that holds userData */
export const StateProvider = ({ reducer, initialState, children }) => (
    <StateContext.Provider value={useReducer(reducer, initialState)}>
        {children}
    </StateContext.Provider>
);

/* Used whenever we want to pull data out from the dataLayer */
export const useStateValue = () => useContext(StateContext);