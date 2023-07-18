<?xml version="1.0" encoding="UTF-8"?>

<!--                   
    E_specimenReceived_int.sch
    Vérifie la conformité de l'entrée specimen received en fonction du profil APSR 
    Paramètres d'appel :
        Néant
    03/07/2023 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_specimenReceived_int">
    
    <title>IHE APSR specimen Received</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.3"]'>
        
        <assert test="@classCode='ACT' and @moodCode='EVN'">
            [E_specimenReceived_int.sch] Erreur de conformité APSR : L'élément act de specimen received doit contenir les attributs @classCode et @moodCode fixés respectivement aux valeurs 'ACT' and 'EVN'
        </assert>
        <assert test="count(cda:code)=1 and cda:code/@code='SPRECEIVE'">
            [E_specimenReceived_int.sch] Erreur de conformité APSR : L'élément code doit être présent dans specimen received et doit avoir comme attribut @code='SPRECEIVE'.
        </assert>
        <assert test="cda:effectiveTime">
            [E_specimenReceived_int.sch] Erreur de conformité APSR : L'élément effectiveTime doit être présent dans specimen received
        </assert>
    </rule>
</pattern>
