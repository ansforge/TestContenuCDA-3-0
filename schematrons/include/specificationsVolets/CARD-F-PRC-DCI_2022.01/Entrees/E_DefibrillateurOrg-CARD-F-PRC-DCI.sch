<?xml version="1.0" encoding="UTF-8"?>

<!-- E_DefribrillateurOrg_CARD-F-PRC-DCI.sch     
     Teste la conformité de l'entrée "Dispositif Médical" (1.2.250.1.213.1.1.3.20) : rubrique défibrillateur
    aux spécifications du volet 'Patients à riques en cardiologie' du CI-SIS concernant un dispositif 
    défibrillateur.   
    
    Historique :
    10/08/2011 : Création
    24/08/2011 : Inclusion de l'Organizer Dernières Mesures
    29/08/2011 : Regroupement des Organizers Stimulateurs et Défibrillateurs sous le même organizer (DMI)
    08/11/2017 : Mise à jour du templateID 1.2.250.1.213.1.1.3.1
    22/02/2021 : Renommage
    04/01/2023 : Renommage : nouvelle version 2023.01 
                 Modification des controles, du path du contexte et des paths des asserts
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DefribrillateurOrg-CARD-F-PRC-DCI">
    <title>CI-SIS - Défibrillateur</title>

    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code ="D0001-1"]'>
        
        <!-- Verifier que l'entrée contient au moins un élément de type Observation Dispositifs Médicaux -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.3.1"]'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité PCC: L'élément 'Défibrillateur' doit au moins contenir une entrée 'Observation
            Dispositifs Médicaux'</assert>
        
        <!--=<<o#%@O[ Contenu de l'entrée Défibrillateur  ]O@%#o>>=-->
        
        <!-- Localisation de l'implant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="257880008"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: La localisation de l'implant est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Tension de la pile à ERI -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0001"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: La tension de la pile à ERI est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- IRE -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0003"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: IRE est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Type défibrillateur -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0004"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Le type de défibrillateur implanté est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Asservissement -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0006"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: L'asservissement est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Télésuivi -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0007"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Le télésuivi est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Télésuivi activé -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0008"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: L'activation du télésuivi est un élément obligatoire de
            l'entrée. </assert>
        
        <!-- Stade NYHA -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0009"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Le stade NYHA est un élément obligatoire de l'entrée. </assert>
        
        <!-- FEVG -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0010"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: La FEVG est l'un des éléments obligatoires constitutifs
            de l'entrée 'Défibrillateur'. </assert>
        
        <!-- Date Dernière Mesure) -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0012"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: la date des dernières mesures est un élément obligatoire
            de l'entrée. </assert>
        <!-- Mode Programmé Dernière Mesure -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0013"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: le mode programmé est un élément obligatoire de
            l'entrée. </assert>
        <!-- Tension Dernière Mesure -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0014"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Tension est un élément obligatoire de l'entrée. </assert>
        <!-- Impédance Dernière Mesure -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0015"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Impédance est un élément obligatoire de l'entrée. </assert>
        <!-- Temps de charge Dernière Mesure -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0016"'>
            [E_DefribrillateurOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Temps de charge est un élément obligatoire de
            l'organizer. </assert>
    </rule>
</pattern>
