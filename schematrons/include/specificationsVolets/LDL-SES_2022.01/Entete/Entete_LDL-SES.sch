<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_LDL-SES.sch
    Teste la conformité de l'entete du volet LDL-SES au CI-SIS
    
    Historique :
    07/02/2018 : Création   
    03/05/2021 : Modification des msg d'erreur
    16/03/2022 : Suppresion du test sur le code du serviceEvent
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_LDL-SES">
    
    <rule context='cda:ClinicalDocument'>
        
        <assert test="cda:code[@code='11490-0']">
            [Entete_LDL-SES] Erreur de conformité : L'élément
            "code" de la LDL-SES doit avoir les attributs @code="11490-0" et
            @codeSystem="2.16.840.1.113883.6.1".
        </assert>
        <!-- Verifier le setId du modèle -->
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_LDL-SES] Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <!-- Verifier le versionNumber du modèle -->
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_LDL-SES] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        
        <assert test="cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            [Entete_LDL-SES] Erreur de conformité : La date de naissance du patient est obligatoire.
        </assert>
        
<!--        <assert test="cda:documentationOf/cda:serviceEvent/cda:code[@code='IMP']">
            [Entete_LDL-SES] Erreur de conformité : L'attribut code de l'élément documentationOf/serviceEvent/code est fixé à 'IMP'.
        </assert>-->
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
            [Entete_LDL-SES] Erreur de conformité : La date du début d'exécution de l'acte est obligatoire.
        </assert>
        
    </rule>
</pattern>