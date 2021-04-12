import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';

import routes from '../../../routes.js';

/* eslint-disable no-param-reassign */

const fetchChannel = createAsyncThunk('fetchChannel', async (channel) => {
  const channelPath = routes.channel_path(channel.id);
  const response = await axios.get(channelPath);

  return response.data;
});

const slice = createSlice({
  name: 'channelsSlice',
  initialState: {
    channels: [],
    activeChannel: {},
  },
  reducers: {
    changeActiveChannel(state, { payload }) {
      state.activeChannel = payload.newChannel;
    },
    changeChannels(state, { payload }) {
      state.channels = payload.newChannels;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchChannel.fulfilled, (state, { payload }) => {
        state.activeChannel = payload.channel;
      });
  },
});

export const actions = {
  ...slice.actions,
  fetchChannel,
};

export default slice.reducer;
