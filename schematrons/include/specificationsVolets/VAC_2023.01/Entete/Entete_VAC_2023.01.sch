<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_VAC_2023.01.sch
    Teste la conformité de l'entete au modèle Historique de vaccination au CI-SIS
    
    Historique :
    15/04/2022 : Création
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_VAC_2023.01">
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient'>
        <assert test="cda:birthTime">
            [Entete_VAC_2021.01] Erreur de conformité : La date de naissance du patient est obligatoirement présente 
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument">
        <assert test="./cda:templateId[@root = '1.3.6.1.4.1.19376.1.5.3.1.1.18.1.2']">
            [Entete_VAC_2023.01] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.5.3.1.1.18.1.2" est obligatoire.
        </assert>
        
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.1.37']">
            [Entete_VAC_2023.01] Erreur de conformité : Le templateId "1.2.250.1.213.1.1.1.37" est obligatoire.
        </assert>
        
        <assert test="./cda:code[@code = '11369-6' and @codeSystem = '2.16.840.1.113883.6.1']">
            [Entete_VAC_2031.01] Erreur de conformité : L'élément code doit avoir les attributs @code="11369-6" et @codeSystem="2.16.840.1.113883.6.1".
        </assert>
        
        <!-- Verifier le setId du modèle -->
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_VAC_2031.01]  Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <!-- Verifier le versionNumber du modèle -->
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_VAC_2031.01] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:code[@code='11369-6']">
            [Entete_VAC_2023.01] Erreur de conformité : Le code de l'acte principal est codé et est fixé à code="11369-6" 
        </assert>
    </rule>
    
</pattern>