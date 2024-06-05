<?xml version="1.0" encoding="UTF-8"?>

<!-- E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST.sch 
    
    Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-ATTEST-DEPIST.
    
    Historique :
    20/12/2023 : Création
    03/06/2024 : MAJ
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST">
    <title>Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-ATTEST-DEPIST </title>
    
    <!-- ****** Contexte : Entrée FR-Resultats-examens-de-biologie-medicale ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1"]'>
        
        
        <!-- Vérification de la présence de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent' --> 
        <assert test='count(..//cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"])&gt;=1'> 
            [E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST] Erreur de conformité : 
            L'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" est obligatoire et doit être présente une ou plusieurs fois [1..*].
        </assert>
        
        <!-- Vérification de l'élément "participant" (pour préciser la marque et le numéro de lot du kit de dépistage) --> 
        
        <assert test='not(..//cda:entry/cda:act/cda:participant) or (..//cda:entry/cda:act/cda:participant[@typeCode="DEV"])'> 
            [E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST] Erreur de conformité : 
            L'élément participant s'il est présent, doit avoir un @typeCode="DEV" avec un fils participantRole de classCode 'MANU'. 
        </assert>
        
    </rule>
</pattern>


