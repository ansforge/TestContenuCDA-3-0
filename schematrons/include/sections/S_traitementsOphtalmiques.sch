<!-- S_traitementsOphtalmiques.sch
    Vérification de la conformité de la section FR-Traitements-ophtalmiques aux spécification IHE EYE CARE GEE (Ophthalmic Medications)
   
    11/07/2023 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_traitementsOphtalmiques">
    
    <title>Vérification de la conformité de la section FR-Traitements-ophtalmiques aux spécification IHE EYE CARE GEE (Ophthalmic Medications)</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.12.1.2.4"]'>
        
        <!-- Verifier que le templateId est utilisé pour une section -->
        <assert test='../cda:section'> 
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : Ce template ne peut être utilisé que pour une section. 
        </assert>
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:code[@code = "70935-2"]'> 
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : Le code de la section FR-Traitements-ophtalmiques doit être "70935-2".
        </assert> 
        
        <assert test='cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'> 
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : L'élément 'codeSystem' de la section FR-Traitements-ophtalmiques 
            doit être codé à partir de la nomenclature LOINC (2.16.840.1.113883.6.1). 
        </assert>
        
        <assert test='count(cda:title)=1'>
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : La section FR-Traitements-ophtalmiques  doit avoir un élément "title".
        </assert>
        
        <assert test='count(cda:text)=1'>
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : La section FR-Traitements-ophtalmiques  doit avoir un élément "text".
        </assert>
        <!-- Vérifier que l'entrée est conformes -->
        <assert test='count(./cda:entry/cda:substanceAdministration/cda:templateId[@root = "2.16.840.1.113883.10.20.22.4.16"])&gt;1'> 
            [S_traitementsOphtalmiques.sch] Erreur de conformité IHE Eye Care GEE : La section 'FR-Traitements-ophtalmiques' doit avoir au minimum une entrée de type Medication Activity.
        </assert>
    </rule>
    
</pattern>