import expenses from './api/expenses.ctrl';
import expense_reports from './api/expense_reports.ctrl';
import ikms from './api/ikms.ctrl';

import server from 'et-es/m-server/m-server.index';

import config from './config/server.config.json';

server({
    api: {
        filter: req_ => req_.url.indexOf('/api') === 0
    },
    conf: config,
    controllers: { expenses, expense_reports, ikms }
});
