import 'package:flutter/widgets.dart';
import 'package:hackafront/product_card.dart';

Map<String, String> mapping = {
    "amp_formule_etudiante": 'Formule Etudiante AMP',
    "assurance_automobile": 'Assurance Automobile',
    "assurance_decouvert_autorise_hf": 'Assurance Découvert Autorisé HF',
    "assurance_emprunteur_lcl": 'Assurance Emprunteur LCL',
    "assurance_habitation": 'Assurance Habitation',
    "assurance_revenus": 'Assurance Revenus',
    "capital_deces": 'Capital Décès',
    "carte_cleo": 'Carte Cleo',
    "carte_premier": 'Carte Premier',
    "carte_zen": 'Carte Zen',
    "credit_renouvelable": 'Crédit renouvelable',
    "lcl_etudiant": 'LCL Etudiant',
    "lcl_vie_et_prevoyance": 'LCL Vie et Prévoyance',
    "lcl_vie_jeunes": 'LCL Vie Jeunes',
    "livret_a": 'Livret A',
    "livret_dev_durable_et_solidaire": 'Livret Developpement Durable et Solidaire',
    "livret_epargne_populaire": 'Livret Epargne Populaire',
    "livret_jeune": 'Livret Jeune',
    "plan_epargne_en_actions": 'Plan Epargne en Actions',
    "plan_epargne_logement": 'Plan Epargne Logement',
    "pret_immobilier": 'Prêt Immobilier',
    "pret_personnel_auto": 'Prêt Personnel Auto',
    "pret_personnel_budget": 'Prêt Personnel Budget',
    "pret_personnel_etudes": 'Prêt Personnel Etudes'
};

class AccountViewer extends StatelessWidget {
  final dynamic map;

  const AccountViewer({super.key, required this.map});

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 1,
    direction: Axis.horizontal,
    children: map.entries.map((entry) => ProductCard(mapping[entry.key]!, value(entry.value))).whereType<Widget>().toList(),
  );

  int value(dynamic v) {
    if (v is bool) {
      return v ? 100 : 0;
    }
    return v;
  }

}