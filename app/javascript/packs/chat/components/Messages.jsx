import React from 'react';
import { useSelector } from 'react-redux';

const Messages = () => {
  const { messages } = useSelector((state) => ({
    ...state.messagesSlice,
  }));

  return (
    <ul className="list-group pb-5">
      {messages.map((item) => (
        <li key={item.id} className="list-group-item">
          <p>{item.id}</p>
          {item.content}
        </li>
      ))}
    </ul>
  );
};

export default Messages;
