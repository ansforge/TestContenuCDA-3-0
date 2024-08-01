<?xml version="1.0" encoding="UTF-8"?>

<!-- E_laboratoryReportDataProcessing_BIO-TROD.sch 
    
    Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-TROD.
    
    Historique :
    20/12/2023 : Création
    03/06/2024 : MAJ
     01/08/2024 : Renommage du document en BIO-TROD 
     01/08/2024 : Ajout des tests sur le dispositif utilisé
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoryReportDataProcessing_BIO-TROD">
    <title>Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-TROD </title>
    
    <!-- ****** Contexte : Entrée FR-Resultats-examens-de-biologie-medicale ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1"]'>
        
        
        <!-- Vérification de la présence de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent' --> 
        <assert test='count(..//cda:entry/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"])&gt;=1'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : 
            L'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" est obligatoire et doit être présente une ou plusieurs fois [1..*].
        </assert>
        
        <!-- Vérification de l'élément "participant" (pour préciser le dispositif de test utilisé) --> 
        
        <assert test='not(..//cda:entry/cda:act/cda:participant) or (..//cda:entry/cda:act/cda:participant[@typeCode="DEV"])'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : 
            L'élément participant s'il est présent, doit avoir un @typeCode="DEV" avec un fils participantRole de classCode 'MANU'. 
        </assert>
        <!-- UDI du dispositif de test utilisé -->
        <assert test='not (..//cda:participant/cda:participantRole/cda:id) or (..//cda:participant/cda:participantRole/cda:id[@root="2.51.1.1" or @root="1.0.15961.10.816" or @root="1.0.15961.10.816" or @root="2.16.840.1.113883.6.18.1.34"])'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : 
            L'élément participant/participantRole/id s'il est présent, doit avoir un attribut @root="2.51.1.1" or @root="1.0.15961.10.816" or @root="1.0.15961.10.816" or @root="2.16.840.1.113883.6.18.1.34". 
        </assert>
        <!-- Nom du fabricant / référence / N° de lot -->
        <assert test='not (..//cda:participant/cda:participantRole/cda:playingDevice/cda:code) or (..//cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code) or  (..//cda:participant/cda:participantRole/cda:playingDevice/cda:code[@nullFlavor]/cda:originalText/cda:reference)'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : Si l'élément participant/participantRole/playingDevice/code n'est pas disponible (Code UDI du dispositif utilisé pour le test), l'élément participant/participantRole/playingDevice/code[@nullFlavor="UNK"]/originalText/reference (Nom du fabricant, référence et n° de lot du dispositif utilisé pour le test) est obligatoire.
           </assert>
        
    </rule>
</pattern>


