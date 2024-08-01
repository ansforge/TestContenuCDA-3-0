<?xml version="1.0" encoding="UTF-8"?>

<!-- E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD.sch 
    
    Vérification de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent (1.3.6.1.4.1.19376.1.3.1.6) du BIO-TROD.
    
    Historique :
    07/02/2024 : Création
    04/06/2024 : MAJ
     01/08/2024 : renommage du document en BIO-TROD 
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD">
    <title>Vérification de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent (1.3.6.1.4.1.19376.1.3.1.6) du BIO-TROD </title>
    
    <!-- ****** Contexte : Entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent ****** -->
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"]'>
        
        <!-- Vérification de l'élément 'code' --> 
        <assert test='count(cda:code)=1'>
            [E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois.
        </assert>
        
        <!-- Vérification de l'élément 'value' --> 
        <assert test='count(cda:value)=1' >
            [E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois.
        </assert>
        <!-- Vérification du type de l'élément 'value' --> 
        <assert test='cda:value[@xsi:type="CD" or @xsi:type="PQ" or @xsi:type="IVL_PQ"]' >
            [E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD] : Erreur de conformité CI-SIS : L'élément "value" est de type "CD", à l'exception du cas où le test effectué est un test capillaire d'évaluation de la glycémie, auquel la valeur du résultat est spécifiée comme 'PQ'.
        </assert>
        
        <!-- Vérification de la présence de 'la date et l'heure du test' --> 
        <assert test='cda:effectiveTime'> 
            [E_resultatExamensBiologieElementCliniquePertinent_BIO-TROD] : Erreur de conformité : 
            La date et l'heure du test sont obligatoires.
        </assert>
        
        <!-- Verification de l'entrée FR-Commentaire-ER -->
        <assert test="not(cda:entryRelationship) or (cda:entryRelationship[@typeCode ='SUBJ'])"> 
            [[E_FR-Resultat-examens-de-biologie-element-clinique-pertinent] Erreur de conformité :
            L'entrée FR-Commentaire-ER n'est pas obligatoire, si elle est présente, elle doit avoir un @typeCode ='SUBJ'. 
        </assert>
        
        
    </rule>
</pattern>


