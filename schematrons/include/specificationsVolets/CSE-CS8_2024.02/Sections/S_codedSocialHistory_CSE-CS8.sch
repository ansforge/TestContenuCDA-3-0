<?xml version="1.0" encoding="UTF-8"?>

<!--  S_codedSocialHistory-CSE-CS8
    
    Teste la conformité de la section Habitus Mode de Vie (Coded Social History - 1.3.6.1.4.1.19376.1.5.3.1.3.16.1)
    aux spécifications du volet CSE-CS8 du CI-SIS.
    
    
    Historique :
    23/11/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_codedSocialHistory-CSE-CS8">
    <title>Vérification de la conformité de la section Coded Social History du CSE-CS8</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.16.1"]'> 
        
        
        <assert test='.//cda:code[@code ="74011-8"]'>
            [S_codedSocialHistory-CSE-CS8] Erreur de conformité : La consommation tabagique est obligatoire.
        </assert>
        <assert test='.//cda:code[@code ="74013-4"]'>
            [S_codedSocialHistory-CSE-CS8] Erreur de conformité : La consommation d'alcool est obligatoire.
        </assert>
        <assert test='.//cda:code[@code ="11345-6"]/cda:qualifier/cda:value/@code="GEN-092.01.04"'>
            [S_codedSocialHistory-CSE-CS8] Erreur de conformité : La donnée "Autre addiction" est obligatoire.
        </assert>
        <assert test='.//cda:code[@code ="11345-6"]/cda:qualifier/cda:value/@code="67704-7"'>
            [S_codedSocialHistory-CSE-CS8] Erreur de conformité : La donnée "Type d’alimentation" est obligatoire.
        </assert>
        <assert test='.//cda:code[@code ="11345-6"]/cda:qualifier/cda:value/@code="MED-183"'>
            [S_codedSocialHistory-CSE-CS8] Erreur de conformité : La donnée "Facteurs de risque familiaux de tuberculose" est obligatoire.
        </assert>
        
    </rule>
</pattern>