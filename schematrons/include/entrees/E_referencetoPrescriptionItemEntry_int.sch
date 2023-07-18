<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_referencetoPrescriptionItemEntry_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée Reference to Prescription Item Content Module aux spécifications du profil IHE-PHARM-PRE
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referencetoPrescriptionItemEntry_int">
    <title>Vérification de la conformité de l'entrée "Reference to Prescription Item Content Module" </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.9.1.3.11"]'>
        
        <assert
            test="self::cda:substanceAdministration[@classCode='SBADM' and @moodCode='INT']">
            [E_referencetoPrescriptionItemEntry_int] Erreur de conformité IHE-PHARM-PRE : Dans l'entrée Reference to Prescription Item Content Module (1.2.250.1.213.1.1.3.90), 
            les attributs de l'élément CDA 'observation' sont classCode='SBADM' et moodCode='INT'</assert>
        
        <!-- Test des templateId pour l'entrée "Reference to Prescription Item Content Module" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.10']">
            
            [E_referencetoPrescriptionItemEntry_int] Erreur de conformité IHE-PHARM-PRE : 
            L'entrée "Reference to Prescription Item Content Module" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.10"
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)=1'>
            [E_referencetoPrescriptionItemEntry_int] : Erreur de conformité IHE-PHARM-PRE : L'élément "id" est présent une fois [1..1].
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="PREItem" and cda:code/@codeSystem="1.3.6.1.4.1.19376.1.9.2.2"'>
            [E_referencetoPrescriptionItemEntry_int] : Erreur de conformité IHE-PHARM-PRE : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='PREItem' 
            et le codeSystem='1.3.6.1.4.1.19376.1.9.2.2'.
        </assert>
        
        <!-- Test présence de l'élément 'consumable' -->
        <assert test="count(cda:consumable)=1"> 
            [E_referencetoPrescriptionItemEntry_int] : Erreur de conformité IHE-PHARM-PRE : L'élément "consumable" doit être présent une fois.
        </assert>
        <assert test='cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial[@nullFlavor="NA"]'>
            [E_referencetoPrescriptionItemEntry_int] : Erreur de conformité IHE-PHARM-PRE : L'élément "manufacturedMaterial" doit avoir l'attribut @nullFlavor="NA".
        </assert>
    </rule>
    
</pattern>
