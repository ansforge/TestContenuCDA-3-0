<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_TLM-CR.sch
    Teste la conformité de l'entete du volet TLM-CR au CI-SIS
    
    Historique :
    19/12/2019 : Création
    05/05/2020 : Mise à jour de la liste des codes possibles pour cda:documentationOf/cda:serviceEvent/cda:code
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_TLM-CR">

    <rule context='cda:ClinicalDocument'>
        <assert test="cda:code[@code='85208-7']">
            [Entete_TLM-CR] Le code du document TLM-CR doit être égal à '85208-7'.
        </assert>
        <!-- Verifier le setId du modèle -->
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_TLM-CR]  Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <!-- Verifier le versionNumber du modèle -->
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_TLM-CR] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        
    </rule>
        
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:code">
        <assert test="@code='TCG' or @code='TC' or @code='TE1' or @code='TE2' or @code='TLD' or @code='TLL' or @code='TLM' or @code='TLS'">
            [Entete_TLM-CR] Le code de l'acte documenté est obligatoire et doit être égal à 'TCG' ou 'TC' ou 'TE1' ou 'TE2' ou 'TLD' ou 'TLL' ou 'TLM' ou 'TLS'.            
        </assert>
    </rule>
    
</pattern>