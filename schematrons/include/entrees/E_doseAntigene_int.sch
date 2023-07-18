<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_doseAntigene_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée IHE Antigen Dose entry (1.3.6.1.4.1.19376.1.5.3.1.4.12.1)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_doseAntigene_int">
    <title>CI-SIS dose antigene</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.12.1"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='EVN']">
            [E_doseAntigene_int] Erreur de conformité CI-SIS : Dans l'entrée IHE Antigen Dose entry(1.3.6.1.4.1.19376.1.5.3.1.4.12.1), 
            les attributs de l'élément CDA 'substanceAdministration' sont classCode='SBADM' et moodCode='EVN'</assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_doseAntigene_int] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois [1..*].
        </assert>
        
        <!-- Test des templateId pour l'entrée "IHE Antigen Dose entry" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.12.1']">
            [1] [E_doseAntigene_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "IHE Antigen Dose entry" doit comporter le 'templateId' suivant:
            - Un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.12.1"
        </assert>
        
        <assert test='cda:consumable'>
            [E_doseAntigene_int] : Erreur de conformité CI-SIS : L'élément consumable doit être présent une fois.
        </assert>
        
    </rule>
    
</pattern>
