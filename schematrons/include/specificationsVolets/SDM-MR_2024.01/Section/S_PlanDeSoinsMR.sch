<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_PlanDeSoinsMR.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Plan-de-soins(1.2.250.1.213.1.1.2.158) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    20/02/2024 : SBM : Création
    21/10/2024 : Remplacement du code GEN-162 par GEN-368
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_PlanDeSoinsMR">
    <title>CI-SIS SDM-MR Plan de soins MR </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.158"]'>
        
        <!-- Vérifier la cardinalité de l'entrée 'FR-Rencontre' [1..*]-->
        <assert test='count(./cda:entry[cda:encounter/cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.14"]) &gt;= 1'>
            [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
            doit obligatoirement contenir [1..*] entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14), une entrée par Site MR.
        </assert>
        
    </rule>


    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.158"]/cda:entry/cda:encounter[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.14"]'>
    <!-- Vérifier l'identifiant de la prise en charge -->
    <assert test='cda:id'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant l'identifiant de la prise en charge dans l'élément id.
    </assert>
    
    <!-- Vérifier la date d'inclusion du patient dans le site -->
    <assert test='cda:effectiveTime'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant la date d'inclusion du patient dans le site dans l'élément effectiveTime.
    </assert>
    
    <!-- Vérifier le Médecin référent du site maladie rare -->
    <assert test='cda:performer[@typeCode ="PRF"]'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant le Médecin référent du site maladie rare 'performer' et ayant comme attribut @typecode ="PRF".
    </assert>
    
    <!-- Vérifier l'informateur -->
    <assert test='count(cda:informant)&gt;=1'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant l'informateur du patient 'informant' avec une cardinalité [1..*].
    </assert>
    
    <!-- Vérifier le site MR -->
    <assert test='cda:participant[@typeCode ="LOC"]'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Plan-de-soins (1.2.250.1.213.1.1.2.158)
        doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant le site maladie rare 'participant' et ayant comme attribut @typecode ="LOC".
    </assert>
    
    <!-- Vérifier l'indicateur hors labélisation -->
        <assert test='./cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code/@code="GEN-368"'>
        [S_PlanDeSoinsMR-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13)
        précisant l'indicateur hors labélisation ayant comme code @code="GEN-368".
    </assert>
</rule>
</pattern>

