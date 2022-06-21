/* initial state of the data layer */
export const initialState = {
    user: null,
};

/* Dispatch actions of data */
export const actionTypes = {
    SET_USER: "SET_USER",
};

/* if you recieve action, then change data */
const reducer = (state, action) => {
    console.log(action);
    switch (action.type) {
        case actionTypes.SET_USER:
            return {
                ...state,
                user: action.user,
            };
        
        default:
            return state;
    }
};

export default reducer;