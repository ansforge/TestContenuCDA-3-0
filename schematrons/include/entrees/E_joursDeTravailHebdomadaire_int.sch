<?xml version="1.0" encoding="UTF-8"?>

<!--  E_joursDeTravailHebdomadaire_int.sch
    
      Vérification de la conformité de l'entrée Weekly Work Days Observation (1.3.6.1.4.1.19376.1.7.3.1.4.24.7) aux spécifications du profil IHE PCC
    
    Historique : 
   05/01/2024 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_joursDeTravailHebdomadaire_int">
    <title>Vérification de la conformité de l'entrée  Weekly Work Days Observation (1.3.6.1.4.1.19376.1.7.3.1.4.24.7)</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.4.24.7"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_joursDeTravailHebdomadaire_int.sch] Erreur de conformité IHE PCC : Dans l'entrée FR-Jours-de-travail-hebdomadaire, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'SBADM' et 'EVN'  </assert>
        
        <assert test='count(cda:id)&gt;=1'>
            [E_joursDeTravailHebdomadaire_int.sch] Erreur de conformité IHE PCC : Dans l'entrée FR-Jours-de-travail-hebdomadaire, il doit y avoir un ou plusieurs élément id (cardinalité [1..*])
        </assert>
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_joursDeTravailHebdomadaire_int.sch] Erreur de conformité IHE PCC : 
            L'entrée "FR-Jours-de-travail-hebdomadaire" doit comporter un élément 'code'
        </assert> 
        <!-- Test présence et format de l'élément 'statusCode' -->
        <assert test="cda:statusCode/@code='completed'">
            [E_joursDeTravailHebdomadaire_int.sch] Erreur de conformité IHE PCC : Dans l'entrée FR-Jours-de-travail-hebdomadaire, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <!-- Test présence et format de l'élément 'value' -->
        <assert test="count(cda:value)=1">
            [E_joursDeTravailHebdomadaire_int.sch] Erreur de conformité IHE PCC : Dans l'entrée FR-Jours-de-travail-hebdomadaire, il doit y avoir un élément value (cardinalité [1..1])
        </assert>
    </rule>
    
</pattern>