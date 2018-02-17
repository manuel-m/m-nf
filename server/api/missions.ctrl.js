import { all } from '../db';

export default {
    GET: {
        '/api/missions': () => all('SELECT * FROM missions')
    }
};
