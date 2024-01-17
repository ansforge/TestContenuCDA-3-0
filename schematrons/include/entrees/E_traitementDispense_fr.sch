<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    E_traitementDispense_fr 
    Vérifie la conformité par rapport au profil Modèle de Contenus CDA de l'entrée FR-Traitement-dispense 1.2.250.1.213.1.1.3.204
    05/07/2023 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_traitementDispense_fr">
    <title>CI-SIS FR-Traitement-dispense</title>
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.204']">
        <let name="count_product" value="count(cda:product)"/>
        <let name="count_id" value="count(cda:id)"/>
        <let name="count_code" value="count(cda:code)"/>
        <let name="count_text" value="count(cda:text)"/>
        <let name="count_textReference" value="count(cda:text/cda:reference)"/>
        <let name="count_quantity" value="count(cda:quantity)"/>
        <let name="count_referenceItemPresc" value="count(cda:entryRelationship[@typeCode='REFR' and cda:substanceAdministration/cda:templateId/@root='1.2.250.1.213.1.1.3.90'])&lt;=1"/>
        <let name="count_traitement" value="count(cda:entryRelationship[@typeCode='COMP' and cda:substanceAdministration/cda:templateId/@root='1.2.250.1.213.1.1.3.42'])&lt;=1"/>
        <let name="count_insctructionPatient" value="count(cda:entryRelationship[@typeCode='SUBJ' and cda:substanceAdministration/cda:templateId/@root='1.2.250.1.213.1.1.3.33'])&lt;=1"/>
        <let name="count_notesDispensateur" value="count(cda:entryRelationship[@typeCode='SUBJ' and cda:substanceAdministration/cda:templateId/@root='1.2.250.1.213.1.1.3.207'])&lt;=1"/>
        <let name="count_acteSubstitution" value="count(cda:entryRelationship[@typeCode='COMP' and cda:substanceAdministration/cda:templateId/@root='1.2.250.1.213.1.1.3.206'])&lt;=1"/>
        
        <assert test="$count_id=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément id (cardinalité [1..1])
        </assert>
        <!-- Test des templateId pour l'entrée "FR-Traitement-dispense" -->
        <assert test="count(cda:templateId[@root='1.2.250.1.213.1.1.3.204'])&lt;=1 and cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.4'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.7.3'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.34']">
            
            [1] [E_traitementDispense_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Traitement-dispense" doit comporter les 'templateId' suivants:
            - Un 'templateId' IHE PHRAM DIS dont l'attribut @root="1.3.6.1.4.1.19376.1.9.1.3.4"
            - Un 'templateId' IHE PCC dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.7.3"
            - Un 'templateId' CCD dont l'attribut @root="2.16.840.1.113883.10.20.1.34"
            et peut comporter le 'templateId' France dont l'attribut @root="1.2.250.1.213.1.1.3.204" de cardinalité [0..1]
        </assert>
        <assert test="$count_code&lt;=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply peut contenir un élément 'code' (cardinalité [0..1])
        </assert>
        <assert test="$count_text=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'text' (cardinalité [1..1])
        </assert>
        <assert test="$count_textReference=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'text/reference' (cardinalité [1..1])
        </assert>
        <assert test="$count_quantity=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir un élément 'quantity' au maximum (cardinalité [1..1])
        </assert>
        <assert test="$count_product=1">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: L'élément supply doit contenir élément 'product' (cardinalité [1..1])
        </assert>
        <assert test="$count_referenceItemPresc">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='REFR', il doit avoir le templateId 1.2.250.1.213.1.1.3.90
        </assert>
        <assert test="$count_traitement">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='COMP', il doit avoir le templateId 1.2.250.1.213.1.1.3.205
        </assert>
        <assert test="$count_insctructionPatient">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='SUBJ', il doit avoir le templateId 1.2.250.1.213.1.1.3.33
        </assert>
        <assert test="$count_notesDispensateur">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='SUBJ', il doit avoir le templateId 1.2.250.1.213.1.1.3.207
        </assert>
        <assert test="$count_acteSubstitution">
            [E_traitementDispense_fr.sch] Errreur de conformité CI-SIS: Si l'élément supply contient un entryRelationship ayant le @typeCode='COMP', il doit avoir le templateId 1.2.250.1.213.1.1.3.206
        </assert>
    </rule>
</pattern>
