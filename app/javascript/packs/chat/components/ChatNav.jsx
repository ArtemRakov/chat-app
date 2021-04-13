import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { useTranslation } from 'react-i18next';
import { Button } from 'react-bootstrap';
import cn from 'classnames';

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

  const listItem = (channel) => {
    const classes = cn({
      'nav-link': true,
      'w-100': true,
      active: channel.id === activeChannel.id,
    });

    return (
      <li key={channel.id} className="nav-item">
        <Button variant="link" onClick={changeChannel(channel)} className={classes}>
          {channel.slug}
        </Button>
      </li>
    );
  };

  return (
    <>
      <ul className="nav flex-column nav-pills">
        {channels.map(listItem)}
      </ul>
      <hr className="my-3" />
      <ul className="nav flex-column nav-pills">
        <li className="nav-item">
          <a className="nav-link" href={routes.new_team_channel_path(activeChannel.team_id)}>
            { t('create_new_channel') }
          </a>
        </li>
      </ul>
    </>
  );
};

export default ChatNav;
