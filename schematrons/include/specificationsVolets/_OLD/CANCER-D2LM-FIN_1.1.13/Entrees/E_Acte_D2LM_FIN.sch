<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   E_Acte_D2LM_FIN
   Schématron de vérification de la conformité au modèle du CI-SIS d'une entrée Acte dans un document D2LM-FIN 
   
   D2LM_FIN : CR de seconde lecture de mammographie - Fiche d'interprétation nationale
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
       28/07/2020 : SBM : Création
   ......................................................................................................................................................    
-->
    
    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_Acte_D2LM_FIN">
        <rule context="/*:component/*:section[*:templateId/@root='1.2.250.1.213.1.1.2.56']/component/section[*:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11']/*:entry/*:procedure">
            <!-- Début des assertions --> 
            
            <assert test="*:templatedId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.19']">
                [E_Acte.sch] L'entrée Acte doit avoir un templateId "1.3.6.1.4.1.19376.1.5.3.1.4.19".
            </assert>
            
            <assert test="count(*:participant[@typeCode='IND'])&gt;= 4">
                [E_Acte.sch] 4 participants avec @typeCode='IND' sont obligatoires. 
            </assert>
            
            <assert test="count(*:participant[@typeCode!='IND']) =0">
                [E_Acte.sch] Seule la valeur "IND" est autorisée dans l'attribut @typeCode du participant.
            </assert>
            
            <assert test="count(*:participant[@typeCode='IND']) = count(*:participant/*:participantRole)">
                [E_Acte.sch] Un participant ayant un attribut @typeCode="IND" doit avoir obligatoirement l'élément participantRole.
            </assert>
            
            <assert test="count(*:participant[*:participantRole[*:code[@code='P5-40010']]]) =1">
                [E_Acte.sch] Un participant avec l'élément code "P5-40010" est obligatoire.
            </assert>
            <!-- Fin des ssertions --> 
        </rule>
    </pattern>



