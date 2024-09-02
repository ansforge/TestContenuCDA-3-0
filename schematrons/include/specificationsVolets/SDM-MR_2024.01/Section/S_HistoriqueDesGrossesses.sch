<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_HistoriqueDesGrossesses.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Historique-des-grossesses(1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    20/02/2024 : SBM : Création
   ......................................................................................................................................................    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_HistoriqueDesGrossesses">
    
    <title>CI-SIS SDM-MR Historique des grossesses </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4"]'>
        
        <!-- Vérifier la cardinalité de l'entrée FR-Historique-de-la-grossesse '1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1' [1..*]-->
        <assert test='count(./cda:entry/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1"])&gt;= 1'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-des-grossesses (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4)
            doit obligatoirement contenir [1..*] entrée(s) FR-Historique-de-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1), une entrée par grossesse.
        </assert>
        
    </rule>
    
    <!-- Entrée FR-Historique-de-la-grossesse '1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1' --> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4"]/cda:entry/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1" and not(cda:effectiveTime/cda:high/@value) and cda:effectiveTime/cda:low]'>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Nombre de fœtus (code) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="55281-0"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir le code/@code="55281-0" pour le nombre de fœtus.
        </assert>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Nombre de fœtus (value) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5" and cda:code/@code="55281-0"]/cda:value'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir l'élément value pour préciser le nombre de fœtus.
        </assert>
        
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Assistance médicale à la procréation (code) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="09.02"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir le code/@code="09.02" pour l'Assistance médicale à la procréation.
        </assert>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Assistance médicale à la procréation(value) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5" and cda:code/@code="09.02"]/cda:value[@xsi:type="BL"]'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir l'élément value pour préciser l'Assistance médicale à la procréation sous forme d'un booléen.
        </assert>
        
        <!-- Vérifier l'entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) [0..*] -->
        <assert test='not(./cda:component/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]) or 
            ./cda:component/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]/cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5" and cda:code/@nullFlavor="NA" and cda:value/@nullFlavor="NA"]'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) existe, elle doit obligatoirement contenir l'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) [1..1].
        </assert>
    </rule>
    
    
    <!-- Entrée FR-Historique-de-la-grossesse '1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1' --> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4"]/cda:entry/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1" and cda:effectiveTime/cda:high/@value and cda:effectiveTime/cda:low/@value]'>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Nombre de fœtus (code) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="55281-0"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir le code/@code="55281-0" pour le nombre de fœtus.
        </assert>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Nombre de fœtus (value) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5" and cda:code/@code="55281-0"]/cda:value'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir l'élément value pour préciser le nombre de fœtus.
        </assert>
        
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Assistance médicale à la procréation (code) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="09.02"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir le code/@code="09.02" pour l'Assistance médicale à la procréation.
        </assert>
        <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse : Assistance médicale à la procréation(value) -->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5" and cda:code/@code="09.02"]/cda:value[@xsi:type="BL"]'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) doit obligatoirement contenir l'élément value pour préciser l'Assistance médicale à la procréation sous forme d'un booléen.
        </assert>
        
    </rule>
    
    
    <!-- Entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) --> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.4"]/cda:entry/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.1" and cda:effectiveTime/cda:high/@value and cda:effectiveTime/cda:low/@value]/cda:component/cda:organizer[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2"]'>
    <!-- Vérifier l'entrée FR-Observation-sur-la-grossesse [1..1] : issue de la grossesse -->
    <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="63893-2"'>
        [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) existe, elle doit obligatoirement contenir l'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) précisant l'issue de la grossesse ayant comme code/@code="63893-2".
    </assert>
        
        <!--<!-\- Vérifier l'entrée FR-Observation-sur-la-grossesse [1..1] : Age gestationnel -\->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="11884-4"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) existe, elle doit obligatoirement contenir l'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) précisant l'Age gestationnel ayant comme code/@code="11884-4".
        </assert>
        
        <!-\- Vérifier l'entrée FR-Observation-sur-la-grossesse [1..1] : Fœtopathologie -\->
        <assert test='./cda:component/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.5"]/cda:code/@code="JQQP003"'>
            [S_HistoriqueDesGrossesses-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Naissance(1.3.6.1.4.1.19376.1.5.3.1.4.13.5.2) existe, elle doit obligatoirement contenir l'entrée FR-Observation-sur-la-grossesse(1.3.6.1.4.1.19376.1.5.3.1.4.13.5) précisant la Fœtopathologie ayant comme code/@code="JQQP003".
        </assert>-->
    </rule>
    
    
  
    
</pattern>

