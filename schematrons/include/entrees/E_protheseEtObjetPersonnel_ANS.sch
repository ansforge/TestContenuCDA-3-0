<?xml version="1.0" encoding="UTF-8"?>
<!--  E_protheseEtObjetPersonnel_ANS.sch
    
      Vérification de la conformité de l'entrée FR-Prothese-et-objet-personnel (1.2.250.1.213.1.1.3.12)
    
    Historique : 
   04/07/2023 : ANS :  Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_protheseEtObjetPersonnel_ANS">
    <title>Vérification de la conformité de l'entrée FR-Prothese-et-objet-personnel (1.2.250.1.213.1.1.3.12) créée par l'ANS</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.12"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, les attributs @classCode, @moodCode de l'élément observation sont fixés resectivement aux valeurs 'OBS', 'EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, il doit y avoir un élément id (cardinalité [1..1])
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, il doit y avoir le templateId  (’1.3.6.1.4.1.19376.1.5.3.1.4.13’)
        </assert>
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Prothese-et-objet-personnel" doit comporter un élément 'code' (cardinalité [1..1])
        </assert>            
        
        <assert test="cda:statusCode/@code='completed'">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, le statusCode doit présent et fixé à la valeur @code='completed'
        </assert>
        <assert test="cda:text">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, un élément text doit être présent 
        </assert>
        <assert test="cda:effectiveTime">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, un élément effectiveTime doit être présent 
        </assert>
        <assert test="cda:value">
            [E_protheseEtObjetPersonnel_ANS.sch] Erreur de conformité CI-SIS : Dans l'entrée FR-Prothese-et-objet-personnel, un élément value doit être présent 
        </assert>
    </rule>
    
</pattern>