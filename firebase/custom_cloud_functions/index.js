const admin = require("firebase-admin/app");
admin.initializeApp();

const createAccountLink = require("./create_account_link.js");
exports.createAccountLink = createAccountLink.createAccountLink;
