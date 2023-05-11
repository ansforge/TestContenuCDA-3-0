<?xml version="1.0" encoding="UTF-8"?>

<!-- E_DM-TAP.sch     
      
    
    Historique :
    04/02/2022 : Création
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DM-TAP">
    <title>CI-SIS - DM-TAP</title>

    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.2"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry'>

        <!-- Verifier que le Supply contient au moins un Participant -->
        <assert test='cda:supply/cda:participant'>
            [E_DM-TAP] Erreur de Conformité PCC: L'élément supply doit au moins contenir un participant</assert>
        
        <!-- Verifier que le Supply contient une date d'implantation -->
        <assert test='cda:supply/cda:effectiveTime'>
            [E_DM-TAP] Erreur de Conformité PCC: L'élément supply doit au moins contenir un participant</assert>

        <!-- numéro de série -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:id'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: Le numéro de série du matériel est un élément
            obligatoire du Supply.</assert>

        <!-- Code de matériel implanté -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: Le code du matériel est un élément
            obligatoire du Supply.</assert>
        
        <!-- Marque et modèle de l'implant -->
        <assert
            test='count(cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code/cda:translation)&gt;2'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: Il faut au minimum 3 éléments translation pour représenter le type d'endoprothèse, son nom et son modèle </assert>
        
    </rule>
        
    <!--D0001-12 Endoprothèse -->
    
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.5"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-12"]'>
        
        
        <!-- Localisation -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0054"'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: L'élément Localisation est obligatoire.
        </assert>
    </rule>
</pattern>
