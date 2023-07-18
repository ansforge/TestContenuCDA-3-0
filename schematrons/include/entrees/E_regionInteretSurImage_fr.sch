<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_regionInteretSurImage_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Region-interet-sur-image (1.2.250.1.213.1.1.3.81) aux spécifications du CI-SIS
    
    Historique :
    06/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_regionInteretSurImage_fr">
    <title>Vérification de la conformité de l'entrée FR-Region-interet-sur-image </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.81"]'>
        
        <assert
            test="self::cda:regionOfInterest[@classCode='ROIOVL' and @moodCode='EVN']">
            [E_regionInteretSurImage_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Region-interet-sur-image(1.2.250.1.213.1.1.3.81), 
            les attributs de l'élément CDA 'observation' sont classCode='ROIOVL' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Region-interet-sur-image" -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.12.307']">
            
            [E_regionInteretSurImage_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Region-interet-sur-image" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="2.16.840.1.113883.10.12.307"
        </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "id" est obligatoirement présent minimun une fois[1..*].
        </assert>
        
        <assert test='count(cda:code)=1'>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois[1..1].
        </assert>
        
        <assert test='count(cda:value)&gt;=1'>
            [E_regionInteretSurImage_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent minimum une fois [1..*].
        </assert>
    </rule>
    
</pattern>
