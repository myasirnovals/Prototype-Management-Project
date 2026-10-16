// Vercel Serverless Function untuk /api/health
// Mengecek kesehatan sistem dan koneksi database

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', '*');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  let dbStatus = { connected: false, mode: 'in-memory' };
  const connStr = process.env.DATABASE_URL || process.env.POSTGRES_URL || process.env.SUPABASE_URL;

  if (connStr) {
    try {
      const { default: pg } = await import('pg');
      const pool = new pg.Pool({
        connectionString: connStr,
        ssl: { rejectUnauthorized: false }
      });
      const queryRes = await pool.query('SELECT NOW() as server_time');
      dbStatus = {
        connected: true,
        provider: 'supabase-postgresql',
        serverTime: queryRes.rows[0]?.server_time
      };
      await pool.end();
    } catch (err) {
      dbStatus = {
        connected: false,
        error: err.message
      };
    }
  }

  return res.status(200).json({
    status: 'online',
    platform: 'vercel-serverless',
    timestamp: new Date().toISOString(),
    database: dbStatus
  });
}
