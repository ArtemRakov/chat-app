/* eslint-disable camelcase */
import { combineReducers } from '@reduxjs/toolkit';
import channelsSlice, { actions as channelsActions } from './channelsSlice.js';
import messagesSlice, { actions as messagesActions } from './messagesSlice.js';

export default combineReducers({
  channelsSlice,
  messagesSlice,
});

export const actions = {
  ...channelsActions,
  ...messagesActions,
};

export const setupState = (gon) => (dispatch) => {
  const { messages, channel, channels } = gon;

  dispatch(channelsActions.changeActiveChannel({ newChannel: channel }));
  dispatch(channelsActions.changeChannels({ newChannels: channels }));
  dispatch(messagesActions.changeMessages({ newMessages: messages }));
};
