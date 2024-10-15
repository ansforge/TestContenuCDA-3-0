<?xml version="1.0" encoding="UTF-8"?>

<!-- E_laboratoryReportDataProcessing_BIO-TROD.sch 
    
    Vérification de l'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.1) du BIO-TROD.
    
    Historique :
    20/12/2023 : Création
    03/06/2024 : MAJ
    01/08/2024 : Renommage du document en BIO-TROD 
    01/08/2024 : Ajout des tests sur le dispositif utilisé pour le test
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
        
        <!-- Vérification de l'élément "participant" : le dispositif utilisé pour le test  --> 
        
        <assert test='count(..//cda:entry/cda:act/cda:participant[@typeCode="DEV"])=1'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : L'élément participant est obligatoire [1..1], doit avoir un attribut @typeCode="DEV". 
        </assert>
        <!-- Code UDI du dispositif utilisé pour test -->
        <assert test='not (..//cda:participant/cda:participantRole/cda:id) or (..//cda:participant/cda:participantRole/cda:id[@root="2.51.1.1" or @root="1.0.15961.10.816" or @root="1.0.15961.10.816" or @root="2.16.840.1.113883.6.18.1.34"])'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : 
            L'élément participant/participantRole/id s'il est présent, doit avoir un attribut @root="2.51.1.1" or @root="1.0.15961.10.816" or @root="1.0.15961.10.816" or @root="2.16.840.1.113883.6.18.1.34". 
        </assert>
        <!-- Nom du fabricant, référence, N° de lot et date de péremption du dispositif utilisé pour le test-->
        <assert test='not (..//cda:participant/cda:participantRole/cda:playingDevice/cda:code) or  (..//cda:participant/cda:participantRole/cda:playingDevice/cda:code/cda:originalText/cda:reference)'> 
            [E_laboratoryReportDataProcessing_BIO-TROD] Erreur de conformité : Si l'élément participant/participantRole/id n'est pas disponible (Code UDI du dispositif utilisé pour le test), l'élément participant/participantRole/playingDevice/code/originalText/reference qui renvoi vers le texte enregistré dans la partie narrative de la section qui contient : ( le Nom du fabricant / référence / n° de lot et date de péremption du dispositif utilisé pour le test) est obligatoire.
           </assert>
        
    </rule>
</pattern>


