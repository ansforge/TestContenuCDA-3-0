<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_IPS-FR.sch
    Teste la conformité de l'entete de l'IPS-FR au CI-SIS
    
    Historique :
    10/11/2022 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_IPS-FR">
    
    <!-- Contrôle spécifique à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <!-- Verifier le templateId du modèle IPS-FR_2022.01 -->
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.1.13']">
            [Entete_IPS-FR] Le templateId "1.2.250.1.213.1.1.1.13" doit être
            présent. </assert>
        <!-- Verifier le code du modèle IPS-FR_2022.01 -->
        <assert
            test="cda:code[@code = '60591-5' and @codeSystem = '2.16.840.1.113883.6.1']"
            > [Entete_IPS-FR] Le code LOINC du document est "60591-5"
            (2.16.840.1.113883.6.1).
        </assert>
        <!-- Verifier la présence d'un participant pour le médecin traitant -->
        <assert test="count(cda:participant[@typeCode = 'INF']/cda:functionCode[@code = 'PCP']) = 1
            and count(cda:participant[@typeCode = 'INF']/cda:functionCode[@displayName = 'Médecin Traitant']) = 1
            and count(cda:participant[@typeCode = 'INF']/cda:functionCode[@codeSystem = '2.16.840.1.113883.5.88']) = 1"
            > [Entete_IPS-FR] Un participant pour le médecin traitant est
            obligatoire avec @typeCode='INF' et functionCode@code='PCP',
            functionCode@displayName='Médecin Traitant' et
            functionCode@codeSystem='2.16.840.1.113883.5.88'.
        </assert>
    </rule>
</pattern>