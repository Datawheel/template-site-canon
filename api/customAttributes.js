const {CANON_CMS_CUBES} = process.env;

module.exports = function(app) {

  app.post("/api/cms/customAttributes/:pid", async(req, res) => {

    return res.json({
      tesseract: CANON_CMS_CUBES
    });

  });
};
