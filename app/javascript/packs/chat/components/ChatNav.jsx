import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useTranslation } from 'react-i18next';
import { Nav } from 'react-bootstrap';

import { actions } from '../slices/index.js';
import routes from '../../../routes.js';

const ChatNav = () => {
  const { t } = useTranslation();
  const dispatch = useDispatch();

  const { channels, activeChannel } = useSelector((state) => ({
    ...state.channelsSlice,
  }));

  const changeChannel = (channel) => () => {
    dispatch(actions.fetchChannel(channel));
  };

  return (
    <Nav variant="pills" defaultActiveKey={activeChannel.id}>
      {channels.map((channel) => (
        <Nav.Item key={channel.id}>
          <Nav.Link onClick={changeChannel(channel)} eventKey={channel.id}>{channel.slug}</Nav.Link>
        </Nav.Item>
      ))}
      <br />
      <Nav.Item>
        <Nav.Link href={routes.new_team_channel_path(activeChannel.team_id)}>{ t('new_channel') }</Nav.Link>
      </Nav.Item>
    </Nav>
  );
};

export default ChatNav;
