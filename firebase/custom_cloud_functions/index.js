const admin = require("firebase-admin/app");
admin.initializeApp();

const createAccountStripeCustom = require("./create_account_stripe_custom.js");
exports.createAccountStripeCustom =
  createAccountStripeCustom.createAccountStripeCustom;
const createPaymentIntent = require("./create_payment_intent.js");
exports.createPaymentIntent = createPaymentIntent.createPaymentIntent;
const stripeWebhook = require("./stripe_webhook.js");
exports.stripeWebhook = stripeWebhook.stripeWebhook;
