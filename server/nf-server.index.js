import contracts from './api/contracts.ctrl';
import expenses from './api/expenses.ctrl';
import expense_reports from './api/expense_reports.ctrl';
import missions from './api/missions.ctrl';

import server from 'et-es/m-server/m-server.index';

import config from './config/server.config.json';

server({
    api: {
        filter: req_ => req_.url.indexOf('/api') === 0
    },
    conf: config,
    controllers: { contracts, expenses, expense_reports, missions }
});
