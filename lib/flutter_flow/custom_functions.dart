import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int quantasNaLista(List<String> lista) {
  // retorne o numero do ultimo index
  return lista.length - 1;
}

String convertStringInListComVirgula() {
  // Lista com itens separados por vírgula
  return 'Assistência Pessoal & Dormitório, Alimentação & Compras, Suporte Acadêmico, Tecnologia & Eletrônicos, Lavagem e dobra de roupas, Limpeza e organização do quarto, Remoção de lixo e reciclagem, Arrumação de cama e troca de lençóis, Organização de armário, Reorganização de móveis, Ajuda com armazenamento (empacotar/desempacotar para recessos), Entrega de comida de restaurantes fora do campus, Compras e entrega de supermercado, Assistência na preparação de refeições, Corridas para lanches e café, Retirada de refeições no refeitório, Aulas particulares para matérias específicas, Ajuda com dever de casa e estudos, Assistência para anotações, Ajuda com pesquisas para trabalhos, Revisão e edição de redações, Lembretes de aula e organização, Solução de problemas em celulares ou laptops, Instalação e configuração de software, Impressão e digitalização de documentos, Configuração de roteadores Wi-Fi ou impressoras, Ajuda com tarefas de programação, Transporte & Serviços, Eventos & Assistência Social, Saúde & Bem-estar, Manutenção & Reparos, Mudanças & Armazenamento, Carona dentro do campus e arredores, Transporte para aeroporto ou estação de ônibus, Retirada e entrega de pacotes, Devolução de livros na biblioteca, Execução de tarefas diversas, Montagem e limpeza de festas, Movimentação de móveis para eventos, Decoração de dormitórios ou eventos, Fotografia e filmagem de eventos, Organização de atividades de clubes estudantis, Companhia na academia ou parceiro de treino, Planejamento de refeições e dicas de dieta, Orientação para meditação ou yoga, Retirada de medicamentos ou farmácia, Pequenos reparos no dormitório (troca de lâmpadas, pequenos ajustes), Montagem de móveis, Fixação de quadros ou decorações, Reparos e manutenção de bicicletas, Ajuda com mudança de dormitório ou apartamento, Empacotamento e desempacotamento, Transporte de itens pesados, Armazenamento de pertences durante recessos, Cuidado com Animais, Serviços Criativos & Mídia, Pedidos Especiais & Únicos, Terceira Interface: Criar Nova Tarefa, A próxima tarefa principal será adicionar uma página de criação de tarefas; este será o ícone central e principal no meio da seleção de páginas na barra inferior, semelhante à estrela do Tinder, Design: A aparência deve ser semelhante à página de configuração de perfil no Tinder, O que deve estar disponível para o usuário incluir: Informações Obrigatórias da Tarefa (Preenchidas Automaticamente ou Selecionadas pelo Usuário), Detalhes Básicos da Tarefa, Passeio com cães, Alimentação e cuidados com animais, Limpeza de gaiolas ou aquários, Design gráfico para cartazes ou panfletos, Edição de vídeos para projetos, Sessões fotográficas para LinkedIn ou currículos, Ficar na fila para eventos, Teste de produtos ou compras misteriosas, Ajuda com pedidos personalizados';
}

List<String> convertStringInList(String gemini) {
  // retorne o gemini em lista
  return gemini.split('');
}

Color escolhaacordasnotificacoes(String? icon) {
  // verifique se icon é igual a mensagem e retorne a cor vermelha, e verifique se icon é igual sistema e retorne a cor azul
  if (icon == 'mensagem') {
    return Colors.red;
  } else if (icon == 'sistema') {
    return Colors.blue;
  } else {
    return Colors.black;
  }
}

dynamic formatStringToJson(String task) {
// formate treino para json, exclua tudo que não seja em json, ou tudo antes e depois do {}
  // Find the start and end index of the JSON object
  int startIndex = task.indexOf('{');
  int endIndex = task.lastIndexOf('}');

  // Extract the JSON object from the string
  String jsonStr = task.substring(startIndex, endIndex + 1);

  // Parse the JSON string to a dynamic object
  dynamic jsonData = json.decode(jsonStr);

  return jsonData;
}

bool valoresrecomendados(
  String categoria,
  int? valor,
) {
// Verifique se qual categoria e se for um valor abaixo ou maior que o permitido retorne true para bloquear
  if (categoria == "Personal & Dorms") {
    // Valor ideal entre $15 e $35
    if (valor! < 10 || valor > 35) {
      return true;
    }
  } else if (categoria == "Food Delivery & Shopping") {
    // Valor ideal entre $5 e $13
    if (valor! < 5 || valor > 13) {
      return true;
    }
  } else if (categoria == "Academic Help") {
    // Valor ideal entre $20 e $50
    if (valor! < 20 || valor > 50) {
      return true;
    }
  } else if (categoria == "Tech Support") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Transportation & Deliveries") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  } else if (categoria == "Health & Wellbeing") {
    // Valor ideal entre $5 e $13
    if (valor! < 5 || valor > 13) {
      return true;
    }
  } else if (categoria == "Event & Social Support") {
    // Valor ideal entre $20 e $50
    if (valor! < 20 || valor > 50) {
      return true;
    }
  } else if (categoria == "Moving & Organizing") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Maintenance & Repairs") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  } else if (categoria == "Pet Care") {
    // Valor ideal entre $10 e $30
    if (valor! < 10 || valor > 30) {
      return true;
    }
  } else if (categoria == "Creative Services & Media") {
    // Valor ideal entre $20 e $56
    if (valor! < 20 || valor > 56) {
      return true;
    }
  }
  return false;
}

int valoresrecomendadosMinimo(String categoria) {
  // Verifique os valores mínimos permitidos para cada categoria
  if (categoria == "Personal & Dorms") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Food Delivery & Shopping") {
    return 5; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Academic Help") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Tech Support") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Transportation & Deliveries") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Health & Wellbeing") {
    return 5; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Event & Social Support") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Moving & Organizing") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Maintenance & Repairs") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Pet Care") {
    return 10; // Retorna o valor mínimo recomendado para a categoria
  } else if (categoria == "Creative Services & Media") {
    return 20; // Retorna o valor mínimo recomendado para a categoria
  }

  return 0; // Retorna 0 se a categoria não for reconhecida
}

int valoresrecomendadosMaximo(String categoria) {
  // Verifique os valores máximos permitidos para cada categoria
  if (categoria == "Personal & Dorms") {
    return 35; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Food Delivery & Shopping") {
    return 13; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Academic Help") {
    return 50; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Tech Support") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Transportation & Deliveries") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Health & Wellbeing") {
    return 13; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Event & Social Support") {
    return 50; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Moving & Organizing") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Maintenance & Repairs") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Pet Care") {
    return 30; // Retorna o valor máximo recomendado para a categoria
  } else if (categoria == "Creative Services & Media") {
    return 56; // Retorna o valor máximo recomendado para a categoria
  }

  return 0; // Retorna 0 se a categoria não for reconhecida
}

int chequeurgencia(String choicechip) {
// retorne uma taxa em inteiro baseado na urgencia em low, medium, high, urgency
  switch (choicechip) {
    case 'Low':
      return 2;
    case 'Medium':
      return 3;
    case 'High':
      return 5;
    case 'Urgent':
      return 6;
    default:
      return 0;
  }
}

int diferencaPorcentagem(String value) {
  // calcule a diferença de valor em 12%
  double valor = double.parse(value);
  double diferenca = valor * 0.12;
  return diferenca.toInt();
}

double somatoriaSimples(
  String? number,
  String? number2,
  String? number3,
  String? number4,
) {
  // faça a somatoria dos valores (NUMBER 4 É PORCENTAGEM SOMENTE)
  double num1 = double.tryParse(number ?? '0') ?? 0;
  double num2 = double.tryParse(number2 ?? '0') ?? 0;
  double num3 = double.tryParse(number3 ?? '0') ?? 0;
  double percentage = double.tryParse(number4 ?? '0') ?? 0;

  double total = num1 + num2 + num3;
  double percentageValue = (total * percentage) / 100;

  return total + percentageValue;
}

int formatStringInter(String texto) {
  // converta a string em inteiro
  return int.tryParse(texto) ?? 0;
}

int valorcomporcentagem(String value) {
  // retorne a somatoria do valor com uma porcentagem de 12%
  int valor = int.parse(value);
  double porcentagem = valor * 0.12;
  return (valor + porcentagem).round();
}

String verifiqueQualCartao(String cardNumber) {
  // retorne o nome da bandeira do cartão baseada em: Visa: Começa com o número 4, Mastercard: Começa com os números 51 a 55, ou ainda com a faixa de 2221 a 2720, American Express: Começa com 34 ou 37, Discover: Começa com 6011, 65, ou com a faixa de 644 a 649, Elo: Pode começar com vários intervalos, incluindo 4011, 4312, 4389, entre outros, Hipercard: Geralmente começa com 6062
  if (cardNumber.startsWith('4')) {
    return 'Visa';
  } else if ((cardNumber.startsWith('51') ||
          cardNumber.startsWith('52') ||
          cardNumber.startsWith('53') ||
          cardNumber.startsWith('54') ||
          cardNumber.startsWith('55')) ||
      (int.parse(cardNumber) >= 2221 && int.parse(cardNumber) <= 2720)) {
    return 'Mastercard';
  } else if (cardNumber.startsWith('34') || cardNumber.startsWith('37')) {
    return 'American Express';
  } else if (cardNumber.startsWith('6011') ||
      cardNumber.startsWith('65') ||
      (int.parse(cardNumber) >= 644 && int.parse(cardNumber) <= 649)) {
    return 'Discover';
  } else if (cardNumber.startsWith('4011') ||
      cardNumber.startsWith('4312') ||
      cardNumber.startsWith('4389')) {
    return 'Elo';
  } else if (cardNumber.startsWith('6062')) {
    return 'Hipercard';
  } else {
    return 'Desconhecido';
  }
}

String esconderCartaoDeCredito(String cardNumber) {
  // esconda o cartão de credito mostrando somente os ultimos 4 numeros (exemplo: **** **** **** 3425) com espaços
  if (cardNumber.length < 4) {
    return cardNumber;
  }

  String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
  String hiddenDigits = '';
  for (int i = 0; i < cardNumber.length - 4; i++) {
    if (cardNumber[i] == ' ') {
      hiddenDigits += ' ';
    } else {
      hiddenDigits += '*';
    }
  }

  return '$hiddenDigits $lastFourDigits';
}

double? somatoriaPorcetagem(
  String number1,
  String? number2,
) {
  // calcule o valor do numer1 + number2  e retorne-os somente o valor do calculo de 8%
  double num1 = double.tryParse(number1) ?? 0.0;
  double num2 = double.tryParse(number2 ?? '0') ?? 0.0;
  double total = num1 + num2;
  return total * 0.08; // Retorna 8% do total
}

List<TasksRecord> buscarRegiao(
  List<TasksRecord> task,
  LatLng localizacaoDoUsuario,
  double localizacaoMaxima,
  List<LatLng> locationComunity,
) {
  List<TasksRecord> placesList = [];

  double latUser = localizacaoDoUsuario.latitude;
  double lonUser = localizacaoDoUsuario.longitude;

  bool estaDentroDaArea = false;

  for (LatLng pontoComunitario in locationComunity) {
    double latCom = pontoComunitario.latitude;
    double lonCom = pontoComunitario.longitude;

    // Fórmula de Haversine
    var c = math.cos;
    var p = 0.017453292519943295;
    var a = 0.5 -
        c((latCom - latUser) * p) / 2 +
        c(latUser * p) * c(latCom * p) * (1 - c((lonCom - lonUser) * p)) / 2;
    var d = 12742 * math.asin(math.sqrt(a)); // distância em km

    double distancia = double.parse(d.toStringAsFixed(2));

    if (distancia <= localizacaoMaxima) {
      estaDentroDaArea = true;
      break; // já encontrou um ponto dentro da área, pode parar
    }
  }

  if (estaDentroDaArea) {
    // Usuário está dentro de pelo menos uma área comunitária
    return task; // ou aplicar filtro extra aqui se quiser
  } else {
    // Fora de todas as áreas
    return [];
  }
}

int formateInteiroEmDouble(double doble) {
  // formate double em inteiro
  return doble.toInt();
}

List<int> retorneMaisImagens(String choiceChips) {
  // se o choiceChips retornar (1 Step, 2 Steps, 3 Steps, 4 +, 5,6,7,8 desse jeito mesmo) retorne o numero
  switch (choiceChips) {
    case '1 Step':
      return [1];
    case '2 Steps':
      return [2];
    case '3 Steps':
      return [3];
    case '4 +':
      return [4];
    case '5':
      return [5];
    case '6':
      return [6];
    case '7':
      return [7];
    case '8':
      return [8];
    default:
      return [];
  }
}

int calcularRatings(List<AvaliacoesStruct>? avaliacoes) {
  // calcule a media de ratings baseado em avaliacoes.rating sendo inteiro
  if (avaliacoes == null || avaliacoes.isEmpty) {
    return 5; // Retorna 0 se a lista estiver vazia ou nula
  }

  int totalRatings = 0;
  for (var avaliacao in avaliacoes) {
    totalRatings += avaliacao.rating; // Soma as avaliações
  }

  return (totalRatings ~/ avaliacoes.length); // Calcula a média
}

double fastPass(
  String porcentagem,
  double valortotal,
) {
  // retorne somente o calculo da porcentagem do valor total tipo (35% do valor total = $3,35 dol)
  double percent = double.parse(porcentagem.replaceAll('%', '')) / 100;
  return valortotal * percent;
}

List<String> separarTexto(String texto) {
  // separe o texto por espaço
  return texto.split(' '); // Separa o texto por espaço
}

int indexList1(String indexList) {
  // faça q quando o indexlist retornar 0 no front end ser 1 e etc
  int index =
      int.tryParse(indexList) ?? 0; // Convert string to int, default to 0
  return index + 1; // Increment index by 1
}
