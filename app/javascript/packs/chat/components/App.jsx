import React from 'react';

import ChatNav from './ChatNav.jsx';
import Messages from './Messages.jsx';
import NewMessage from './NewMessage.jsx';

const App = () => (
  <div className="container">
    <div className="row">
      <div className="col-md-2">
        <ChatNav />
      </div>
      <div className="col-md-8">
        <Messages />
        <NewMessage />
      </div>
    </div>
  </div>
);

export default App;
