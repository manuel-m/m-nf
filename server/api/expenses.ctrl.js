import { all } from '../db';

export default {
    GET: {
        '/api/expenses': () => all('SELECT * FROM expenses')
    }
};
