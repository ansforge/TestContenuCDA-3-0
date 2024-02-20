<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_PlanDeSoins_IMG-DA-IMG.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section  FR-Plan-de-soins-IMG-DA (1.2.250.1.213.1.1.2.158.2) dans le document IMG-DA-IMG qui décrit 
   Modalité et région anatomique-organe/ Délai souhaité / Urgence vitale ou fonctionnelle (hors urgence organisationnelle) .
   
   IMG-DA-IMG : Demande d'acte d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    05/01/2022 : SBM : Création
    23/06/2022 : Mise à jour des schématrons suite à la mise à jour de l'entrée utilisée
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_PlanDeSoins_IMG-DA-IMG">
    <title>CI-SIS IMG-DA-IMG Section plan de soins</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.36"]'>
        
        <!-- présence de l'entrée FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) --> 
        <assert test="count(.//cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1']) &gt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) doit être présente une ou plusieurs fois [1..*].
        </assert>
        
    </rule>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1"]'>
        <!-- Vérifier l'existence de l'élément code de l'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) -->
        <assert test="cda:code"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) doit obligatoirement contenir un élément code.
        </assert>
        
        <!-- Vérifier l'existence de l'élément targetSiteCode dans l'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) -->
        <assert test="count(cda:targetSiteCode) &gt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) doit obligatoirement contenir un ou plusieurs élément targetSiteCode [1..*].
        </assert>
        
        <!-- Vérifier l'existence de l'élément targetSiteCode/qualifier dans l'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) -->
        <assert test="count(cda:targetSiteCode/cda:qualifier) &gt;=0"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) peut contenir dans l'élément targetSiteCode [0..*] qualifier.
        </assert>
        
        <!-- Vérifier l'existence de l'élément targetSiteCode/qualifier/value dans l'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) -->
        <assert test="(cda:targetSiteCode/cda:qualifier and count(cda:targetSiteCode/cda:qualifier/cda:value)=1)
            or (not(cda:targetSiteCode/cda:qualifier) and count(cda:targetSiteCode/cda:qualifier/cda:value)=0)"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) doit obligatoirement contenir dans l'élément targetSiteCode/qualifier un élément value [1..1].
        </assert>
        
        <!-- Vérifier l'existence du caractère urgent d'un examen -->
        <assert test="count(cda:priorityCode) &lt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) ne doit pas contenir plus d'un élément priorityCode.
        </assert>
        
        <!-- Vérifier l'existence de la justification de l'urgence si l'examen est urgent -->
        <assert test="(cda:priorityCode/@code='UR' and cda:priorityCode/cda:originalText/cda:reference) or (not(cda:priorityCode/@code='UR') and not(cda:priorityCode/cda:originalText/cda:reference))"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : Si priorityCode/@code='UR', l'élément priorityCode doit obligatoirement contenir originalText/reference 
            sinon si priorityCode/@code est différent de 'UR', l'élément priorityCode/originalText/reference ne doit pas exister.
        </assert>
        
        <!-- Vérifier l'existence du médecin effecteur contacté [0..1] -->
        <assert test="count(cda:performer) &lt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : FR-Demande-d-examen-ou-de-suivi(1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) ne doit pas contenir plus d'un élément performer.
        </assert>
        
        <!-- Cardinalité de l'entrée FR-Commentaire-ER [0..1] : Commentaire sur la modalité d’examen --> 
        <assert test="count(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.32']) &lt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) peut contenir [0..1] FR-Commentaire-ER pour plus de précision sur la modalité de l'examen.
        </assert>
        
        <!-- Cardinalité de l'entrée FR-Simple-Observation [0..1] : Le demandeur souhaite un retour par téléphone (O/N) --> 
        <assert test="count(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='GEN-297']) &lt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) peut contenir [0..1] FR-Simple-Observation pour préciser si le demandeur souhaite un retour par téléphone (cda:code/@code='GEN-297').
        </assert>
        
        <!-- Cardinalité de l'entrée FR-Simple-Observation [0..1] : Évènements associés  --> 
        <assert test="count(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='GEN-296']) &lt;=1"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) peut contenir [0..1] FR-Simple-Observation pour préciser l'évènement associé à l'examen demandé (cda:code/@code='GEN-296').
        </assert>
        
        <!-- Existence de l'entrée FR-Simple-Observation : Fonction etudiée si modalité= 'TEP' ou 'scintigraphie' --> 
        <assert test="((cda:code/@code='PT' or cda:code/@code='NM') and .//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='MED-1133'])
            or ((cda:code/@code!='PT' and cda:code/@code!='NM') and not(.//cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48' and cda:code/@code='MED-1133']))"> 
            [S_PlanDeSoins_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : L'entrée "FR-Demande-d-examen-ou-de-suivi" (1.3.6.1.4.1.19376.1.5.3.1.1.20.3.1) doit obligatoirement contenir une entrée FR-Simple-Observation (fonction étudiée : code/@code='MED-1133') si la modalité de l’examen demandée = "TEP" ou "Scintigraphie".
        </assert>
        
    </rule>
    
</pattern>