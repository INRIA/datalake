<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model">href="../schema-TEI-RADAR/out/TEI_RADAR.rng" type="application/xml"
            schematypens="http://relaxng.org/ns/structure/1.0"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">href="../schema-TEI-RADAR/out/TEI_RADAR.rng" type="application/xml"
            schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="raweb">
        <TEI xml:lang="{@xml:lang}">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Title</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
                <profileDesc>
                    <textClass>
                        <xsl:apply-templates select="identification/keywordsSdN | identification/keywordsSecteurs"/>
                    </textClass>
                </profileDesc>
            </teiHeader>
            <text>
                <front>
                    <xsl:apply-templates select="team, identification"/>
                </front>
                <body>
                    <xsl:apply-templates select="* except (team, biblio, identification)"/>
                </body>
                <back>
                    <xsl:apply-templates select="biblio"/>
                </back>
            </text>
        </TEI>
    </xsl:template>

    <xsl:template match="keywordsSdN">
        <keywords scheme="sdN">
            <xsl:apply-templates/>
        </keywords>
    </xsl:template>

    <xsl:template match="keywordsSecteurs">
        <keywords scheme="Secteurs">
            <xsl:apply-templates/>
        </keywords>
    </xsl:template>

    <!--  <subsection id="ABS-RA-2021-uid2" level="1"> -->
    <xsl:template match="
            subsection | presentation | fondements
            | diffusion | domain | highlights
            | resultats | logiciels | partenariat
            | domaine | responsability">
        <!-- On drope le @level pour l'instant, en attendant de 
            savoir ce qu'il veut dire -->
        <div type="{name()}" xml:id="{@id}">
            <xsl:copy-of select="@* except (@id, @level)"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="identification">
        <div type="{name()}" xml:id="{@id}">
            <xsl:copy-of select="@* except (@id,@isproject)"/>
            <listOrg>
                <org type="{LeTypeProjet}">
                    <xsl:apply-templates select="shortname, projectName"/>
                    <desc>
                        <xsl:apply-templates select="* except (shortname, projectName, UR)"/>
                    </desc>
                    <xsl:apply-templates select="UR"/>
                </org>
            </listOrg>
        </div>
    </xsl:template>

    <!-- team est une section avec une liste de personnes -->
    <xsl:template match="team">
        <div type="{name()}" xml:id="{@id}">
            <listPerson>
                <xsl:apply-templates/>
            </listPerson>
        </div>
    </xsl:template>

    <!-- La biblio contient une paire d'attributs -->
    <xsl:template match="biblio">
        <div xml:id="{@id}" n="{@numero}">
            <xsl:copy-of select="@* except (@html, @id, @titre, @numero)"/>
            <xsl:attribute name="type" select="@html"/>
            <xsl:if test="@titre">
                <head>{@titre}</head>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="participants">
        <desc>
            <listPerson type="participants">
                <xsl:apply-templates/>
            </listPerson>
        </desc>
    </xsl:template>

    <!-- <bodyTitle> -->
    <xsl:template match="bodyTitle">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <!-- mots-clefs en début de section -->
    <xsl:template match="subsection_keyword_list">
        <list type="Keywords">
            <xsl:apply-templates select="text()"/>
        </list>
    </xsl:template>

    <xsl:template match="subsection_keyword_list/text()">
        <xsl:for-each select="tokenize(., ',')">
            <item>
                <term>
                    <xsl:value-of select="normalize-space(.)"/>
                </term>
            </item>
        </xsl:for-each>
    </xsl:template>


    <!-- Mappings simples pour remettre certains éléments dans le droit namespace -->

    <xsl:template match="hi | p | imprint | title | author | persName | date | publisher | term | label">
        <xsl:element name="{name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:if test="@hal_url">
                <xsl:attribute name="corresp" select="@hal_url"/>
            </xsl:if>
            <xsl:copy-of select="@* except (@noindent, @hal_url)"/>
            <xsl:if test="@noindent = 'true'">
                <xsl:attribute name="rend" select="'noindent'"/>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="ref">
        <ref type="{@xlink:type}" target="{@xlink:href}">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="descriptionlist">
        <list type="descriptionlist">
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="biblStruct">
        <biblStruct>
            <xsl:copy-of select="@* except @id"/>
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:apply-templates select="* except identifiant"/>
        </biblStruct>
    </xsl:template>

    <xsl:template match="analytic">
        <analytic>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:apply-templates select="preceding-sibling::identifiant"/>
        </analytic>
    </xsl:template>

    <xsl:template match="monogr">
        <monogr>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:if test="not(preceding-sibling::analytic)">
                <xsl:apply-templates select="preceding-sibling::identifiant"/>
            </xsl:if>
        </monogr>
    </xsl:template>

    <xsl:template match="identifiant">
        <idno>
            <xsl:copy-of select="@* except @value"/>
            <xsl:value-of select="@value"/>
        </idno>
    </xsl:template>

    <xsl:template match="formula">
        <xsl:element name="{name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="@* except @type"/>
            <xsl:attribute name="rend" select="@type"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- On gère les enfants de <person> -->
    <xsl:template match="person">
        <xsl:element name="{name()}" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="@*"/>
            <persName>
                <xsl:apply-templates select="firstname, lastname"/>
            </persName>
            <xsl:apply-templates select="* except (firstname, lastname)"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="initial">
        <forename type="initials">
            <xsl:apply-templates/>
        </forename>
    </xsl:template>

    <xsl:template match="firstname">
        <forename>
            <xsl:apply-templates/>
        </forename>
    </xsl:template>

    <xsl:template match="lastname | surname">
        <surname>
            <xsl:apply-templates/>
        </surname>
    </xsl:template>

    <xsl:template match="hdr">
        <education>
            <xsl:text>hdr</xsl:text>
        </education>
    </xsl:template>

    <xsl:template match="research-centre">
        <affiliation>
            <orgName type="research-center">
                <xsl:apply-templates/>
            </orgName>
        </affiliation>
    </xsl:template>

    <xsl:template match="moreinfo">
        <note type="moreinfo">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="categoryPro">
        <occupation>
            <xsl:apply-templates/>
        </occupation>
    </xsl:template>

    <xsl:template match="loc">
        <meeting>
            <placeName>
                <xsl:apply-templates/>
            </placeName>
        </meeting>
    </xsl:template>

    <xsl:template match="simplelist">
        <list type="simple">
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="orderedlist">
        <list type="ordered">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    
    <xsl:template match="li">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>

    <!-- Les éléments de la biblio... -->
    <xsl:template match="foreName">
        <forename>
            <xsl:apply-templates/>
        </forename>
    </xsl:template>

    <xsl:template match="biblScope">
        <biblScope unit="{@type}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>

    <!-- Figures -->

    <xsl:template match="object">
        <figure xml:id="{@id}">
            <xsl:copy-of select="@* except @id"/>
            <xsl:apply-templates select="table/tr/td/resource"/>
            <xsl:apply-templates select="caption"/>
        </figure>
    </xsl:template>

    <xsl:template match="caption">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <xsl:template match="resource">
        <graphic url="pullman.png"/>
    </xsl:template>

    <!-- les composantes d'une équipe -->

    <xsl:template match="identification/shortname">
        <orgName type="short">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>

    <xsl:template match="identification/projectName">
        <orgName type="full">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>

    <xsl:template match="identification/urlTeam">
        <ref type="urlTeam">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="identification/UR">
        <org type="UR">
            <orgName>
                <xsl:apply-templates/>
            </orgName>
        </org>
    </xsl:template>
    
    <xsl:template match="identification/LeTypeProjet"/>
    
    <xsl:template match="identification/theme-de-recherche">
        <term type="theme-de-recherche">
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    
    <xsl:template match="identification/domaine-de-recherche">
        <term type="domaine-de-recherche">
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    
    <xsl:template match="identification/header_dates_team">
        <date type="header_dates_team">
            <xsl:apply-templates/>
        </date>
    </xsl:template>
    

    
    

</xsl:stylesheet>
