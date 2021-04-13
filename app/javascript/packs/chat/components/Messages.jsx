import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useTranslation } from 'react-i18next';
import { Button } from 'react-bootstrap';

import { actions } from '../slices/index.js';

const Messages = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch();

  const { messages } = useSelector((state) => ({
    ...state.messagesSlice,
  }));

  const deleteMessage = (message) => () => {
    dispatch(actions.deleteMessage(message));
  };

  const link = (message) => (
    <Button variant="link" onClick={deleteMessage(message)} className="float-right" href="#">
      <span>{t('delete')}</span>
    </Button>
  );

  return (
    <ul className="list-group pb-5">
      {messages.map((message) => (
        <li key={message.id} className="list-group-item">
          <p>{message.user_email}</p>
          {message.content}
          {message.actions_allowed && link(message)}
        </li>
      ))}
    </ul>
  );
};

export default Messages;
