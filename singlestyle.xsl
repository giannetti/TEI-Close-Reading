<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    version="2.0">
    <!-- The Firefox XSLT processor only accepts method html. -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <body>
                <h4>
                    <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/>
                </h4>
                <xsl:for-each select="TEI/text/body/div">
                    <div>
                        <xsl:apply-templates/>
                    </div>
                </xsl:for-each>

                <h3>Key:</h3>
                <ul>
                    <li style="color:blue;text-decoration:none;">Individual</li>
                    <li style="color:#00CC00;text-decoration:none;">Location</li>
                    <li style="color:red;text-decoration:none;">Claim</li>
                    <li style="color:0DFFDA;text-decoration:none;">Opener</li>
                    <li style="color:E8A30C;text-decoration:none;">Closer</li>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="persName">
        <a style="color:blue;text-decoration:none;" href="{@ref}"
            title="{@key}&#013;({@from}-{@to})&#013;{@role}">
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
    <xsl:template match="pb">
        <h4>Page: <xsl:value-of select="@n"/></h4>
    </xsl:template>
    <xsl:template match="opener/child::*">
        <div style="color:0DFFDA;text-decoration:none;"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="closer/child::*">
        <div style="color:E8A30C;text-decoration:none;"><xsl:apply-templates/></div>
    </xsl:template>
</xsl:stylesheet>
