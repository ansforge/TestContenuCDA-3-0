<?xml version="1.0" encoding="UTF-8"?>

<!--                 
    E_ocularObservation_fr
   Teste la conformité de l'entrée Ocular Observation (1.3.6.1.4.1.19376.1.12.1.3.1) aux spécifications du profil IHE EYE CARE GEE 
   
   15/01/2024 : Création
   
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_ocularObservation_int">
    <title>IHE EYE CARE GEE : Ocular Observation</title>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.12.1.3.1']">
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN". </assert>
        
        <assert test="count(cda:id)&gt;1">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "id" est requis dans "Ocular Observation" au minimum une fois.
            </assert>
        
        <assert test="cda:code">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "code" est requis dans "Ocular Observation".
            </assert>
        
        <assert test="cda:text">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "text" est requis dans "Ocular Observation".
        </assert>
        
        <assert test="cda:text/cda:reference">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "text/reference" est requis dans "Ocular Observation".
        </assert>
        
        <assert test="cda:statusCode[@code ='completed']"> 
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "statusCode" est requis dans "Ocular Observation".
        </assert>
        
        <assert test="cda:value">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "value" est requis dans "Ocular Observation".
          </assert>
        
        <assert test="cda:effectiveTime[@value] or cda:effectiveTime[@nullFlavor]">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "effectiveTime" est requis dans "Ocular Observation".
           </assert>
        
        <assert test="cda:targetSiteCode[(@code='362503005' or @code='362502000' or @code='362508001') and @codeSystem ='2.16.840.1.113883.6.96']">
            [E_ocularObservation_int] Erreur de conformité IHE EYE CARE GEE : L'élément "targetSiteCode" est requis dans "Ocular Observation", avec les attributs :
            (@code='362503005' ou  @code='362503005' ou @code='362508001') et @codeSystem="2.16.840.1.113883.6.96"</assert>
        
    </rule>
</pattern>
