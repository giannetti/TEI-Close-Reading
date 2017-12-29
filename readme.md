This workshop has been adapted from M. H. Beals's "TEI Close Reading" available at <https://github.com/mhbeals/TEI-Close-Reading>. 

# Unit: Text Encoding

This workshop will explore a subset of the [Personal Correspondence, 1917-1919](http://www2.scc.rutgers.edu/ead/uarchives/warservicebureaub.html#series1) series of the Rutgers War Service Bureau records and help you to create a digital documentary edition of your letters.

## Setting Up Your Workspace

You will be assigned a folder of correspondence organized by Rutgers alumnus. Each folder has a filename that corresponds to its [RUcore](https://rucore.libraries.rutgers.edu/) identification number, i.e. rucore00000002350. 

Download the following files:
-  images/
-  rulwsb_style.xsl
-  rulwsb.sch
-  (your correspondence id number).xml

Download (right-click and select download) these files. 

Once downloaded, drag and drop (or extract) the files from the zip folder onto your desktop. Open the .xml (correspondence id number) file. It should open with Notepad (PC) or TextEdit (Mac). 

Place your correspondence id number document on one side of your screen.

Next, go to the images folder and open a page of correspondence that has been assigned to you (you will decide these assignments in your groups) and place this window to the other side of you screen. You may need to zoom in or out to get your page to a size that you can read comfortably.

If you look at your *blank* .xml document you'll see a little bit of computer code (XML) at the top and bottom of your page.  **This is important, so please do not delete it.**  

The last lines will be 
<code>&lt;/body&gt;&lt;/text&gt;&lt;/TEI&gt;&lt;/teiCorpus&gt;</code>. Everything you write today should be just above <code>&lt;/body&gt;</code>.

## Transcribing Your Pages

Look for the comments, denoted by `<!-- -->`, in your document. They contain instructions on how to complete the TEI XML elements.

In addition to supplying any requested values in the `teiHeader` element, you will need to *very carefully* transcribe your page of text from the image into the `/teiCorpus/TEI/text/body` element.  Make sure you do not make any changes to the text, even if you think the author has used poor grammar or misspelled a word.  

**The only exception is if a word is hyphenated because it is split at a line break. In this case, you can just type the word as normal, without the hyphen.**

Remember, you are using a plain text editor, and will therefore not have a spell check function, so be very, very careful in your typing. If your page begins or ends mid-sentence, that is fine. Simply begin and end where the page does.

**Once you have completed your transcription, look away from your computer for 30-45 seconds. Staring into the distance every 10-20 minutes will keep your eyes from straining. Also, shake out your hands at the wrists, to prevent repetitive stress injuries to your fingers**.

You do not need to worry about line breaks but should start every new paragraph (or heading) with a <code>&lt;p&gt;</code> and end every paragraph (or heading) with a <code>&lt;/p&gt;</code>.

## Encoding Your Transcription

You are now going to *encode* or *mark-up* your text.  

At the start of your transcription, and at the start every new paragraph (or heading), place a \<p\>. This explains to the computer that a new paragraph has begun. At the end every paragraph (or heading), place a \</p\>. 

Re-read your page and look for the following things:

+ Any persons mentioned (including any he/she if they refer to a specific person)
+ Any places mentioned
+ Any claims, assertions or arguments made, or statements in need of clarification  

Now that you have noted these, you are going to put proper code around them.

**For persons**, *surround* your original text with these

<code>&lt;persName key="Last, First" from="YYYY" to="YYYY" role="Occupation" ref="http://www.website.com/webpage.html"&gt; &lt;/persName&gt;</code>

+ Inside the speech marks for **key**, include the real full name of the person mentioned  
+ In **from** and **to**, include their birth and death years, using ???? for unknown years  
+ In **role**, put the occupation, role or 'claim to fame' for this individual 
+ In **ref**, put the URL (link) to a reliable and/or authoritative website where you found this information. Ask for help vetting a website, if you are not sure about its reliability.

*If there is a `&` in your link, you will need to replace this with `&amp;amp;`*

**For places**, *surround* your original text with these

`<placeName key="Rutgers College, New Brunswick, NJ"
                            ref="https://tools.wmflabs.org/geohack/geohack.php?params=40_29_55_N_74_26_54_W"
                            > </placeName>`

+ In **key**, put the city, state and/or country with best information you can find for the modern names for this location
+ In **ref**, put a link to the relevant coordinates on the [Wikipedia GeoHack website](https://tools.wmflabs.org/geohack/) 

**To obtain this, go to the Wikipedia page for this city and click on the latitude/longitude coordinates for the location. For large areas, such as entire countries or continents, just use the Wikipedia page URL.**

**For claims or arguments**, *surround* your text (the entire statement being
made by the author) with these

<code>&lt;interp key="reason" n="citation" cert="high" ref="http://www.website.com/webpage.html"&gt; &lt;/interp&gt;</code>

+ In **key**, explain the nature of the claim, based upon secondary evidence
+ In **n**, put a full citation (as you would in an essay) to the relevant *secondary* source. You won't be able to italicize the text, but this is fine.
+ In **cert** (short for certainty), put: high, medium, low or unknown, depending on how much you trust the secondary source you have used
+ In **ref**, put the link to the website where you got the information to assess this claim. If you are doing it based on course material, write <https://blogs.libraries.rutgers.edu/humdata18>, but know that course material is a weak source and should be avoided wherever possible.

When you are happy with your work, hit cntl+s (PC) or command+s (Mac) to save your work.

## Viewing Your Encoded Text

Once you have saved your file, close the document. Open either Internet Explorer or Firefox. The following will not work in Chrome because it has different security settings.

Making sure both your (page number).xml file and your rulwsb_style.xsl file are in the same folder (or both on your desktop), drag the icon for **(page number).xml** into your Internet Explorer or Firefox browser window.

If you now see a color-coded version of your text, Congratulations! If you hover over the colored sections, you should see a pop-up with the additional information you entered.

If your text comes up only in black, with no paragraph divisions or headings, or doesn't come up at all, something has gone wrong. Re-open your .xml file and check that you have:

* Placed `<p>` at the start of every paragraph, including the start of the page

* Placed `</p>` at the end of every paragraph, including the end of the page

* Made sure all your `<persName>`, `<placeName>` and `<interp>` tags are properly enclosed in `<>`s

* Made sure you have both an open `<>` and close `<\>` tag for each tag you use

* Made sure you attribute values are fully enclosed in `""`s

* Made sure you have a space between the `"` of one attribute and the start of the next

* Made sure you do NOT have a space after the `=` of an attribute

If your text still does not appear formatted, you may need to remove the text one paragraph at a time, refreshing your browser window, until it appears. This will help you identify which paragraph (or sentence) has the error within it).

Once you have you a full formatted file, congratulations! If you choose to post your work online, please do place a link to the site below and receive proper acolades your hard work!
