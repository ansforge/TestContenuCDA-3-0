<?xml version="1.0" encoding="UTF-8"?>

<!--  E_TPINR_CARD-F-PRC-AVK.sch
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
   FR-Simple-Observation  (1.2.250.1.213.1.1.3.48) de la section FR-Resultats-examens
    Les contraintes présentes sont spécifiques du volet "Patients à Risques de Cardiologie".
    
    Historique :
    03/01/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_TPINR_CARD-F-PRC-AVK">
    
    <title>CI-SIS TP INR (CARD-F-PRC)</title>
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.151"]//cda:observation[cda:templateId/@root = "1.2.250.1.213.1.1.3.48"]'>
        
        <assert test='cda:code[@code = "3289-6" and @codeSystem="2.16.840.1.113883.6.1"]'>
            [E_TPINR_CARD-F-PRC-AVK] Erreur de Conformité CI-SIS: Le code de l'entrée FR-Simple-Observation  (1.2.250.1.213.1.1.3.48) doit avoir obligatoirement @code = "3289-6" et @codeSystem="2.16.840.1.113883.6.1" </assert>
        
    </rule>
</pattern>
