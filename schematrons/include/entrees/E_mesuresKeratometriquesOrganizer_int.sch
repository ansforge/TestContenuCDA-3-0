<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_mesuresKeratometriquesOrganizer_int
   Teste la conformité de l'entrée FR-Liste-des-mesures-keratometriques aux spécifications IHE EYE CARE GEE
   
   04/07/2023 : Création
   19/01/2024 : MAJ du schematron
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_mesuresKeratometriquesOrganizer_int">
    <title>Vérification de la conformité de l'entrée FR-Liste-des-mesures-keratometriques aux
        spécifications IHE EYE CARE GEE</title>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.4']">
        
        <assert test="self::cda:organizer[@classCode = 'CLUSTER' and @moodCode = 'EVN']">
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : L'élément "organizer" doit
            contenir les attributs @classCode="CLUSTER" et @moodCode="EVN". </assert>
        
        <assert test="cda:templateId[@root = '1.3.6.1.4.1.19376.1.12.1.3.4']">
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée
            FR-Liste-des-mesures-keratometriques doit contenir l'élément "templateId" avec l'attribut
            @root fixé à "1.3.6.1.4.1.19376.1.12.1.3.4". </assert>
        
        <assert test="count(cda:id)=1">
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée
            FR-Liste-des-mesures-keratometriques doit contenir un élément "id".</assert>
        
        <assert test="cda:code[@code ='252828005' and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée
            FR-Liste-des-mesures-keratometriques doit contenir l'élément "code" avec les attributs
            @code="252828005" et @codeSystem="2.16.840.1.113883.6.96".</assert>
        
        <assert test="cda:statusCode[@code ='completed']"> 
            [E_mesuresKeratometriquesOrganizer_int]
            Erreur de conformité IHE EYE CARE (GEE) : L'entrée FR-Liste-des-mesures-keratometriques doit contenir
            l'élément "statusCode" avec l'attribut @code fixé à "completed".</assert>
        
        <assert test="cda:effectiveTime[@value] or cda:effectiveTime[@nullFlavor]">
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : 
            L'entrée FR-Liste-des-mesures-keratometriques doit contenir un élément "effectiveTime" avec
            l'attribut @value.</assert>
        
        
        <assert test="cda:author"> 
            [E_mesuresKeratometriquesOrganizer_int]
            Erreur de conformité IHE EYE CARE (GEE) : L'entrée FR-Liste-des-mesures-keratometriques doit contenir l'élément "author".</assert>
        
        <assert
            test="count(.//cda:observation[cda:templateId/@root ='1.3.6.1.4.1.19376.1.12.1.3.8']) &gt;= 1"> 
            [E_mesuresKeratometriquesOrganizer_int] Erreur de conformité IHE EYE CARE (GEE) : L'entrée
            FR-Liste-des-mesures-keratometriques doit contenir au minimum une entrée FR-Mesure-keratometrique (1.3.6.1.4.1.19376.1.12.1.3.8).
        </assert>
        
    </rule>
</pattern>
