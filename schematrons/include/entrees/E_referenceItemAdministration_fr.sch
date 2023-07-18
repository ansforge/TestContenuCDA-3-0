<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_referenceItemAdministration_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Reference-item-administration (1.2.250.1.213.1.1.3.93) aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referenceItemAdministration_fr">
    <title>Vérification de la conformité de l'entrée FR-Reference-item-administration </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.93"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='EVN']">
            [E_referenceItemAdministration_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-item-administration (1.2.250.1.213.1.1.3.93), 
            les attributs de l'élément CDA 'observation' sont classCode='SBADM' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Reference-item-administration" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.14']">
            
            [E_referenceItemAdministration_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-item-administration " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.14"
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="CMAItem" and cda:code/@codeSystem="1.3.6.1.4.1.19376.1.9.2.2"'>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='CMAItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </assert>
        
        <!-- Test présence de l'élément 'consumable' -->
        <assert test="count(cda:consumable)=1"> 
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </assert>
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor="NA"]'>
            [E_referenceItemAdministration_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA" .
        </assert>
    </rule>
    
</pattern>
