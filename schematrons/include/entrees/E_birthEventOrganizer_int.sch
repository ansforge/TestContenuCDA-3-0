<?xml version="1.0" encoding="UTF-8"?>

<!-- E_birthEventOrganizer_int.sch
    
    Teste la conformité de l'entrée Birth Event Organizer (1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2)
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    28/10/2013 : Création E_birthEventOrganizer_int.sch
    30/01/2020 : Suppression du test sur le nombre de templateId
    25/01/2022 : Correction des contrôles
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_birthEventOrganizer_int">
  
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]'>  
        
        <let name="count_templateId" value="count(cda:templateId)"/>
        
        <assert test="self::cda:organizer[@classCode='CLUSTER' and @moodCode='EVN']">
            [E_birthEventOrganizer_int] : L'entrée Birth Event Organizer est un cluster d'observations à propos d'un événement d'accouchement.
        </assert>
        
        <assert test="count(cda:id)&gt;=1">
            [E_birthEventOrganizer_int] Dans l'entrée Birth Event Organizer, au moins un élément "id" doit obligatoirement être présent [1..*].
        </assert>
        
        <assert test="cda:code">
            [E_birthEventOrganizer_int] Dans l'entrée Birth Event Organizer, un élément "code" doit obligatoirement être présent
        </assert>
         
        <assert test="cda:subject[@typeCode='SBJ']">
            [E_birthEventOrganizer_int] : L'entrée Birth Event Organizer doit contenir un élément "subject" pour décrire le nouveau né
        </assert>
        
        <assert test="count(cda:component/cda:observation/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13.5'])&gt;=1">
            [E_birthEventOrganizer_int] : L'entrée Birth Event Organizer doit contenir au moins un élément component de type FR-Observation-sur-la-grossesse
        </assert>
        
        <report test="(cda:component/cda:observation/cda:templateId[@root!='1.3.6.1.4.1.19376.1.5.3.1.4.13.5' and @root!='1.3.6.1.4.1.19376.1.5.3.1.4.13' and @root!='1.2.250.1.213.1.1.3.53'])">
            [E_birthEventOrganizer_int] : L'entrée Birth Event Organizer ne doit pas contenir d'éléments component de type autre que FR-Observation-sur-la-grossesse
        </report>
               
    </rule>
</pattern>