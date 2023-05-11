<?xml version="1.0" encoding="UTF-8"?>

<!-- E_StimulateurOrg_CARD-F-PRC-PSC.sch     
    Teste la conformité de l'entrée "Dispositif Médical" (1.2.250.1.213.1.1.3.20)
    aux spécifications du volet 'Patients à riques en cardiologie' du CI-SIS concernant un dispositif 
    stimulateur.   
    
    Historique :
    10/08/2011 : Création
    24/08/2011 : Inclusion de l'Organizer Dernières Mesures
    29/08/2011 : Regroupement des Organizers Stimulateurs et Stimulateurs sous le même organizer (DMI)
    08/11/2017 : Mise à jour du templateID 1.2.250.1.213.1.1.3.1
    22/02/2021 : Renommage
    04/01/2023 : Renommage : nouvelle version 2023.01 
                 Modification des controles, du path du contexte et des paths des asserts
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_StimulateurOrg-CARD-F-PRC-PSC">
    <title>CI-SIS - Stimulateur</title>

    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code ="D0001-2"]'>
        
        <!--=<<o#%@O[ Contenu de l'entrée Stimulateur  ]O@%#o>>=-->
        
        <!-- Fréquence s/s aimant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0060"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La Fréquence s/s aimant est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Tension batterie -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0065"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La tension batterie est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Type Pacemaker -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0036"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: le type de Pacemaker est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Asservissement -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0006"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: L'asservissement est un élément obligatoire
            de l'entrée. </assert>
     
        <!-- Télésuivi -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0007"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: Le télésuivi est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Télésuivi activé -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0008"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: L'activation du télésuivi est un élément obligatoire de
            l'entrée. </assert>
        
        <!-- Stade NYHA -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0009"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: Le stade NYHA est un élément obligatoire de l'entrée. </assert>
        
        <!-- FEVG -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48" or cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0010"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La FEVG est l'un des éléments obligatoires constitutifs
            de l'entrée 'Stimulateur'. </assert>
        
        <!-- Date Examen de dernier contrôle -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48" or cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0012"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: la date d'examen du dernièr controle est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Mode Programmé (dernier contrôle) -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48" or cda:templateId/@root="1.2.250.1.213.1.1.3.1"]/cda:code/@code = "L0013"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: le mode programmé est un élément obligatoire de
            l'entrée. </assert>
        
        <!-- Fréquence sans aimant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0037"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La Fréquence sans aimant est un élément obligatoire
            de l'entrée. </assert>
        
        <!-- Fréquence sous aimant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0066"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La Fréquence sous aimant est un élément obligatoire
            de l'entrée. </assert>
       
        <!-- Tension Dernièr controle -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0014"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: La tension est un élément obligatoire de l'entrée. </assert>
       
        <!-- Impédance Dernier controle -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code = "L0015"'>
            [E_StimulateurOrg-CARD-F-PRC-PSC] Erreur de Conformité CI-SIS: L'Impédance est un élément obligatoire de l'entrée. </assert>
      
    </rule>
</pattern>
