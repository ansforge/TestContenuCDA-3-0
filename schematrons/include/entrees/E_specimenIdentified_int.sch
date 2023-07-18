<?xml version="1.0" encoding="UTF-8"?>

<!--                   
    E_specimenIdentified_int.sch
    Vérifie la conformité de l'entrée specimen received en fonction du profil APSR 
    Paramètres d'appel :
        Néant
    03/07/2023 : SBM : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_specimenIdentified_int">
    
    <title>IHE APSR specimen identified</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.10.9.1"]'>
        <assert test="@typeCode='SPC'">
            [E_specimenIdentified_int.sch] Erreur de conformité APSR : L'élément specimen doit contenir l'attribut @classCode 'SPC'
        </assert>
        <assert test="cda:specimen/cda:specimenRole">
            [E_specimenIdentified_int.sch] Erreur de conformité APSR : L'élément specimen identified doit contenir l'élément specimenRole
        </assert>
        <assert test="cda:specimenRole/@classCode='SPEC'">
            [E_specimenIdentified_int.sch] Erreur de conformité APSR : L'élément specimenRole doit contenir l'attribut @classCode 'SPEC'
        </assert>
        <assert test="count(cda:id)=1">
            [E_specimenIdentified_int.sch] Erreur de conformité APSR : L'élément id doit être présent dans specimen identified [1..1].
        </assert>
    </rule>
</pattern>
