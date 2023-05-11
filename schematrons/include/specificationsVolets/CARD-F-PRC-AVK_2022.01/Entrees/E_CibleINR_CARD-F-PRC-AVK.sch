<?xml version="1.0" encoding="UTF-8"?>

<!--  E_CibleINR_CARD-F-PRC-AVK.sch
    
    Teste la conformité d'une entrée utilisée dans le volet du CI-SIS aux spécifications de l'entrée 
   	FR-Demande-d-examen-ou-de-suivi (1.2.250.1.213.1.1.3.27) de la section FR-Plan-de-soins
    Les contraintes présentes sont spécifiques du volet "Patients à Risques de Cardiologie".
    
    Historique :
    03/01/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_CibleINR_CARD-F-PRC-AVK">
    
    <title>CI-SIS Cible INR (CARD-F-PRC-AVK)</title>
    <rule context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.158"]//cda:observation[cda:templateId/@root = "1.2.250.1.213.1.1.3.27"]'>
        
        <assert test='cda:code[@code = "L0045" and @codeSystem="1.2.250.1.213.1.1.4.2"]'>
            [E_CibleINR_CARD-F-PRC-AVK] Erreur de Conformité CI-SIS: Le code de l'entrée FR-Demande-d-examen-ou-de-suivi (1.2.250.1.213.1.1.3.27) doit avoir obligatoirement @code = "L0045" et @codeSystem="1.2.250.1.213.1.1.4.2" </assert>
        
    </rule>
</pattern>
