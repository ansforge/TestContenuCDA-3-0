<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_IPS-FR.sch
    Teste la conformité de l'entete de l'IPS-FR au CI-SIS
    
    Historique :
    10/11/2022 : Création 
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_IPS-FR">
    
    <!-- Contrôle spécifique à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <!-- Verifier le templateId du modèle IPS-FR_2023.01 -->
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.1.51']">
            [Entete_IPS-FR] Le templateId "1.2.250.1.213.1.1.1.51" doit être
            présent. </assert>
        <!-- Verifier le code du modèle IPS-FR_2023.01 -->
        <assert
            test="cda:code[(@code = '60591-5' or @code = '74207-2') and @codeSystem = '2.16.840.1.113883.6.1']"
            > [Entete_IPS-FR] Le code LOINC du document est soit "60591-5" soit "74207-2"
            (2.16.840.1.113883.6.1).
        </assert>
        <!-- Verifier le setId du modèle -->
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_IPS-FR]  Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <!-- Verifier le versionNumber du modèle -->
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_IPS-FR] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        
        <!-- Verifier l'élément participant pour le médecin traitant et l'établissement de santé de préférence [DLU]  -->
        
        <assert test="not(cda:participant[@typeCode ='INF']) or (cda:participant[@typeCode ='INF']/cda:functionCode[(@code='ES-PREF' or  @code='PCP' ) and (@displayName= 'Etablissement de santé de préférence' or @displayName='Médecin Traitant') and (@codeSystem='1.2.250.1.213.1.1.4.2.280' or @codeSystem='2.16.840.1.113883.5.88')])"> 
            [Entete_IPS-FR]  :
            - Un participant pour le médecin traitant doit être présent maximum une fois [0..1]
            avec @typeCode='INF' et functionCode@code='PCP',
            functionCode@displayName='Médecin Traitant' et
            functionCode@codeSystem='2.16.840.1.113883.5.88'.
            - Un participant pour l'établissement de santé de préférence [DLU] doit être présent maximum une fois [0..1]
            avec @typeCode='INF' et functionCode@code='ES-REF',
            functionCode@displayName='Etablissement de santé de préférence' et
            functionCode@codeSystem='1.2.250.1.213.1.1.4.2.280'.
        </assert>
        
    </rule>
</pattern>