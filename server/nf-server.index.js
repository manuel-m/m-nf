import contracts from './api/contracts.ctrl';
import expenses from './api/expenses.ctrl';
import missions from './api/missions.ctrl';

import server from 'et-es/m-server/m-server.index';

server({
    api: {
        filter: req_ => req_.url.indexOf('/api') === 0
    },
    conf: {
        encoding: 'utf-8',
        port: 8000,
        root: './dist'
    },
    controllers: { contracts, expenses, missions }
});
