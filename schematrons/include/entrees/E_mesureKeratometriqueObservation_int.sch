<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    E_mesureKeratometriqueObservation_int
   Teste la conformité de l'entrée FR-Mesure-keratometrique en fonctionn de la conformité IHE EYE CARE GEE
    
    Historique :
    04/07/2023 : Création
    19/01/2024 : MAJ du schematron
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_mesureKeratometriqueObservation_int">
    
    <title>IHE PCC v3.0 Keratometry Observation</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.3.8"]'>
        
        <!-- Verifier que le templateId parent de l'observation est présent. --> 
        <assert test='cda:templateId[@root = "1.3.6.1.4.1.19376.1.12.1.3.8"]'> 
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'identifiant du template parent (1.3.6.1.4.1.19376.1.12.1.3.8) doit être présent. 
        </assert>
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :l'élément "mesure keratometrique Observation"
            doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs
            'OBS' et 'EVN'
        </assert>
        
        <assert test="count(cda:id)=1">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure keratometrique Observation" doit contenir un élement "Id"
        </assert>
        
        <assert test="count(cda:code)=1">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure keratometrique Observation" doit contenir un élement "code"
        </assert>
        
        <assert test="cda:text">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure keratometrique Observation" doit contenir un élement "text"
        </assert>

        <assert test="cda:text/cda:reference">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "text" doit contenir un  élement "reference"
        </assert>
        <assert test="cda:statusCode[@code = 'completed']">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" doit contenir l'élément statusCode avec l'attribut @code fixé à 'completed'
        </assert>
        
        <assert test="cda:effectiveTime">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément 'effectiveTime' doit être présent.
        </assert>
        
        <assert test="cda:value">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" doit contenir un élement value 
        </assert>
        
        <assert test="cda:targetSiteCode[@codeSystem ='2.16.840.1.113883.6.96']">
            [E_mesureKeratometriqueObservation_int]  Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" doit contenir un élement targetSiteCode avec les attributs : 
            @codeSystem ='2.16.840.1.113883.6.96']
        </assert>
        
        <assert test="cda:methodCode">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" doit contenir un élement methodCode 
        </assert>
        
        <!--<assert test="count(cda:interpretationCode)&gt;=1">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" doit contenir au minimum un élement "interpretationCode".
        </assert>-->
        
        <assert test="count(cda:author)&lt;=1">
            [E_mesureKeratometriqueObservation_int] Erreur de Conformité IHE EYE CARE (GEE) :
            l'élément "mesure de refraction Observation" peut contenir un élement author [0..1].
        </assert>
        
    </rule>
    
</pattern>
