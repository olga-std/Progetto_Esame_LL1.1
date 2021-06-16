<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <!--creo lo scheletro del documento finale HTML-->
    <xsl:template match="/">

        <html>
            <head>
                <script src="LL1.1.js"></script>
                <link href="LL1.1.css" rel="stylesheet" type="text/css"/>

                <!--titolo che compare nella scheda di navigazione-->
                                <title>Vincenzo Bellini LL1.1</title>
                        </head>

                        <body>
                                <!--creo un header con il titolo della pagina-->
                                <header>
                                        <b><i><span id="titolo"><xsl:apply-templates select="//tei:teiHeader//tei:titleStmt//tei:title"/></span></i></b>
                                </header>

                                <!--creo un conteiner con informazioni principali-->
                                <div id="InfoDocumento" class="conteiner">
                                        <div class="infoBox">
                                        <!--riporto mittente, destinatario, luogo, data e lingua-->
                                                <div id="infoLettera" class="styleBox">
                                                        <xsl:apply-templates select="//tei:profileDesc"/>
                                                </div>
                                                <!--riporto la segnatura e il luogo in cui si trova la lettera-->
                                                <div id="collocazione" class="styleBox">
                                                        <xsl:apply-templates select="//tei:msDesc"/>
                                                </div>
                                        </div>
                                </div>

                                <!--creo un conteiner con immagini ed il testo della lettera-->
                                <div id="Corpo" class="conteiner">
                                        <div class="item">
                                                <div class="infoBox">
                                                        <h3>Lettera <b>LL1.1</b></h3>
                                                        <div class="letteraBox">
                                                                <div id="imgLettera">
                                                                        <div id="folio">
                                                                                <h3>Scansioni</h3>
                                                                                <xsl:apply-templates select="//tei:facsimile"/>
                                                                        </div>
                                                                </div>                                                                
                                                                <div class="testoLettera">
                                                                        <div id="front">
                                                                                <h3>Frontespizio</h3>
                                                                                <xsl:apply-templates select="//tei:text//tei:front"/>
                                                                        </div>
                                                                        <div id="testo">
                                                                                <h3>Testo</h3>
                                                                                <xsl:apply-templates select="//tei:text//tei:div[@type='letter-body']"/>
                                                                        </div>
                                                                        <div id="termini">
                                                                                <xsl:apply-templates select="//tei:list[@type='terminology']"/>
                                                                        </div>
                                                                        <div id ="note">
                                                                                <xsl:apply-templates select="//tei:back//tei:div[@type='notes']"/>
                                                                        </div>

                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>

                                <!--creo un conteiner con informazioni secondarie-->
                                <div id="InfoSecondaarie" class="conteiner">
                                        <div class="infoBox">
                                                <!--riporto lista_Persone e lista_Luoghi-->
                                                <div id="PersoneLuoghi" class="styleBox">
                                                        <xsl:apply-templates select= "//tei:listPerson"/>
                                                        <xsl:apply-templates select = "//tei:listPlace"/>
                                                </div>
                                                <!--riporto descrizione_Lettera-->
                                                <div id="DescrizioneLettera" class="styleBox">
                                                        <xsl:apply-templates select = "//tei:physDesc"/>
                                                </div>
                                        </div>
                                </div>

                                <!--creo un conteiner con informazioni sul progetto-->
                                <div id="InfoProgetto" class="container">
                                        <div class="styleBox">
                                                <h3>Informazioni sul progetto</h3>
                                                <xsl:apply-templates select = "//tei:titleStmt//tei:respStmt"/>
                                                <xsl:apply-templates select = "//tei:editionStmt//tei:edition"/>
                                                <xsl:apply-templates select = "//tei:editionStmt//tei:respStmt"/>
                                        </div>
                                </div>

                                <!--creo un footer-->
                                <footer id="footer">
                                        <xsl:apply-templates select = "//tei:publicationStmt"/>
                                        <xsl:apply-templates select = "//tei:textClass"/>
                                        <xsl:apply-templates select = "//tei:back//tei:div[@type='bibliography']"/>
                                </footer>
                        </body>
                </html>
        </xsl:template>



        <!--TEMPLATE per le informazioni sulla lettera-->

        <!--div infoBox-->
        <xsl:template match="tei:profileDesc">
                <h3>Informazioni sulla lettera</h3>
                <b>Mittente:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:persName"/><br/>
                <b>Destinatario:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='received']"/><br/>
                <b>Luogo:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:placeName"/><br/>
                <b>Data:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspAction[@type='sent']//tei:date"/><br/>
                <b>Contesto:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:correspContext"/><br/>
                <b>Lingua:</b><xsl:text> </xsl:text><xsl:value-of select="current()//tei:langUsage"/><br/>
        </xsl:template>
        
        <!--div collocazione-->
        <xsl:template match="tei:msDesc">
                <h3>Collocazione della lettera</h3>
                <xsl:value-of select="current()//tei:altIdentifier"/><br/>
                <xsl:value-of select="current()//tei:repository"/>,
                <xsl:value-of select="current()//tei:settlement"/>,
                <xsl:value-of select="current()//tei:country"/><br/>
                <b>Segnatura della lettera:<xsl:text> </xsl:text><xsl:value-of select="current()//tei:idno"/></b><br/>
                <xsl:value-of select="current()//tei:note"/>
        </xsl:template>

        <!--div imgLettera-->
        <xsl:template match="tei:surface">
                <div class="img">
                        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                        <img><xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute></img>
                        
                        <!-- Vengono generati dei tag a che permettono di visualizzare delle evidenziazioni responsive sulle scansioni al passaggio del mouse -->
                        <xsl:for-each select="tei:zone">
                               <a><xsl:attribute name="class"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                <xsl:variable name="ulx" select="@ulx"/>
                                <xsl:variable name="uly" select="@uly"/>
                                <xsl:variable name="lrx" select="@lrx"/>
                                <xsl:variable name="lry" select="@lry"/>
                                <xsl:variable name="width" select="translate(../tei:graphic/@width, 'px', '')"/>
                                <xsl:variable name="height" select="translate(../tei:graphic/@height, 'px', '')"/>
                                <a class="arealb">
                                        <xsl:attribute name = "facs">
                                                <xsl:value-of select = "@xml:id"/>
                                        </xsl:attribute>
                                
                                        <xsl:attribute name="style">
                                                position: absolute;
                                                left:<xsl:value-of select="$ulx div $width * 100"/>%;
                                                top: <xsl:value-of select="$uly div $height * 100"/>%;
                                                width: <xsl:value-of select="($lrx - $ulx) div $width * 100"/>%;
                                                height: <xsl:value-of select="($lry - $uly) div $height * 100"/>%;
                                                <xsl:choose>
                                                        <xsl:when test="@rendition='HotSpot'">
                                                                z-index: 0;
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                        z-index: 1;
                                                                </xsl:otherwise>
                                                </xsl:choose>
                                        </xsl:attribute>
                                </a></a>
                        </xsl:for-each>
                </div>
        </xsl:template>





        <!--div testLettera-->
        <xsl:template name="facs_template_body" match="*[@facs]">
                <xsl:apply-templates/><br/>
                <xsl:element name="a">
                        <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;]]></xsl:text>
                </xsl:element>




                        <span>
                        <xsl:attribute name = "style">
                            <xsl:text>display:none</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name = "class">
                            <xsl:text>riga</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name ="id">
                            <xsl:value-of select = "translate(current()/@facs, '#','')"/>
                        </xsl:attribute>
                        <b><xsl:value-of select = "@n"/><xsl:text> </xsl:text>&#10147;<xsl:text> </xsl:text></b>
                        </span>
        </xsl:template>       

        <xsl:template match="tei:choice">
                <span class="abbr">
                        <xsl:choose>
                                <xsl:when test="tei:abbr">
                                        <xsl:attribute name="title"><xsl:value-of select="tei:expan"/></xsl:attribute>
                                        <xsl:value-of select="tei:abbr"/>
                                </xsl:when>
                        </xsl:choose>
                </span>
        </xsl:template>

        <!--diiv termini-->
        <xsl:template match="tei:list[@type='terminology']">
                <div id="term">
                        <h3><xsl:value-of select="tei:head"/></h3>
                        <ul>
                                <xsl:for-each select="tei:label">
                                        <li class="termElement">
                                                <xsl:attribute name="id"><xsl:value-of select="tei:term/@xml:id"/></xsl:attribute>
                                                        <p>
                                                                <b><xsl:value-of select="tei:term"/><xsl:text> </xsl:text>&#8212;<xsl:text> </xsl:text></b>
                                                                <xsl:apply-templates select="following-sibling::tei:item[1]/tei:gloss"/>
                                                        </p>
                                        </li>
                                </xsl:for-each>
                        </ul>
                </div>
        </xsl:template>


        <!--div note-->
        <xsl:template match="tei:div[@type='ann_notes']">
                <div>
                        <xsl:attribute name="id"><xsl:value-of select="@type"/></xsl:attribute>
                        <h3>Note</h3>
                        <ol>
                                <xsl:for-each select="tei:note">
                                        <li>
                                                <p><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
                                                <xsl:apply-templates select="./tei:p"/></p>
                                        </li>
                                </xsl:for-each>
                        </ol>
                </div>
        </xsl:template>


        <!--div PersoneLuoghi-->
        <xsl:template match="tei:sourceDesc//tei:head">
                <h3><xsl:apply-templates/></h3>
        </xsl:template>

        <xsl:template match="tei:sourceDesc//tei:person">
                <div>
                        <p>
                                <p>
                                        <b><xsl:for-each select="current()//tei:forename"><xsl:apply-templates/><xsl:text> </xsl:text></xsl:for-each>
                                        <xsl:value-of select="current()//tei:surname"/></b>
                                </p>
                                <p>
                                        (<xsl:value-of select = "current()//tei:birth//tei:placeName//tei:settlement[@type='municipality']"/>,
                                        <xsl:value-of select = "current()//tei:birth//tei:placeName//tei:country"/>,
                                        <xsl:value-of select="current()//tei:birth//tei:date"/> -

                                        <xsl:value-of select = "current()//tei:death//tei:placeName//tei:settlement[@type='municipality']"/>,
                                        <xsl:value-of select = "current()//tei:death//tei:placeName//tei:country"/>,
                                        <xsl:value-of select="current()//tei:death//tei:date"/>)
                                </p>

                                <p><i><xsl:value-of select="current()//tei:persName/@role"/></i></p>

                                <p><xsl:for-each select="current()//tei:addName">Alias:<xsl:apply-templates/></xsl:for-each></p>

                                <xsl:for-each select="current()//tei:roleName"><p><xsl:apply-templates/></p></xsl:for-each>
                                            
                                <xsl:value-of select="current()//tei:note//tei:p"/><br/>
                        </p>
                </div>
        </xsl:template>

        <xsl:template match="tei:sourceDesc//tei:listPlace">
                <h3><xsl:value-of select="current()//tei:head"/></h3>
                        
                <xsl:for-each  select="current()//tei:place">
                        <li>                                
                                <xsl:value-of select="current()//tei:place//tei:placeName"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="current()//tei:place//tei:country"/>
                                <xsl:apply-templates/>
                        </li>
                </xsl:for-each>
                       
        </xsl:template>

        <!--div caratteristicheLettera-->
        <xsl:template match="tei:physDesc">

                <h3>Caratteristiche della lettera</h3>

                <p><b>Materiale:</b></p>
                <p><xsl:value-of select = "current()//tei:material"/></p><br/>

                <p><b>Numero fogli:</b></p>
                <p>
                        <xsl:value-of select = "current()//tei:measure"/>
                        (<xsl:value-of select ="current()//tei:dimensions//tei:height"/>
                        x <xsl:value-of select = "current()//tei:dimensions//tei:width"/>
                        <xsl:value-of select="current()//tei:dimensions/@unit"/>)
                </p>
                <p><xsl:value-of select = "current()//tei:foliation"/></p><br/>

                <p><b>Stato di conservazione:</b></p>
                <p><xsl:value-of select = "current()//tei:condition"/></p><br/>

                <p><b>Scrittura:</b></p>
                <p><xsl:value-of select = "current()//tei:handDesc"/></p><br/>

                <p><b>Descrizione:</b></p>
                <p><xsl:value-of select = "current()//tei:support//tei:p"/></p>
        </xsl:template>

        <!--div InfoProgetto-->
        <xsl:template match = "tei:fileDesc//tei:respStmt">
                     
                <br><b><xsl:value-of select="current()//tei:resp"/>:</b></br>

                <xsl:for-each select="current()//tei:name">
                        <br><xsl:apply-templates/></br>
                </xsl:for-each>
                <br/>
                                 
        </xsl:template>

        <xsl:template match = "tei:edition"> 
                <p><b><i><xsl:apply-templates/></i></b></p>
        </xsl:template>

        <!--footer-->
        <xsl:template match = "tei:publicationStmt">
                <xsl:value-of select = "current()//tei:publisher"/>, 
                <xsl:value-of select = "current()//tei:licence"/><br/>
        </xsl:template>

        <xsl:template match = "tei:textClass">
                Soggettario di riferimento: <xsl:value-of select = "current()//tei:keywords/@scheme"/><br/>
        </xsl:template>


       <xsl:template match="tei:back//tei:div[@type='bibliography']">
                <b><i><xsl:value-of select="current()//tei:head"/></i></b>             
                <xsl:for-each select="current()//tei:listBibl//tei:bibl//tei:bibl">                      
                        <br><xsl:value-of select="current()//tei:author"/>,
                        <xsl:value-of select="current()//tei:date"/>,
                        p.<xsl:value-of select="current()//tei:citedRange"/></br>
                </xsl:for-each>
        </xsl:template>
</xsl:stylesheet>