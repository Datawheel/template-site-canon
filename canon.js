module.exports = {
  db: [
    {
      connection: process.env.CANON_CMS_DB,
      tables: [
        require("@datawheel/canon-core/models"),
        require("@datawheel/canon-cms/models")
      ]
    }
  ]
};
