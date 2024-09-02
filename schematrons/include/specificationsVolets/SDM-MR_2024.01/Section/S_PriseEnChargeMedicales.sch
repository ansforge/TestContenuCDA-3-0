<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_PriseEnChargeMedicales.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Historique-prises-en-charge-medicales(1.2.250.1.213.1.1.2.76) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    20/02/2024 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_PriseEnChargeMedicales">
    <title>CI-SIS SDM-MR Prise en charge médicales </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.76"]'>
        
        <!-- Vérifier la cardinalité de l'entrée 'FR-Rencontre' [1..*]-->
        <assert test='count(./cda:entry[cda:encounter/cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.14"]) &gt;= 1'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            doit obligatoirement contenir [1..*] entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14).
        </assert>
        
    </rule>
    
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.76"]/cda:entry/cda:encounter[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.14"]'>
        <!-- Vérifier l'identifiant de la prise en charge -->
        <assert test='cda:id'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant l'identifiant de la prise en charge dans l'élément id.
        </assert>
        
        <!-- Vérifier le contexte de l'activité MR (code) -->
        <assert test='cda:code'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant le contexte de l'activité MR dans l'élément code.
        </assert>
        
        <!-- Vérifier la date de l'activité -->
        <assert test='cda:effectiveTime'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant la date de l'activité dans l'élément effectiveTime.
        </assert>
        
        <!-- Vérifier la Personne ayant réalisé l’activité -->
        <assert test='cda:performer[@typeCode ="PRF"]'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            doit obligatoirement contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant la personne ayant réalisé l’activité 'performer' et ayant comme attribut @typecode ="PRF".
        </assert>
        
        <!-- Vérifier le Site MR pour lequel l'activité est déclarée-->
        <assert test='count(cda:participant[@typeCode ="LOC"])&lt;=1'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76)
            peut contenir une entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) précisant le Site MR pour lequel l'activité est déclarée 'participant' et ayant comme attribut @typecode ="LOC" et une cardinalité [0..1].
        </assert>
        
        <!-- Vérifier l'objectif de l’activité MR : code -->
        <assert test='./cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code/@code="ORG-034"'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13)
            précisant l'objectif de l’activité MR dans l'élément code ayant comme attribut @code="ORG-034".
        </assert>
        
        <!-- Vérifier l'objectif de l’activité MR : value -->
        <assert test='./cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:value'>
            [S_PriseEnChargeMedicales-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Rencontre(1.3.6.1.4.1.19376.1.5.3.1.4.14) doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13)
            précisant l'objectif de l’activité MR dans l'élément value.
        </assert>
    </rule>
</pattern>

