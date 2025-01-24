import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectIconListProvider extends ChangeNotifier {
  final icons = <String, List<IconData>>{
    'Productividade': [
      FontAwesomeIcons.briefcase,
      FontAwesomeIcons.bookOpen,
      FontAwesomeIcons.calendarAlt,
      FontAwesomeIcons.tasks,
      FontAwesomeIcons.bullseye,
      FontAwesomeIcons.clock,
      FontAwesomeIcons.eye,
      FontAwesomeIcons.folderOpen,
      FontAwesomeIcons.stickyNote,
      FontAwesomeIcons.book,
      FontAwesomeIcons.code,
      FontAwesomeIcons
          .keyboard, // Considerar um ícone mais específico para escrita
      FontAwesomeIcons
          .commentDots, // Considerar um ícone mais específico para reuniões
      FontAwesomeIcons.projectDiagram,
      FontAwesomeIcons.handshake,
      FontAwesomeIcons
          .tools, // Considerar um ícone mais específico para aprendizagem de novas habilidades
      FontAwesomeIcons
          .sun, // Considerar um ícone mais específico para acordar cedo
      FontAwesomeIcons.listUl,
      FontAwesomeIcons.calendar,
      FontAwesomeIcons.trophy,
    ],
    'Finanças': [
      FontAwesomeIcons.coins,
      FontAwesomeIcons.piggyBank,
      FontAwesomeIcons.chartLine,
      FontAwesomeIcons.moneyBillAlt,
      FontAwesomeIcons
          .creditCard, // Considerar um ícone mais específico para redução de dívidas
      FontAwesomeIcons.calculator,
      FontAwesomeIcons.receipt,
      FontAwesomeIcons.moneyBill,
      FontAwesomeIcons.wallet,
      FontAwesomeIcons.piggyBank,
      FontAwesomeIcons
          .creditCard, // Considerar um ícone mais específico para score de crédito
      FontAwesomeIcons
          .fileInvoice, // Considerar um ícone mais específico para planejamento tributário
      FontAwesomeIcons.shieldAlt,
      FontAwesomeIcons.home, // Considerar um ícone mais específico para imóveis
      FontAwesomeIcons
          .userGraduate, // Considerar um ícone mais específico para planejamento de aposentadoria
      FontAwesomeIcons.book,
      FontAwesomeIcons.chartPie,
      FontAwesomeIcons.dollarSign,
      FontAwesomeIcons
          .minusSquare, // Considerar um ícone mais específico para despesas
      FontAwesomeIcons
          .plusSquare, // Considerar um ícone mais específico para ganhos
    ],
    'Saúde': [
      FontAwesomeIcons.running,
      FontAwesomeIcons.walking,
      FontAwesomeIcons.weight, // Considerar um ícone mais específico
      FontAwesomeIcons
          .medkit, // Considerar um ícone mais específico para meditação
      FontAwesomeIcons.bicycle,
      FontAwesomeIcons.swimmer,
      FontAwesomeIcons.moon, // Ícone representativo para sono
      FontAwesomeIcons
          .appleAlt, // Considerar um ícone mais específico para alimentação saudável
      FontAwesomeIcons.glassWater,
      FontAwesomeIcons
          .personRunning, // Considerar um ícone mais específico para alongamento
      FontAwesomeIcons
          .personBooth, // Considerar um ícone mais específico para pilates
      FontAwesomeIcons.mountain,
      FontAwesomeIcons.basketballBall,
      FontAwesomeIcons.futbol,
      FontAwesomeIcons.dumbbell,
      FontAwesomeIcons
          .heartbeat, // Considerar um ícone mais específico para estilo de vida saudável
    ],
    'Relações': [
      FontAwesomeIcons.userFriends,
      FontAwesomeIcons
          .heart, // Considerar um ícone mais específico para parceiro(a)
      FontAwesomeIcons.comment,
      FontAwesomeIcons
          .calendarAlt, // Considerar um ícone mais específico para encontros
      FontAwesomeIcons
          .user, // Considerar um ícone mais específico para tempo de qualidade
      FontAwesomeIcons.handsHelping,
      FontAwesomeIcons
          .volleyballBall, // Considerar um ícone mais específico para voluntariado
      FontAwesomeIcons.link,
      FontAwesomeIcons
          .handHoldingHeart, // Considerar um ícone mais específico para bondade
      FontAwesomeIcons
          .grinAlt, // Considerar um ícone mais específico para empatia
      FontAwesomeIcons.handsHelping,
      FontAwesomeIcons
          .headphones, // Considerar um ícone mais específico para escutar
      FontAwesomeIcons
          .handHolding, // Considerar um ícone mais específico para perdão
      FontAwesomeIcons
          .balanceScale, // Considerar um ícone mais específico para resolução de conflitos
      FontAwesomeIcons
          .usersCog, // Considerar um ícone mais específico para trabalho em equipe
      FontAwesomeIcons
          .globe, // Considerar um ícone mais específico para comunidade
      FontAwesomeIcons
          .heart, // Considerar um ícone mais específico para relacionamentos
      FontAwesomeIcons.dove,
    ],
    'Saúde mental': [
      FontAwesomeIcons
          .brain, // Considerar um ícone mais específico para mindfulness
      FontAwesomeIcons.book,
      FontAwesomeIcons
          .pencilAlt, // Considerar um ícone mais específico para journaling
      FontAwesomeIcons
          .userMd, // Considerar um ícone mais específico para terapia
      FontAwesomeIcons
          .heart, // Considerar um ícone mais específico para gratidão
      FontAwesomeIcons
          .smile, // Considerar um ícone mais específico para pensamento positivo
      FontAwesomeIcons
          .cloudSun, // Considerar um ícone mais específico para relaxamento
      FontAwesomeIcons.spa,
      FontAwesomeIcons.om,
      FontAwesomeIcons
          .lungs, // Considerar um ícone mais específico para exercícios respiratórios
      FontAwesomeIcons.moon, // Ícone representativo para qualidade do sono
      FontAwesomeIcons.tree,
      FontAwesomeIcons.music,
      FontAwesomeIcons
          .gamepad, // Considerar um ícone mais específico para hobbies
      FontAwesomeIcons.users,
      FontAwesomeIcons
          .featherAlt, // Considerar um ícone mais específico para escrita criativa
      FontAwesomeIcons.paintBrush,
      FontAwesomeIcons.graduationCap,
      FontAwesomeIcons
          .mobileAlt, // Considerar um ícone mais específico para detox digital
    ],
  };
}
