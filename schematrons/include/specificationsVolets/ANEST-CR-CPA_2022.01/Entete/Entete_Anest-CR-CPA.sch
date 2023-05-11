<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_Anest-CR-CPA.sch
    Teste la conformité de l'entete d'Anest-CR-CPA au CI-SIS
    
    Historique :
    09/11/2022 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_Anest-CR-CPA">
    
    <!-- Contrôle spécifique à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.41']"> 
            [Entete_ANEST-CR-CPA] Le templateId "1.2.250.1.213.1.1.1.41" (Conformité au modèle ANEST-CR-CPA du CI-SIS) doit être présent.
        </assert>
        <assert test="./cda:code[@code='34749-2' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_ANEST-CR-CPA] L'élément "code" de ANEST-CR-CPA doit avoir les attributs @code ="34749-2" et @codeSystem = "2.16.840.1.113883.6.1". 
        </assert>
        <assert test="(./cda:documentationOf/cda:serviceEvent/cda:code[@code='CS' and @codeSystem='1.2.250.1.215.200.3.3']) or (./cda:documentationOf/cda:serviceEvent/cda:code[@code='APC' and @codeSystem='1.2.250.1.215.200.3.3']) "> 
            [Entete_ANEST-CR-CPA] L'élément "code" de l'acte principal doit avoir les attributs @code ="CS" ou "APC" et @codeSystem = "1.2.250.1.215.200.3.3". 
        </assert>
    </rule>
    
        
</pattern>