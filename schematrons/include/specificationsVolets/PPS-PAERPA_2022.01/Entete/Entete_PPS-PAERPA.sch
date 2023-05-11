<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_PPS-PAERPA.sch
    Teste la conformité de l'entete du PPS-PAERPA au CI-SIS
    
    Historique :
    10/11/2022 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_PPS-PAERPA">
    
    <!-- Contrôles spécifiques à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.20']"> 
            [Entete_PPS-PAERPA] Le templateId de conformité au modèle PPS-PAERPA_2022.01 (1.2.250.1.213.1.1.1.20) doit être présent.
        </assert>
        <assert test="./cda:code[@code='18776-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_PPS-PAERPA] L'élément code doit avoir @code ="18776-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>        
    
</pattern>