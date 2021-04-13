import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';

import routes from '../../../routes.js';
import { actions as channelsActions } from './channelsSlice.js';

const createMessage = createAsyncThunk('createMessage', async (_, { getState }) => {
  const { activeChannel } = getState().channelsSlice;
  const { newMessage } = getState().messagesSlice;
  const newMessagePath = routes.channel_messages_path(activeChannel.id);

  const response = await axios.post(newMessagePath, {
    team_channel_message: {
      content: newMessage,
    },
  });

  return response.data;
});

const deleteMessage = createAsyncThunk('deleteMessage', async (message) => {
  const response = await axios.delete(routes.channel_message_path(message.channel_id, message.id));
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
      .addCase(deleteMessage.fulfilled, (state, { payload }) => {
        state.messages = state.messages.filter((message) => message.id !== payload.id);
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
  deleteMessage,
};

export default slice.reducer;
