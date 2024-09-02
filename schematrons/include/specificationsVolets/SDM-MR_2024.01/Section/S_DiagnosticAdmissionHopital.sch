<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_DiagnosticAdmissionHopital.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Diagnostic-admission-hopital(1.2.250.1.213.1.1.2.129) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    20/02/2024 : SBM : Création
   ......................................................................................................................................................    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DiagnosticAdmissionHopital">
    
    <title>CI-SIS SDM-MR Diagnostic admission hopital </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.129"]'>
        
        <!-- Vérifier la cardinalité de l'entrée '1.3.6.1.4.1.19376.1.5.3.1.4.5.2' [1..*]-->
        <assert test='count(./cda:entry[cda:act/cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2"]) &gt;= 1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Diagnostic-admission-hopital (1.2.250.1.213.1.1.2.129)
            doit obligatoirement contenir [1..*] entrée FR-Liste-des-problemes(1.3.6.1.4.1.19376.1.5.3.1.4.5.2).
        </assert>
        
    </rule>
    
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.129"]/cda:entry/cda:act[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2"]'>
        <!-- Vérifier l'identifiant du diagnostic -->
        <assert test='count(cda:id)=1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Diagnostic-admission-hopital (1.2.250.1.213.1.1.2.129)
            doit obligatoirement contenir une entrée FR-Liste-des-problemes(1.3.6.1.4.1.19376.1.5.3.1.4.5.2) précisant l'identifiant du diagnostic dans l'élément id.
        </assert>
        
        <!-- Vérifier la date du diagnostic -->
        <assert test='count(cda:effectiveTime)=1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Diagnostic-admission-hopital (1.2.250.1.213.1.1.2.129)
            doit obligatoirement contenir une entrée FR-Liste-des-problemes(1.3.6.1.4.1.19376.1.5.3.1.4.5.2) précisant la date du diagnostic dans l'élément effectiveTime.
        </assert>
        
        <!-- Vérifier l'entrée FR-Probleme : Diagnostic Maladie rare -->
        <assert test='count(./cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5"])&gt;=1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Liste-des-problemes(1.3.6.1.4.1.19376.1.5.3.1.4.5.2) doit obligatoirement contenir une ou plusieurs entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5), une entrée par diagnostic.
        </assert>
      
    </rule>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.129"]/cda:entry/cda:act[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2"]/cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.5"]'>
   
        <!-- Vérifier le code de l'entrée -->
        <assert test='cda:code/@code="282291009"'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit obligatoirement contenir le code avec l'attribut @code="282291009".
        </assert>
        <!-- Vérifier la valeur de l'entrée -->
        <assert test='count(cda:value[@xsi:type="CD" or @nullFlavor])=1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit obligatoirement contenir l'élément value fixé à :
            - la valeur xsi:type=’CD’ 
            ou 
            - @nullFlavor si la maladie rare non précisément identifiée.
        </assert>
        
        <!-- Vérifier id de foetus -->
        <assert test='not(cda:subject) or cda:subject/cda:relatedSubject/cda:subject/sdtc:id'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Sujet existe dans l'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5), il faudrait
            obligatoirement préciser l'dentifiant du fœtus (si le diagnostic concerne un fœtus).
        </assert>
        
        <!-- Vérifier sexe du foetus -->
        <assert test='not(cda:subject) or cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Sujet existe dans l'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5), il faudrait
            obligatoirement préciser le sexe du fœtus (si le diagnostic concerne un fœtus).
        </assert>
        
        <!-- Vérifier  Si Grossesse multiple -->
        <assert test='not(cda:subject) or cda:subject/cda:relatedSubject/cda:subject/sdtc:multipleBirthInd'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : Si l'entrée FR-Sujet existe dans l'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5), il faudrait
            obligatoirement préciser s'il s'agit d'une grossesse multiple.
        </assert>
        
        <!-- Vérifier le code de l'entrée Statut actuel du diagnostic -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code[@code="MED-072"]'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit contenir l'entryRelationship "statut actuel du diagnostic" avec le code/@code="MED-072".
        </assert>
        
        <!-- Vérifier le code de l'entrée Appréciation du diagnostic à l'entrée -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code[@code="MED-071"]'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit contenir l'entryRelationship "Appréciation du diagnostic à l'entrée" avec le code/@code="MED-071".
        </assert>
        
        <!-- Vérifier le code de l'entrée Age au diagnostic -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code[@code="PAT-015"]'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit contenir l'entryRelationship "Age au diagnostic" avec le code/@code="PAT-015".
        </assert>
        
        <!-- Vérifier le code de l'entrée Investigation réalisée -->
        <assert test='count(cda:entryRelationship/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code[@code="ORG-017"])&gt;=1'>
            [S_DiagnosticAdmissionHopital-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Probleme(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit contenir une ou plusieurs entryRelationship "Investigation réalisée" avec le code/@code="ORG-017".
        </assert>
        
    </rule>
</pattern>

