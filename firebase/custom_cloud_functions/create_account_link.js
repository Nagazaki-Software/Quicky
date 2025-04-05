const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const stripeModule = require("stripe");

// Credenciais do Stripe
const kStripeProdSecretKey =
  "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";
const kStripeTestSecretKey =
  "sk_test_51Ob84ED9xvi658VGJiv72yprCVGQ6sLv7pHDu5ZbuS1JfqZbXzuWf9bKpUk47bhqb0gIs5750pX2n2yZ8bKuhZPI00N3sruzNx";

const secretKey = (isProd) =>
  isProd ? kStripeProdSecretKey : kStripeTestSecretKey;

exports.createAccountLink = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return await createStripeAccountLink(data, true);
});

/**
 * Função para criar o link de conexão com a conta bancária no ambiente de teste.
 */
exports.createTestAccountLink = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      return "Unauthenticated calls are not allowed.";
    }
    return await createStripeAccountLink(data, false);
  },
);

/**
 * Função que cria o link da conta do Stripe.
 */
async function createStripeAccountLink(data, isProd) {
  try {
    const stripe = new stripeModule.Stripe(secretKey(isProd), {
      apiVersion: "2020-08-27",
    });

    // Criando uma conta de conectividade com o Stripe Connect
    const account = await stripe.accounts.create({
      type: "custom",
      country: "US", // Defina o país do usuário
      email: data.email,
      business_type: "individual", // Tipo de negócio: "individual" ou "company"
      requested_capabilities: ["card_payments", "transfers"], // Capacidades necessárias
    });

    // Criando o link da conta para o usuário concluir o processo de conexão
    const accountLink = await stripe.accountLinks.create({
      account: account.id,
      refresh_url: "https://www.exemplo.com/reauth", // URL para reautenticação se necessário
      return_url: "https://www.exemplo.com/return", // URL de retorno após completar a autenticação
      type: "account_onboarding", // Tipo de link, pode ser "account_onboarding" ou "account_update"
    });

    return {
      url: accountLink.url, // URL que você vai redirecionar o usuário para o Stripe
      success: true,
    };
  } catch (error) {
    console.log(`Error: ${error}`);
    return { success: false, error: userFacingMessage(error) };
  }
}

/**
 * Função para fornecer uma mensagem amigável ao usuário em caso de erro.
 */
function userFacingMessage(error) {
  return error.type
    ? error.message
    : "An error occurred, developers have been alerted";
}
