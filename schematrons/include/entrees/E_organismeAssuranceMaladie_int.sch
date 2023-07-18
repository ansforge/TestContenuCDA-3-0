<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_organismeAssuranceMaladie_int.sch :
    Contenu :
       Contrôle la conformité de l'entrée IHE Payer Entry conformément au profil IHE PCC.
    Historique :
    05/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_organismeAssuranceMaladie_int">
    <title>Vérification de la conformité de l'entrée IHE Payer Entry </title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.18"]'>
        
        <assert test="self::cda:act[@classCode = 'ACT' and @moodCode = 'EVN']">
            [E_organismeAssuranceMaladie_int] Erreur de conformité IHE PCC : L'élément "act" doit
            contenir les attributs @classCode="ACT" et @moodCode="EVN". 
        </assert>
        
        <!-- Test des templateId pour l'entrée "IHE Payer Entry" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.18'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.26']">
            
            [E_organismeAssuranceMaladie_int.sch] Erreur de conformité IHE PCC : 
            L'entrée "IHE Payer Entry " doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.18"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.26" 
        </assert>
        <!-- Test présence de l'élément 'id' -->
        <assert test="count(cda:id)&gt;=1">
            [E_organismeAssuranceMaladie_int.sch] Erreur de conformité IHE PCC : L'entrée "IHE Payer Entry " doit comporter un ou plusieurs élément 'id'.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_organismeAssuranceMaladie_int.sch] Erreur de conformité IHE PCC : L'entrée "IHE Payer Entry " doit comporter un élément 'code'.
        </assert>
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_organismeAssuranceMaladie_int.sch] : Erreur de conformité IHE PCC : Le composant "statutCode" est toujours fixé à la valeur code='completed'. 
        </assert>
        <!-- Test présence de l'élément 'participant' -->
        <assert test="cda:participant"> 
            [E_organismeAssuranceMaladie_int.sch] : Erreur de conformité IHE PCC : L'entrée "IHE Payer Entry " doit comporter au moins un élément "participant"
        </assert>
    </rule>
        <!-- Test présence de l'élément 'performer' -->
        
        <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18']/cda:performer">
            <assert test="@typeCode='PRF'">
                [E_organismeAssuranceMaladie_int.sch] Errreur de conformité IHE PCC : Dans l'entrée 'IHE Payer Entry', l'élément 'performer' doit contenir un attribut typeCode='PRF'.
            </assert>
            <assert test="cda:assignedEntity">
                [E_organismeAssuranceMaladie_int.sch] Errreur de conformité IHE PCC : Dans l'entrée 'IHE Payer Entry', l'élément 'performer' doit contenir un élément 'assignedEntity'. 
            </assert>
        </rule>
        <!-- Test présence de l'élément 'participant' -->
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18']/cda:participant[@typeCode='COV']">
        <assert test="@typeCode='COV'">
            [E_organismeAssuranceMaladie_int.sch] : Erreur de conformité CI-SIS : L'entrée "IHE Payer Entry " doit comporter un élément "participant"avec l'attribut @typeCode est fixé à 'COV'.
        </assert>
        
        <assert test="cda:participantRole[@classCode='PAT']"> 
            [E_organismeAssuranceMaladie_int.sch] : Erreur de conformité CI-SIS : Le composant "participant" doit comporter un élément "participantRole"avec l'attribut @classCode est fixé à 'PAT'.
        </assert>
    </rule>
    
</pattern>