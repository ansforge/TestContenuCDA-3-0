<?xml version="1.0" encoding="UTF-8"?>

<!-- E_DM-PSC.sch     
  
    
    
    Historique :
    03/02/2022 : Création
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_DM-PSC">
    <title>CI-SIS - DM-PSC</title>

    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.4"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry'>

        <!-- Verifier que le Supply contient au moins un Participant -->
        <assert test='cda:supply/cda:participant'>
            [E_DM-PSC] Erreur de Conformité PCC: L'élément 'Stimulateur' doit au moins contenir un participant</assert>
        
        <!-- Verifier que le Supply contient une date d'implantation -->
        <assert test='cda:supply/cda:effectiveTime'>
            [E_DM-PSC] Erreur de Conformité PCC: L'élément supply doit au moins contenir un participant</assert>

        <!-- numéro de série -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:id'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Le numéro de série du matériel est un élément
            obligatoire du Supply.</assert>

        <!-- Code de matériel implanté -->
        <assert
            test='cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Le code du matériel est un élément
            obligatoire du Supply.</assert>
        
        <!-- Marque et modèle de l'implant -->
        <assert
            test='count(cda:supply/cda:participant/cda:participantRole/cda:playingDevice/cda:code/cda:translation)&gt;1'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Il fautau minimum 2 éléments translation pour représenter la marque et le modèle du DM </assert>
        
    </rule>
    
    <!--D0001-2 Stimulateur-->
    
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.4"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-2"]'>

        <!-- Fréquence s/s aimant -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0060"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Fréquence s/s aimant est obligatoire.
        </assert>
        <!-- Fréquence Tension batterie -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0065"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Tension batterie est obligatoire.
        </assert>
        <!-- Type PM -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0036"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Type PM est obligatoire.
        </assert>
        <!-- Asservissement -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0006"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Asservissement est obligatoire.
        </assert>
        <!-- Télésuivi -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0007"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Télésuivi est obligatoire.
        </assert>
        <!-- Télésuivi Activé -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0008"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Télésuivi Activé est obligatoire.
        </assert>
        <!-- NYHA -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0009"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément stade NYHA est obligatoire.
        </assert>
        <!-- FEVG -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0010"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément FEVG est obligatoire.
        </assert>
        <!-- Date Examen de dernier contrôle -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0012"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Date Examen de dernier contrôle est obligatoire.
        </assert>
        <!-- Mode Programmé (dernier contrôle) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0013"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mode Programmé (dernier contrôle) est obligatoire.
        </assert>
        <!-- Fréquence sans aimant (dernier contrôle) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0037"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Fréquence sans aimant (dernier contrôle) est obligatoire.
        </assert>
        <!-- Fréquence sous aimant (dernier contrôle) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0066"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Fréquence sous aimant (dernier contrôle) est obligatoire.
        </assert>
        <!-- Tension dernier contrôle -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0014"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Tension dernier contrôle est obligatoire.
        </assert>
        <!-- Impédance dernier contrôle -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0015"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Impédance dernier contrôle est obligatoire.
        </assert>
    </rule>
        
        <!--D0001-3 Sonde Auriculaire-->
        
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.4"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-3"]'>
        
        <!-- Polarité -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0053"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: La Polarité est obligatoire.
        </assert>
        <!-- Connexions -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0017"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Les Connexions sont obligatoirs.
        </assert>
        <!-- Adaptateur -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0018"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Adaptateur est obligatoire.
        </assert>
        <!-- Voie d'abord -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0019"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Voie d'abord est obligatoire.
        </assert>
        <!-- Localisation -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0054"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Localisation est obligatoire.
        </assert>
        <!-- Mesure Implantation Courant (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0021"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Courant (Oreillette) est obligatoire.
        </assert>
        <!-- Mesure Implantation Détection (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0022"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Détection (Oreillette) est obligatoire.
        </assert>
        <!-- Impédance -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0015"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Lélément Impédance est obligatoire.
        </assert>
        <!-- Seuil à ms -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0023"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil à ms est obligatoire.
        </assert>
        <!-- Seuil -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0026"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil est obligatoire.
        </assert>
    </rule>
    
        <!-- D0001-4 Sonde Ventricule Droit -->
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.4"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-4"]'>
        
        <!-- Polarité -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0053"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: La Polarité est obligatoire.
        </assert>
        <!-- Connexions -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0017"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Les Connexions sont obligatoirs.
        </assert>
        <!-- Adaptateur -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0018"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Adaptateur est obligatoire.
        </assert>
        <!-- Voie d'abord -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0019"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Voie d'abord est obligatoire.
        </assert>
        <!-- Localisation -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0054"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Localisation est obligatoire.
        </assert>
        <!-- Mesure Implantation Courant (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0021"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Courant (Oreillette) est obligatoire.
        </assert>
        <!-- Mesure Implantation Détection (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0022"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Détection (Oreillette) est obligatoire.
        </assert>
        <!-- Impédance -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0015"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Lélément Impédance est obligatoire.
        </assert>
        <!-- Seuil à ms -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0023"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil à ms est obligatoire.
        </assert>
        <!-- Seuil -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0026"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil est obligatoire.
        </assert>
        
    </rule>
    
        <!-- D0001-5 Sonde Ventricule Gauche -->
        
    <rule
        context='cda:ClinicalDocument[cda:templateId/@root = "1.2.250.1.213.1.1.1.2.1.4"]/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = "1.2.250.1.213.1.1.2.1"]/cda:entry/cda:supply[cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code = "D0001-5"]'>
        
        <!-- Polarité -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0053"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: La Polarité est obligatoire.
        </assert>
        <!-- Connexions -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0017"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Les Connexions sont obligatoirs.
        </assert>
        <!-- Adaptateur -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0018"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Adaptateur est obligatoire.
        </assert>
        <!-- Voie d'abord -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0019"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Voie d'abord est obligatoire.
        </assert>
        <!-- Localisation -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0054"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Localisation est obligatoire.
        </assert>
        <!-- Mesure Implantation Courant (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0021"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Courant (Oreillette) est obligatoire.
        </assert>
        <!-- Mesure Implantation Détection (Oreillette) -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0022"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Mesure Implantation Détection (Oreillette) est obligatoire.
        </assert>
        <!-- Impédance -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0015"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: Lélément Impédance est obligatoire.
        </assert>
        <!-- Seuil à ms -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0023"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil à ms est obligatoire.
        </assert>
        <!-- Seuil -->
        <assert
            test='cda:entryRelationship/cda:observation/cda:code/@code="L0026"'>
            [E_DM-PSC] Erreur de Conformité CI-SIS: L'élément Seuil est obligatoire.
        </assert>
        
    </rule>
</pattern>
