import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';

import routes from '../../../routes.js';
import { actions as channelsActions } from './channelsSlice.js';

const createMessage = createAsyncThunk('createMessage', async (_, { getState }) => {
  const { activeChannel } = getState().channelsSlice;
  const newMessagePath = routes.channel_messages_path(activeChannel.id);
  const { newMessage } = getState().messagesSlice;

  const response = await axios.post(newMessagePath, {
    team_channel_message: {
      content: newMessage,
    },
  });

  return response.data;
});

/* eslint-disable no-param-reassign */
const slice = createSlice({
  name: 'messagesSlice',
  initialState: {
    messages: [],
    newMessage: '',
  },
  reducers: {
    changeMessages(state, { payload }) {
      state.messages = payload.newMessages;
    },
    changeNewMessage(state, { payload }) {
      state.newMessage = payload.newMessage;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(createMessage.fulfilled, (state, { payload }) => {
        state.messages = [...state.messages, payload];
        state.newMessage = '';
      });
    builder
      .addCase(channelsActions.fetchChannel.fulfilled, (state, { payload }) => {
        state.messages = payload.messages;
        state.newMessage = '';
      });
  },
});

export const actions = {
  ...slice.actions,
  createMessage,
};

export default slice.reducer;
