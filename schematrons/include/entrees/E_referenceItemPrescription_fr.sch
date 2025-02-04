<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_referenceItemPrescription_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Reference-item-prescription (1.2.250.1.213.1.1.3.90) aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referenceItemPrescription_fr">
    <title>Vérification de la conformité de l'entrée FR-Reference-item-prescription </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.90"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='INT']">
            [E_referenceItemPrescription_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Reference-item-prescription (1.2.250.1.213.1.1.3.90), 
            les attributs de l'élément CDA 'observation' sont classCode='SBADM' et moodCode='INT'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Reference-item-prescription" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.11']">
            
            [E_referenceItemPrescription_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Reference-item-prescription " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.11"
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "id" est présent une fois [1..1].
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="PREItem" and cda:code/@codeSystem="1.3.6.1.4.1.19376.1.9.2.2"'>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='PREItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </assert>
        
        <!-- Test présence de l'élément 'consumable' -->
        <assert test="count(cda:consumable)=1"> 
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "consumable" doit être présent une fois.
        </assert>
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor="NA"]'>
            [E_referenceItemPrescription_fr] : Erreur de conformité CI-SIS : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA".
        </assert>
    </rule>
    
</pattern>
