<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <!-- The Firefox XSLT processor only accepts method html. -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <body>
                <div style="text-align: center;">
                    <h2>
                        <xsl:value-of select="/teiCorpus/teiHeader/fileDesc/titleStmt/title"/>
                    </h2>
                    <h4>
                        <xsl:value-of
                            select="/teiCorpus/teiHeader/fileDesc/publicationStmt/authority"/>
                        <br/>
                        <xsl:text>URL: </xsl:text>
                        <a href="{/teiCorpus/teiHeader/fileDesc/publicationStmt/idno[@type='URI']}" target="_blank">
                            <xsl:value-of
                                select="/teiCorpus/teiHeader/fileDesc/publicationStmt/idno[@type='URI']"
                            />
                        </a>
                    </h4>
                </div>
                <hr/>
                <xsl:for-each select="/teiCorpus/TEI/text/body/div[@type='letter']">
                    <h3>
                        <xsl:value-of select="ancestor::TEI/teiHeader/fileDesc/titleStmt/title"/>
                    </h3>
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
    <xsl:template match="head | opener/note[@type='letterhead']">
        <div style="text-align: center;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="opener/dateline">
        <div style="text-align: right;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="opener/salute">
        <div style="text-align: left;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="addrLine">
           <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="closer/salute">
        <div style="margin-left: 1.5em;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="closer/signed">
        <div style="margin-left: 2.5em;">
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
        <span style="color:red;text-decoration:none;"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="note[@type='annotation'] | note[@type='gloss']" /> <!-- ignore annotations and glosses for now -->

    <!-- The Firefox XSLT processor can't interpret percentages in the height attribute, but px okay. -->
    <xsl:template match="pb">
        <h4>Page: <xsl:value-of select="@n"/></h4>
        <br/>
    </xsl:template>
</xsl:stylesheet>
