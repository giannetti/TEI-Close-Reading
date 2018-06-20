<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>Schematron constraints for the Rutgers War Service Bureau correspondence</title>
    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <pattern>
        <rule context="tei:TEI//@ref | tei:TEI//@who | tei:TEI//@corresp | tei:TEI//@wit">
            <assert test="starts-with(., '#')">
                Attributes @ref, @who, @corresp and @wit must begin with a hashtag.
            </assert>
        </rule>
    </pattern>

    <pattern>
        <rule context="tei:publicationStmt/child::tei:idno">
            <assert test="@type">
                ERROR: The idno element should have a @type attribute, i.e. @type="URI"
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:TEI">
            <assert test="@xml:id">
                ERROR: Every TEI element must have an @xml:id attribute formed with the filename and the letter number separated by an underscore, i.e. rucore00000002350_01 is letter #1 in the rucore00000002350 file
            </assert>
        </rule>
    </pattern>
        <pattern>
            <rule context="tei:div">
                <assert test="@type">
                    ERROR: The div element should have a @type attribute, i.e. @type="letter"
                </assert>
            </rule>
        </pattern>
    <pattern>
        <rule context="tei:pb">
            <assert test="@n">
                ERROR: Please include an @n attribute with the page number
            </assert>
<!--            <assert test="@facs">
                ERROR: Please include the @facs attribute with a relative path to your images file, i.e. "images/rucore00000002350_01.png"
            </assert>
            <assert test="ends-with(@facs, '.png')">
                All @facs values must point to a locally stored image with the file extension .png
            </assert>-->
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:*[@ref]">
            <assert test="starts-with(@ref,'http:') or starts-with(@ref,'https:')">
                ERROR: All @ref attributes must point to a public URL beginning with http: or https:
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:note">
            <assert test="@type">
                ERROR: All note elements must contain a @type attribute, i.e. @type="letterhead" or @type="footnote"
            </assert>
        </rule>
    </pattern>
    <!--<pattern>
        <rule context="tei:persName">
            <assert test="@key">
                ERROR: All &lt;persName&gt; elements need a @key attribute, which contains a regularized version of their
                name, i.e. Lastname, Firstname
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:placeName">
            <assert test="@key">
                ERROR: All &lt;placeName&gt; elements need a @key attribute, which contains a regularized version of the location
            </assert>
        </rule>
    </pattern>-->
</schema>
