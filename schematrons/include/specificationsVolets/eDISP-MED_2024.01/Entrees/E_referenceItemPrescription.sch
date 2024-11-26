<?xml version="1.0" encoding="UTF-8"?>

<!--                  
   E_referenceItemPrescription.sch
    Tester la conformité du contenu de l'entrée FR-Reference-item-prescription( 1.3.6.1.4.1.19376.1.9.1.3.11 ) sépcifiée dans le volet eDISP-MED
    
    Historique :
    24/01/2023 : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referenceItemPrescription">
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.11']">
        <assert test="./cda:code[@code='PREItem' and @codeSystem='1.3.6.1.4.1.19376.1.9.2.2']">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : le code de l'entrée FR-Reference-item-prescription (1.3.6.1.4.1.19376.1.9.1.3.11) doit être présent [1..1] et doit avoir 
            les attributs @code='PREItem' et @codeSystem='1.3.6.1.4.1.19376.1.9.2.2'
        </assert>
        <!-- consumable [1..1]-->
        <assert test="./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/@nullFlavor='NA'">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'élément manufacturedMaterial de l'entrée FR-Reference-item-prescription (1.3.6.1.4.1.19376.1.9.1.3.11) doit etre présent et doit avoir
            comme attribut nullFlavor="NA".
        </assert>
    </rule>
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.83']">
        <!-- [1..1] Entrée FR-Autorisation-Substitution -->
        <assert test="count(cda:entryRelationship/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.1'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée  FR-Autorisation-Substitution (1.3.6.1.4.1.19376.1.9.1.3.9.1) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-En-rapport-avec-ALD -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.13'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-ALD (1.2.250.1.213.1.1.3.48.13) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-En-rapport-avec-accident-travail -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.14'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-accident-travail (1.2.250.1.213.1.1.3.48.14) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-Non-remboursable -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.15'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée FR-Non-remboursable (1.2.250.1.213.1.1.3.48.15) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-En-rapport-avec-la-prevention -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.34'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée FR-En-rapport-avec-la-prevention (1.2.250.1.213.1.1.3.48.34) est obligatoire.
        </assert>
        <!-- [1..1] Entrée FR-Hors-AMM -->
        <assert test="count(cda:entryRelationship/cda:observation/cda:templateId[@root='1.2.250.1.213.1.1.3.48.12'])=1">
            [E_referenceItemPrescription.sch] Erreur de conformité CI-SIS : l'entrée FR-Hors-AMM (1.2.250.1.213.1.1.3.48.12) est obligatoire.
        </assert>
    </rule>
</pattern>