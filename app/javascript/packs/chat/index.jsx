import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from '@reduxjs/toolkit';
import { Provider } from 'react-redux';
import gon from 'gon';
import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';

import resources from '../locales/index.js';
import reducer, { setupState } from './slices/index.js';
import App from './components/App.jsx';

export default async () => {
  await i18n
    .use(initReactI18next)
    .init({
      resources,
      load: 'languageOnly',
      fallbackLng: 'en',
      lng: 'en',
      debug: process.env.NODE_ENV !== 'production',
      react: {
        wait: true,
      },
    });
  const store = configureStore({
    reducer,
  });
  store.dispatch(setupState(gon));

  const element = (
    <Provider store={store}>
      <App />
    </Provider>
  );

  ReactDOM.render(element, document.querySelector('#chat_react'));
};
