import { createSlice } from '@reduxjs/toolkit';

/* eslint-disable no-param-reassign */
const slice = createSlice({
  name: 'userSlice',
  initialState: {
    user: {},
  },
  reducers: {
    changeUser(state, { payload }) {
      state.user = payload.newUser;
    },
  },
});

export const { actions } = slice;

export default slice.reducer;
