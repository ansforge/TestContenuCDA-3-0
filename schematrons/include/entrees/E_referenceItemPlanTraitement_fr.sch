<?xml version="1.0" encoding="UTF-8"?>

<!-- E_referenceItemPlanTraitement_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Reference-item-plan-traitement (IHE-PRE - Reference-to-Medication-Treatment-Plan-Item - 1.3.6.1.4.1.19376.1.9.1.3.10) aux spécifications du CI-SIS.
     ......................................................................................................................................................
     Historique :
     - 09/06/2020 : Création
     - 30/11/2020 : Finalisation
     - 12/01/2014 : MAJ du schematron
-->

    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_referenceItemPlanTraitement_fr">
        <title>CI-SIS Entrée "FR-Reference-item-plan-traitement"</title>
        
        <!-- Test des templateId pour l'entrée "FR-Reference-item-plan-traitement" -->
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.10']">
            
            <!-- Test des templateId pour l'entrée "FR-Reference-item-plan-traitement" -->
            <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.85']">
                [1] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité CI-SIS : 
                L'entrée "FR-Reference-item-plan-traitement" doit avoir deux occurrences de 'templateId' :
                - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.10"
                - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.85"
            </assert>
            <!-- Test présence et format de l'élément 'id' -->
            <assert test="(count(cda:id)=1)">
                [2] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée FR-Reference-item-plan-traitement doit comporter un élément 'id'.
            </assert>
            
            <!-- Test présence et format de l'élément 'code' -->
            <assert test="(count(cda:code[@code='MTPItem'][@codeSystem='1.3.6.1.4.1.19376.1.9.2.2'])=1) and count(cda:code)=1">
                [3] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée FR-Reference-item-plan-traitement doit comporter un élément 'code' et ses attribut :
                - @code="MTPItem" (cardinalité [1..1])
                - @codeSystem="1.3.6.1.4.1.19376.1.9.2.2" (cardinalité [1..1])
            </assert>
            
            <!-- Test présence et format de l'élément 'consumable' -->
            <assert test="(count(cda:consumable)=1)">
                [4] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée FR-Reference-item-plan-traitement doit comporter un élément 'id'.
            </assert>
            
            <!-- Test présence de l'entrée 'FR-Item-plan-traitement' -->
            <assert test="cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.96']">
                [5] [E_referenceItemPlanTraitement_fr.sch] Erreur de conformité IHE Pharm PRE : 
                L'entrée FR-Reference-item-plan-traitement, l'entrée FR-Item-plan-traitement doit être présente une seule fois [1..1].
            </assert>
        </rule>
            
    </pattern>
