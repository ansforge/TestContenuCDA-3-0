<?xml version="1.0" encoding="UTF-8"?>

<!--                  
   E_dispensationMedicament.sch
    Teste la conformité du contenu de l'entrée  FR-Dispensation-item( 1.3.6.1.4.1.19376.1.9.1.3.4 ) sépcifiées dans le volet eDIS-MED
    
    Historique :
    24/01/2023 : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_dispensationMedicament">
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.4']">
        
        <!-- [1..1] templateId France de l'entrée -->
        <assert test="cda:templateId/@root='1.2.250.1.213.1.1.3.204'">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : le templateId de l'entrée FR-Dispensation-item( 1.3.6.1.4.1.19376.1.9.1.3.4 ) doit avoir l'attribut @root="1.2.250.1.213.1.1.3.204".
        </assert>
        
        <!-- [1..1] texte de l'entrée -->
        <assert test="count(./cda:text)=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : le text de l'entrée FR-Dispensation-item( 1.3.6.1.4.1.19376.1.9.1.3.4 ) doit être présent [1..1].
        </assert>
        
        <!-- [1..1] élement quantity de l'entrée -->
        <assert test="count(./cda:quantity)=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'élément quantity de l'entrée FR-Dispensation-item( 1.3.6.1.4.1.19376.1.9.1.3.4 ) doit être présent [1..1].
        </assert>
        
        <!-- [1..1] élement product de l'entrée -->
        <assert test="count(./cda:product)=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'élément product de l'entrée FR-Dispensation-item( 1.3.6.1.4.1.19376.1.9.1.3.4 ) doit être présent [1..1].
        </assert>
        
        <!-- [0..1] Entrée FR-Reference-item-prescription -->
        <assert test="count(cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.11'])&lt;=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'entrée FR-Reference-item-prescription (1.3.6.1.4.1.19376.1.9.1.3.11) peut etre présente au maximum une seule fois [0..1].
        </assert>
        
        <!-- [0..1] Entrée FR-Instructions-au-patient -->
        <assert test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.2.250.1.213.1.1.3.33'])&lt;=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'entrée FR-Instructions-au-patient (1.2.250.1.213.1.1.3.33) peut etre présente au maximum une seule fois [0..1].
        </assert>
        
        <!-- [0..1] Entrée FR-Notes-du-dispensateur -->
        <assert test="count(cda:entryRelationship[@typeCode='SUBJ']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1'])&lt;=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'entrée FR-Notes-du-dispensateur (1.3.6.1.4.1.19376.1.5.3.1.4.3.1) peut etre présente au maximum une seule fois [0..1].
        </assert>
        
        <!-- [0..1] Entrée FR-Instructions-au-dosage -->
        <assert test="count(cda:entryRelationship[@typeCode='COMP']/cda:substanceAdministration/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.6'])&lt;=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'entrée FR-Instructions-au-dosage (1.3.6.1.4.1.19376.1.9.1.3.6) peut etre présente au maximum une seule fois [0..1].
        </assert>
        
        <!-- [0..1] Entrée FR-Acte-substitution -->
        <assert test="count(cda:entryRelationship[@typeCode='COMP']/cda:act/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.9.2'])&lt;=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'entrée FR-Acte-substitution (1.3.6.1.4.1.19376.1.9.1.3.9.2) peut etre présente au maximum une seule fois [0..1].
        </assert>
    </rule>
    
    <!-- FR-Reference-item-prescription -->
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.11']">
        <!-- code de l'entrée [1..1]-->
        <assert test="./cda:code[@code='PREItem' and @codeSystem='1.3.6.1.4.1.19376.1.9.2.2']">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : Si l'entrée FR-Reference-item-prescription(1.3.6.1.4.1.19376.1.9.1.3.11) existe, le code dont l'attribut @code='PREItem' et @codeSystem='1.3.6.1.4.1.19376.1.9.2.2' doit etre présent.
        </assert>
    </rule>
   
    <!-- FR-Instructions-au-patient -->
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.33']">
        <!--  code de l'entrée [1..1]-->
        <assert test="./cda:code[@code='PINSTRUCT' and @codeSystem='1.3.6.1.4.1.19376.1.5.3.2']">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : Si l'entrée FR-Instructions-au-patient(1.2.250.1.213.1.1.3.33) existe, le code dont l'attribut @code='PINSTRUCT' et @codeSystem='1.3.6.1.4.1.19376.1.5.3.2' doit etre présent.
        </assert>
    </rule>
    
    <!-- FR-Notes-du-dispensateur -->
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.3.1']">
        <!--  code de l'entrée [1..1]-->
        <assert test="./cda:code[@code='FINSTRUCT' and @codeSystem='1.3.6.1.4.1.19376.1.5.3.2']">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : Si l'entrée FR-Notes-du-dispensateur(1.3.6.1.4.1.19376.1.5.3.1.4.3.1) existe, le code dont l'attribut @code='FINSTRUCT' et @codeSystem='1.3.6.1.4.1.19376.1.5.3.2' doit etre présent.
        </assert>
    </rule>
    
    <!-- FR-Traitement : Posologie (uniquement si la posologie a été modifiée) -->
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.6']">
        <!-- Durée de traitement [1..1]-->
        <assert test="./cda:effectiveTime[@xsi:type='IVL_TS']">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'effectiveTime de l'entrée FR-Instructions-au-dosage(1.2.250.1.213.1.1.3.205) dont le @xsi:type='IVL_TS' doit etre présent pour préciser
            la durée de traitement.
        </assert>
        <!-- Fréquence d'administration [1..1]-->
        <assert test="./cda:effectiveTime[@xsi:type='SXPR_TS' and cda:comp/@operator='A']">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'effectiveTime de l'entrée FR-Instructions-au-dosage(1.2.250.1.213.1.1.3.205) dont le @xsi:type='SXPR_TS' doit etre présent pour préciser
            la fréquence d'administration.
        </assert>
        
        <!-- consumable [1..1]-->
        <assert test="./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/@nullFlavor='NA'">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : l'élément manufacturedMaterial de l'entrée FR-Instructions-au-dosage(1.2.250.1.213.1.1.3.205) doit etre présent et doit avoir
            comme attribut nullFlavor="NA".
        </assert>
    </rule>

    <!-- FR-Acte-substitution -->
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.3.9.2']">
        <!-- [1..1] code de l'entrée -->
        <assert test="count(./cda:code)=1">
            [E_dispensationMedicament.sch] Erreur de conformité CI-SIS : le code de l'entrée FR-Acte-substitution(1.3.6.1.4.1.19376.1.9.1.3.9.2) doit être présent [1..1] pour préciser
            le type d'acte de substitution.
        </assert>
    </rule>
</pattern>