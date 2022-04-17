const config = {
  server: "localhost",
  port: 1433,
  database: "ReaVayaDB",
  driver: "msnodesqlv8",
  options: {
    trustedConnection: true
  }
};

module.exports = config;
