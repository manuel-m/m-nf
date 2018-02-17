import { all } from '../db';

export default {
    GET: {
        '/api/contracts': () => all('SELECT * FROM contracts ')
    }
};
