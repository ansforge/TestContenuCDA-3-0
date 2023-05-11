<?xml version="1.0" encoding="UTF-8"?>

<!-- E_DM_CARD-F-PRC-TAP.sch     
      
    
    Historique :
    04/02/2022 : Création
    03/01/2023 Mise à jour pour la créer un schématron spécifique à chaque volet CARD-F-PRC
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DM_CARD-F-PRC-TAP">
    <title>CI-SIS - E_DM_CARD-F-PRC-TAP</title>

    <rule
        context='*[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry'>

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
        context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply'>
        <assert
            test='cda:participant/cda:participantRole/cda:playingDevice/cda:code[@code="D0001-12"]'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: Le code de DM doit obligatoirement avoir le code "D0001-12".
        </assert>
       
        <!-- Localisation -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="257880008"'>
            [E_DM-TAP] Erreur de Conformité CI-SIS: L'élément Localisation est obligatoire.
        </assert>
    </rule>
</pattern>
