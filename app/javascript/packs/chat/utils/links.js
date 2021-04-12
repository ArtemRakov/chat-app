const generalLinks = (team) => [
  { id: 'new_channel', slug: 'New Channel', href: `/teams/${team.name.toLowerCase()}/channels/new` },
  { id: 'discover', slug: 'Discover', href: `/teams/${team.name.toLowerCase()}/channels` },
];

export default generalLinks;
