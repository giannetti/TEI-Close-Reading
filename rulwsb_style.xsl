<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <!-- The Firefox XSLT processor only accepts method html. -->
    <xsl:output method="xhtml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <body>
                <center>
                    <h2>
                        <xsl:value-of select="/teiCorpus/teiHeader/fileDesc/titleStmt/title"/>
                    </h2>
                    <h4>
                        <xsl:value-of
                            select="/teiCorpus/teiHeader/fileDesc/publicationStmt/authority"/><br/>
                        <xsl:text>URL: </xsl:text>
                        <xsl:value-of
                            select="/teiCorpus/teiHeader/fileDesc/publicationStmt/idno[@type='URI']"
                        />. </h4>
                </center>
                <hr/>
                <xsl:for-each select="/teiCorpus/TEI/text/body/div[@type='letter']">
                    <i><xsl:value-of select="ancestor::TEI/teiHeader/fileDesc/titleStmt/title"
                        />.</i>
                    <p id="{ancestor::TEI/@xml:id}">
                        <xsl:apply-templates/>
                    </p>
                    <hr style="border-top: 1px dotted #8c8b8b;"/>
                </xsl:for-each>

                <h3>Key:</h3>
                <ul>
                    <li style="color:blue;text-decoration:none;">Individual</li>
                    <li style="color:#00CC00;text-decoration:none;">Location</li>
                    <li style="color:red;text-decoration:none;">Claim</li>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>
    <xsl:template match="head | note[@type='letterhead']">
        <div style="text-align: center;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="dateline/child::*">
        <div style="text-align: right;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="salute">
        <div style="text-align: left;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="unclear">
        <i>
            <xsl:apply-templates/>
            <xsl:text> [?]</xsl:text>
        </i>
    </xsl:template>
    <xsl:template match="persName | name[@type='person']">
        <a style="color:blue;text-decoration:none;" href="{@ref}"
            title="{@key}&#013;({@from | @from-iso}-{@to | @to-iso})&#013;{@role}">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <xsl:template match="placeName">
        <a style="color:#00CC00;text-decoration:none;" href="{@ref}" title="{@key}">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <xsl:template match="interp">
        <a style="color:red;text-decoration:none;" href="{@source}"
            title="{@type}&#013;&#013;{@n}, available at {@source}">
            <xsl:value-of select="."/>
        </a>
    </xsl:template>
    <!-- The Firefox XSLT processor can't interpret percentages in the height attribute, but px okay. -->
    <xsl:template match="pb">
        <h4>Page: <a name="{@n}"><xsl:value-of select="@n"/></a></h4>
        <a href="{@facs}">
            <img src="{@facs}" alt="page image" height="75px"/>
        </a>
        <br/>
    </xsl:template>
</xsl:stylesheet>
