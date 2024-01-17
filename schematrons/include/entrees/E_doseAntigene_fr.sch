<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_doseAntigene_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Dose-antigene (1.2.250.1.213.1.1.3.46)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_doseAntigene_fr">
    <title>CI-SIS dose antigene</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.46"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='EVN' and @negationInd='false']">
            [E_doseAntigene_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Dose-antigene(1.2.250.1.213.1.1.3.46), 
            les attributs de l'élément CDA 'substanceAdministration' sont classCode='SBADM' et moodCode='EVN' et negationInd='false'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois [1..1].
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Dose-antigene" -->
        <assert test="count(cda:templateId[@root='1.2.250.1.213.1.1.3.46'])&lt;=1">
            [1] [E_doseAntigene_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Dose-antigene" peut comporter le 'templateId' suivant:
            - Un 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.46" qui peut être présent [0..1].
        </assert>
        
        <assert test="cda:doseQuantity"> 
            [E_doseAntigene_fr] : L'élément doseQuantity doit être présent une fois</assert>
        
        <assert test='cda:consumable'>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément consumable doit être présent une fois.
        </assert>
        
    </rule>
    
</pattern>
