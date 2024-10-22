<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_SDMMR.sch
    Teste la conformité de l'entete du volet SDMMR au CI-SIS
    
    Historique :
    07/02/2018 : NMA : Création
    11/02/2019 : APE : Ajout du contrôle du nom de famille obligatoire
    10/11/2022 : Mises à jour suite à la migration des terminologies
    21/10/2024 : Suppression des tests sur le consentement
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_SDMMR">
    
    <rule context='cda:ClinicalDocument'>
         
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.30']"> 
            [Entete_SDMMR] Le template du modèle SDM-MR (1.2.250.1.213.1.1.1.30) doit être présent.
        </assert>
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_SDMMR] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1" 
        </assert>
        <assert test="cda:recordTarget/cda:patientRole[@classCode='PAT']">
            [Entete_SDMMR] L'élément patientRole du recordTarget doit avoir @classCode='PAT'
        </assert>
        <assert test="cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
            [Entete_SDMMR] La date de naissance du patient est obligatoirement présente 
        </assert>
        <assert test="cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:family[@qualifier='BR']">
            [Entete_SDMMR] Le nom de famille du patient (élément family) est obligatoire et son attribut qualifier doit être fixé à 'BR'
        </assert>  
        <assert test="cda:documentationOf/cda:serviceEvent/cda:code[@code='11429006']">
            [Entete_SDMMR] L'attribut code de l'élément documentationOf/serviceEvent/Code est fixé à '11429006'
        </assert>
        <!--<assert test="cda:authorization/cda:consent/cda:code[@code='GEN-315' or @code='GEN-317']">
            [Entete_SDMMR] L'attribut code de l'élément authorization/consent/Code est fixé à 
            - 'GEN-315' pour exprimer l'opposition du patient à l'utilisation de ses données dans le cadre d'analyses de santé publique
            ou
            - 'GEN-317' pour exprimer la non-opposition du patient à l'utilisation de ses données dans le cadre d'analyses de santé publique
        </assert>
        <assert test="(cda:authorization/cda:consent/cda:code[@code='GEN-315'] and cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.66']/cda:entry/cda:observation/cda:code[@code='GEN-316'])
            or (cda:authorization/cda:consent/cda:code[@code='GEN-317'] and not(cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.2.250.1.213.1.1.2.66']/cda:entry/cda:observation/cda:code[@code='GEN-316']))
            ">
            [Entete_SDMMR] Si l'attribut code de l'élément authorization/consent/Code est fixé à 'GEN-315', il faut préciser la date d'opposition du patient dans la section FR-Dossier (1.2.250.1.213.1.1.2.66).
        </assert>-->
          
    </rule>
    
</pattern>