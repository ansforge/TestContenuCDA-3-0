<?xml version="1.0" encoding="UTF-8"?>

<!-- E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST.sch 
    
    Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-ATTEST-DEPIST.
    
    Historique :
    20/12/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST">
    <title>Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-ATTEST-DEPIST </title>
    
    <!-- ****** Contexte : Entrée FR-Resultats-examens-de-biologie-medicale ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1"]'>
        
        
        <!-- Vérification de la présence de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent' --> 
        <assert test='..//cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"]'> 
            [E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST] Erreur de conformité : 
            L'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" est obligatoire.
        </assert>
        
        <!-- Vérification de la présence de 'la date et l'heure du test' --> 
        <assert test='..//cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"]/cda:effectiveTime'> 
            [E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST] Erreur de conformité : 
            La date et l'heure du test sont obligatoires.
        </assert>
        
        <!-- Vérification du 'résultat du test de dépistage'  --> 
        <assert test='..//cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"]/cda:value'> 
            [E_laboratoryReportDataProcessing_BIO-ATTEST-DEPIST] Erreur de conformité : 
            Le résultat du test de dépistage (l'élément : value) est obligatoire.
        </assert>
    </rule>
</pattern>


