import { all } from '../db';

export default {
    GET: {
        '/api/ikms': () => all('SELECT * FROM ikms')
    }
};
