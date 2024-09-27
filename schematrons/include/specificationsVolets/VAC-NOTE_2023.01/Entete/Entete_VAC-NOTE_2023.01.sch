<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_VAC-NOTE_2022.01.sch
    Teste la conformité de l'entete au modèle Historique de vaccination au CI-SIS
    
    Historique :
    15/04/2021 : Création
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_VAC-NOTE">
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient'>
        <assert test="cda:birthTime">
            [Entete_VAC-NOTE] Erreur de conformité : La date de naissance du patient est obligatoirement présente 
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument">
        
        
        <assert test="./cda:templateId[@root = '1.3.6.1.4.1.19376.1.5.3.1.1.18.1.2']">
            [Entete_VAC-NOTE] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.5.3.1.1.18.1.2" est obligatoire.
        </assert>
        
        <assert test="count(cda:templateId[@root = '1.2.250.1.213.1.1.1.46' and @extension='2023.01'])=1">
            [Entete_VAC-NOTE] Erreur de conformité : Le templateId "1.2.250.1.213.1.1.1.46" est obligatoire.
        </assert>
        
        <assert test="./cda:code[@code = '87273-9' and @codeSystem = '2.16.840.1.113883.6.1']">
            [Entete_VAC-NOTE] Erreur de conformité : L'élément code doit avoir les attributs @code="87273-9" et @codeSystem="2.16.840.1.113883.6.1".
        </assert>
    </rule>
    
</pattern>