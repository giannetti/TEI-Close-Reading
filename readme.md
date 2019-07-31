This lab has been adapted from M. H. Beals's "TEI Close Reading," available at <https://github.com/mhbeals/TEI-Close-Reading>, and is licensed [CC BY](https://creativecommons.org/licenses/by/4.0/).

## Text Encoding

This workshop will explore a subset of the [Personal Correspondence, 1917-1919](http://www2.scc.rutgers.edu/ead/uarchives/warservicebureaub.html#series1) series of the Rutgers War Service Bureau records and help you to create a digital documentary edition of your letters.

## Setting Up Your Workspace

You will be assigned a file of correspondence organized by Rutgers alumnus. Each file has a filename that corresponds to the name of the alumnus.

Go to <https://github.com/giannetti/TEI-Close-Reading> and download the whole repository, including:

-  common-mistakes.md
-  README.md
-  rulwsb.sch
-  rulwsb_style.xsl
-  singlestyle.xsl
-  singletemplate.xml
-  voorheesjb.xml [this is a sample encoding]

Double click (Mac) or right-click (PC) to expand the contents of the zip folder.

Once downloaded, drag and drop the expanded file onto your desktop. Open the `singletemplate.xml` file in the Atom text editor.

Place your XML document on one side of your screen.

Next, go to the pdfs folder and open a page of correspondence that has been assigned to you (you will decide these assignments in your groups) and place this window to the other side of you screen. You may need to zoom in or out to get your page to a size that you can read comfortably.

If you look at your `singletemplate.xml` document you'll see a few lines of code (XML) at the top of your page. These are the declarations for the XML syntax and the associated stylesheet.  **This is important, so please do not delete it.**  

The last lines of the document will be `</div></body></text></TEI>`. Everything you write today should be just above`</div>`.


## Transcribing Your Pages

Look for the comments, denoted by `<!-- -->`, in your document. They contain instructions on how to complete the TEI XML elements.

In addition to supplying a few requested values in the `teiHeader` element, you will need to *very carefully* transcribe your page of text from the PDF into the `/TEI/text/body/div[@type='letter']` element.  Make sure you do not make any changes to the text, even if you think the author has used poor grammar or misspelled a word.  

**The only exception is if a word is hyphenated because it is split at a line break. In this case, you can just type the word as normal, without the hyphen.**

Remember, you are using a plain text editor, and will therefore not have a spell check function, so be very, very careful in your typing. If your page begins or ends mid-sentence, that is fine. Simply begin and end where the page does.

**Once you have completed your transcription, look away from your computer for 30-45 seconds. Staring into the distance every 10-20 minutes will keep your eyes from straining. Also, shake out your hands at the wrists, to prevent repetitive stress injuries to your fingers**.

You do not need to worry about line breaks but should start every new paragraph (or heading) with a <code>&lt;p&gt;</code> and end every paragraph (or heading) with a <code>&lt;/p&gt;</code>.

## Encoding Your Transcription

You are now going to *encode* or *mark up* your text.  

At the start of your transcription, and at the start every new paragraph (or heading), place a `<p>`. This explains to the computer that a new paragraph has begun. At the end every paragraph (or heading), place a `</p>`.

Re-read your page and look for the following things:

+ Any persons mentioned (including any he/she if they refer to a specific person)
+ Any places mentioned
+ Any events mentioned or statements in need of clarification  

Now that you have noted these, you are going to put proper code around them.

**For persons**, *surround* your original text with these

<code>&lt;persName key="Last, First" from="YYYY" to="YYYY" role="Occupation" ref="http://www.website.com/webpage.html"&gt; &lt;/persName&gt;</code>

+ Inside the quotation marks for **key**, include the real full name of the person mentioned  
+ In **from** and **to**, include their birth and death years, using ???? for unknown years  
+ In **role**, put the occupation, role or 'claim to fame' for this individual
+ In **ref**, put the URL (link) to a reliable and/or authoritative website where you found this information. Ask for help vetting a website, if you are not sure about its reliability.

**To find information on the people mentioned in your letters, try these sources:**

1. Silvers's supplementary material on the alumnus in RUcore, <https://rucore.libraries.rutgers.edu/>.
2. HathiTrust full text search, <https://www.libraries.rutgers.edu/indexes/hathitrust>.
3. The Virtual International Authority File (VIAF), <https://viaf.org/>.

*NB: If there is a `&` in your link, you will need to replace this with `&amp;amp;`*

**For places**, *surround* your original text with these

`<placeName key="Rutgers College, New Brunswick, NJ"
                            ref="https://tools.wmflabs.org/geohack/geohack.php?params=40_29_55_N_74_26_54_W"
                            > </placeName>`

+ In **key**, put the city, state and/or country with the best information you can find for the modern names of this location
+ In **ref**, put a link to the relevant coordinates on the [Wikipedia GeoHack website](https://tools.wmflabs.org/geohack/)

**To obtain this, go to the Wikipedia page for the city and click on the latitude/longitude coordinates for the location. For large areas, such as entire countries or continents, just use the Wikipedia page URL.**

**Alternately, for very specific locations that don't have Wikipedia entries, use <https://www.latlong.net/> to look up the latitude and longitude coordinates as decimal degrees.**

**Then, enter those coordinates into the fields for decimal latitude and longitude into the GeoHack form at <https://tools.wmflabs.org/geohack/>. Click "Do it" and then copy the resulting URL as your `@ref` value.**

**For analytic annotations**, e.g. glosses (definitions) or editorial annotations, *surround* your text (the entire statement being
made by the author) with `seg` tags.

`<seg xml:id="unique-id"> </seg>
<note type="reason" target="#unique-id">
     <p>Editorial annotation you supply</p>
     <ref target="http://www.website.com/webpage.html">Citation</ref>
</note>`

+ In **xml:id** (attribute of `interp` element), create a unique identifier for the footnote you will create in step 2 (see below). E.g. fn1, fn2, etc.
+ After the closing `interp` tag, add a `note` element.
+ In **target** (attribute of `note` element), put the xml:id value you created in the corresponding `interp` element, preceded by a hashtag, e.g. `<note target="#fn1">`.
+ In **type** (attribute of `note` element), put a value of `gloss` or `annotation`, depending on whether you are supplying a definition or an annotation based on information gleaned from an external source.
+ As a child of the `note` element, add `p` tags inside of which you will put your editorial annotation. If you would like to include a direct quotation from an external source, use `quote` tags instead.
+ As a second child of the `note` element, include a full citation (as you would in an essay) to the relevant source in a pair of `ref` tags. You won't be able to italicize the text, but this is fine.
+ Inside the opening `ref` tag, in **target**, put the link to the website where you got the information to assess this claim.
+ Double-check that your `p` or `quote` and `ref` elements are enclosed in a pair of opening and closing `note` tags.

**Where to find these external sources for editorial annotations? If it is a definition or gloss that you seek, try the [Oxford English Dictionary](https://login.proxy.libraries.rutgers.edu/login?url=http://www.oed.com/). If it is further detail on an event the sender alludes to in the text of the letter, search for Silvers's supplementary material on that alumnus in [RUcore](https://rucore.libraries.rutgers.edu/). In second order of preference, try searching for news articles about the event in [ProQuest Historical Newspapers](https://www.libraries.rutgers.edu/indexes/proquest_historical_newspapers). As a last resort, you may try a Google search, although be aware that the information you find will vary in terms of its reliability.**

**How should you cite these sources? Follow the conventions for citing web resources as a footnote/endnote in Chicago Style. Guidelines at <https://owl.purdue.edu/owl/research_and_citation/chicago_manual_17th_edition/web_sources.html>.**

When you are happy with your work, hit cntl+s (PC) or command+s (Mac) to save your work.

## Viewing Your Encoded Text

Once you have saved your file, in Atom, press COMMAND-SHIFT-P (Mac). Search for, and select the Atom-Xsltransform package. Then, enter the file path to the appropriate stylesheet, e.g. `/Users/Me/TEI-Close-Reading/singlestyle.xsl` (Mac). Save the resulting HTML document to your working directory with a file name ending in .html. With your cursor in the new HTML document, press CTRL-SHIFT-H to preview your HTML document.

If you now see a color-coded version of your text, congratulations! If you hover over the colored sections, you should see a pop-up with the additional information you entered.

If your text comes up only in black, with no paragraph divisions or headings, or doesn't come up at all, something has gone wrong. Re-open your .xml file and check that you have:

* Placed `<p>` at the start of every paragraph, including the start of the page

* Placed `</p>` at the end of every paragraph, including the end of the page

* Made sure all your `<persName>`, `<placeName>`, `<interp>` and `<note>` tags are properly enclosed in `<>`s

* Made sure you have both an open `<>` and close `<\>` tag for each tag you use

* Made sure you attribute values are fully enclosed in `""`s

* Made sure you have a space between the `"` of one attribute and the start of the next

* Made sure you do NOT have a space after the `=` of an attribute

If your text still does not appear formatted, you may need to remove the text one paragraph at a time, regenerating the HTML, until it appears. This will help you identify which paragraph (or sentence) has the error within it). You may also find an online XML validator to be helpful. Try the one offered by W3Schools at <https://www.w3schools.com/xml/xml_validator.asp>.

Once you have you a fully formatted file, pat yourself on the back for your hard work! If we have enough encoded letters, we may progress to creating a `teiCorpus` file with the collected correspondence for each alumnus, and an online edition with our edited correspondence.

## Resources

Alex Gil's ["The Short and Sweet TEI Handout"](https://docs.google.com/document/edit?id=12ErwXGHGaFL71M3cWHpI6gkfVzzsKHfk7U6N6vRmIS4&authkey=CKG3l6oG&hl=en#heading=h.uy40z0-ctpi0).

The *TEI Primer* of the Women Writers Project, specifically "An Introduction to XML" and "Overview of Text Encoding and the TEI": <http://www.wwp.neu.edu/outreach/resources/tei_prim.html>.

The TEI P5 Guidelines: <http://www.tei-c.org/release/doc/tei-p5-doc/en/html/>. To find out definitions and contextual uses of element and attribute names, look them up in the search bar.
