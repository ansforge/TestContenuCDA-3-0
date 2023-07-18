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
        
        <assert test='count(cda:id)&gt;=1'>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois [1..*].
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Dose-antigene" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.46'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.1']">
            [1] [E_doseAntigene_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Dose-antigene" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.46"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.12.1" 
        </assert>
        
        <assert test="cda:doseQuantity"> 
            [E_doseAntigene_fr] : L'élément doseQuantity doit être présent une fois</assert>
        
        <assert test='cda:consumable'>
            [E_doseAntigene_fr] : Erreur de conformité CI-SIS : L'élément consumable doit être présent une fois.
        </assert>
        
    </rule>
    
</pattern>
