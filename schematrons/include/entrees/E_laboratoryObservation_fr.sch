<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_laboratoryObservation_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent (1.2.250.1.213.1.1.3.80) aux spécifications du CI-SIS
    
    Historique :
    06/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoryObservation_fr">
    <title>Vérification de la conformité de l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.80"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_laboratoryObservation_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Resultat-examens-de-biologie-element-clinique-pertinent(1.2.250.1.213.1.1.3.80), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.6']">
            
            [E_laboratoryObservation_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Resultat-examens-de-biologie-element-clinique-pertinent" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.3.1.6"
        </assert>
        <!--Vérifier la présence de l'élément "code" --> 
        <assert test='count(cda:code)=1'>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois[1..1].
        </assert>
        <!--Vérifier la présence de l'élément "originalText" --> 
        <assert test='count(cda:code/cda:originalText)=1'>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "code" doit contenir l'élément "originalText" une seule fois[1..1].
        </assert>
        <!--Vérifier la présence de l'élément "reference" -->
        <assert test='count(cda:code/cda:originalText/cda:reference)=1'>
            [E_laboratoryObservation_fr] : Erreur de conformité CI-SIS : L'élément "originalText" doit contenir l'élément "reference" une fois[1..1].
        </assert>
        
        <!--Vérifier la présence de l'élément "statusCode" et la cohérence de ses attributs  --> 
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted' or cda:statusCode/@code='active' or cda:statusCode/@code='obsolete'">
            [E_laboratoryObservation_fr] Erreur de Conformité CI-SIS : L'élément "statusCode" doit être présent et fixé à la valeur @code='completed' ou @code='aborted' ou @code='active' @code='obsolete'..
        </assert>
    </rule>
    
</pattern>
