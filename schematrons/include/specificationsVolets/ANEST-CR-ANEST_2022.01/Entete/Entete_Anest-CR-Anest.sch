<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_Anest-CR-Anest.sch
    Teste la conformité de l'entete d'Anest-CR-Anest au CI-SIS
    
    Historique :
    09/11/2022 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_Anest-CR-Anest">
    
    <!-- Contrôles spécifiques à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.40']"> 
            [Entete_ANEST-CR-ANEST] Erreur de conformité au modèle : Le templateId "1.2.250.1.213.1.1.1.40" doit être présent.
        </assert>
        <assert test="./cda:code[@code='77436-4' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_ANEST-CR-ANEST] Erreur de conformité au modèle : L'élément "code" doit avoir les attributs @code="77436-4" et @codeSystem="2.16.840.1.113883.6.1". 
        </assert>
    </rule>
    
        
</pattern>