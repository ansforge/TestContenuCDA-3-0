<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_FRCP.sch
    Teste la conformité de l'entete de la FRCP au CI-SIS
    
    Auteur : ANS
    
    Historique :
    30/01/2018 : Création
    29/07/2020 : Ne pas contrôler le nom du participant pour le médecin traitant (participant typeCode ='INF' et fonctionCode code="PCP")
    21/04/2021 : Modification des contrôles effectués
    06/04/2022:  Migration des terminologies et JDV en SNOMED-CT
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_FRCP"> 
    
    <!-- l'élément setId et versionNumber sont obligatoires  --> 
    <rule context="cda:ClinicalDocument">     
    <assert test="./count(cda:setId[@root])=1"> 
        [Entete_FRCP] Erreur de conformité au modèle : L'élément "setId" doit être présent. 
    </assert>
    <assert test="./count(cda:versionNumber[@value])=1"> 
        [Entete_FRCP] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
    </assert>
    </rule>
    
    <!-- l'élément documentationOf/serviceEvent/code est obligatoire  --> 
    <rule context="cda:ClinicalDocument/cda:documentationOf">
        <assert test="cda:serviceEvent/cda:code">
            [Entete_FRCP] Le code de l'élément documentationOf est obligatoire.            
        </assert>
        
    </rule>
    <rule context="cda:ClinicalDocument/cda:componentOf">
        <assert test="count(cda:encompassingEncounter/cda:id)>2">
            [Entete_FRCP] L'élément componentOf doit au minimum comporter les identiants du RRC, du gestionnaire et de la RCP.          
        </assert>        
        <assert test="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:name">
            [Entete_FRCP] Le nom de l'établissement est obligatoire.         
        </assert>        
        <assert test="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr">
            [Entete_FRCP] L'adresse de l'établissement est obligatoire.         
        </assert>
    </rule>
</pattern>