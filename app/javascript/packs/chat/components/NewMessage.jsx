import React from 'react';
import { Form, Button } from 'react-bootstrap';
import { useTranslation } from 'react-i18next';
import { useSelector, useDispatch } from 'react-redux';

import { actions } from '../slices/index.js';

const NewMessage = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch();

  const { newMessage } = useSelector((state) => ({
    ...state.messagesSlice,
  }));

  const handleSubmit = (event) => {
    event.preventDefault();

    dispatch(actions.createMessage());
  };

  const changeNewMessage = (event) => {
    dispatch(actions.changeNewMessage({ newMessage: event.target.value }));
  };

  return (
    <Form className="mr-5" onSubmit={handleSubmit}>
      <Form.Group>
        <Form.Control type="text" value={newMessage} onChange={changeNewMessage} />
        <Button variant="primary" type="submit">
          { t('submit') }
        </Button>
      </Form.Group>
    </Form>
  );
};

export default NewMessage;
