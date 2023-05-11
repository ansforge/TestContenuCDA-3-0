<?xml version="1.0" encoding="UTF-8"?>

<!-- E_DM-PPV.sch     

    
    
    Historique :
    04/02/2022 : Création
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DM-PPV">
    <title>CI-SIS - DM-PPV</title>

    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.5"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry'>

        <!-- Verifier que le Supply contient au moins un Participant -->
        <assert test='cda:supply/cda:participant'>
            [E_DM-PPV] Erreur de Conformité PCC: L'élément supply doit au moins contenir un participant</assert>
        
        <!-- Verifier que le Supply contient une date d'implantation -->
        <assert test='cda:supply/cda:effectiveTime'>
            [E_DM-PPV] Erreur de Conformité PCC: L'élément supply doit au moins contenir un participant</assert>

        <!-- numéro de série -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:id'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: Le numéro de série du matériel est un élément
            obligatoire du Supply.</assert>

        <!-- Code de matériel implanté -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: Le code du matériel est un élément
            obligatoire du Supply.</assert>
        
        <!-- Marque et modèle de l'implant -->
        <assert
            test='count(cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code/cda:translation)&gt;1'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: Il fautau minimum 2 éléments translation pour représenter le type de valve et le modèle du DM </assert>
        
    </rule>
        
    <!--D0001-11 Prothèse valvu-laire -->
    
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.5"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-11"]'>
        
        
        <!-- Valve -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0031"'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: L'élément Valve est obligatoire.
        </assert>
        <!-- Composant -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0032"'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: L'élément Composant est obligatoire.
        </assert>
        <!-- Diamètre -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0033"'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: L'élément Diamètre est obligatoire.
        </assert>
        <!-- Gradient -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0034"'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: L'élément Gradient est obligatoire.
        </assert>
        <!-- Niveau anticoagulation souhaité -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0035"'>
            [E_DM-PPV] Erreur de Conformité CI-SIS: L'élément Niveau anticoagulation souhaité est obligatoire.
        </assert>
    </rule>
</pattern>
