import { all } from '../db';

export default {
    GET: {
        '/api/expense_reports': () => all('SELECT * FROM expense_reports')
    }
};
