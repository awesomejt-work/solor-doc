<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:fo="http://www.w3.org/1999/XSL/Format"
     xmlns:d="http://docbook.org/ns/docbook">
  <!-- imports the original docbook stylesheet -->
  <xsl:import href="../docbook-xsl-ns-1.79.1/fo/docbook.xsl"/>
  
  <!-- Import the settings common to both PDF and HTML -->
  <xsl:import href="../common/docbook-common.xsl"/>
  
  <!-- set below all your custom PDF changes -->

  <!--
    Important links:
    - http://www.sagehill.net/docbookxsl/
    - http://docbkx-tools.sourceforge.net/
  -->
  
  <xsl:output indent="no"/>

<!--==============================================================-->
<!--  Parameter settings                                          -->
<!--==============================================================-->
<!-- start chapters on odd page -->
<xsl:param name="double.sided" select="0"/>
<xsl:param name="force.blank.pages" select="0"/>
<xsl:param name="page.margin.inner">1in</xsl:param>
<xsl:param name="page.margin.outer">1in</xsl:param>
<xsl:param name="symbol.font.family" select="'Symbol,ZapfDingbats,Lucida Sans Unicode'"/>
  
<!--==============================================================-->
<!--  Attribute sets                                              -->
<!--==============================================================-->
  <xsl:attribute-set name="xref.properties">
      <xsl:attribute name="text-decoration">underline</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- Turn off table hyphenation -->
  <xsl:attribute-set name="table.table.properties">
    <xsl:attribute name="hyphenate">false</xsl:attribute>
  </xsl:attribute-set>

  <!-- <xsl:attribute-set name="root.properties">
    <xsl:attribute name="hyphenate">false</xsl:attribute>
  </xsl:attribute-set> -->



<!--==============================================================-->
<!--  Template customizations                                     -->
<!--==============================================================-->

<xsl:template name="user.pagemasters">
  
   <!-- body pages -->
    <fo:simple-page-master master-name="landscape-first"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
  <xsl:if test="$fop.extensions != 0">
    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
  <xsl:if test="$fop.extensions != 0">
    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-first</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      reference-orientation="90"
                      column-gap="{$column.gap.body}"
                      column-count="{$column.count.body}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$body.margin.inner"/>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$body.margin.outer"/>
        </xsl:attribute>
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-first"
                        extent="{$region.before.extent}"
                        precedence="{$region.before.precedence}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-first"
                       extent="{$region.after.extent}"
                        precedence="{$region.after.precedence}"
                       display-align="after"/>
      <xsl:call-template name="region.inner">
        <xsl:with-param name="sequence">first</xsl:with-param>
        <xsl:with-param name="pageclass">body</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="region.outer">
        <xsl:with-param name="sequence">first</xsl:with-param>
        <xsl:with-param name="pageclass">body</xsl:with-param>
      </xsl:call-template>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="landscape-odd"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.inner"/>
  <xsl:if test="$fop.extensions != 0">
    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.outer"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-odd</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      reference-orientation="90"
                      column-gap="{$column.gap.body}"
                      column-count="{$column.count.body}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$body.margin.inner"/>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$body.margin.outer"/>
        </xsl:attribute>
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-odd"
                        extent="{$region.before.extent}"
                        precedence="{$region.before.precedence}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-odd"
                       extent="{$region.after.extent}"
                       precedence="{$region.after.precedence}"
                       display-align="after"/>
      <xsl:call-template name="region.inner">
        <xsl:with-param name="pageclass">body</xsl:with-param>
        <xsl:with-param name="sequence">odd</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="region.outer">
        <xsl:with-param name="pageclass">body</xsl:with-param>
        <xsl:with-param name="sequence">odd</xsl:with-param>
      </xsl:call-template>
    </fo:simple-page-master>

    <fo:simple-page-master master-name="landscape-even"
                           page-width="{$page.width}"
                           page-height="{$page.height}"
                           margin-top="{$page.margin.top}"
                           margin-bottom="{$page.margin.bottom}">
      <xsl:attribute name="margin-{$direction.align.start}">
        <xsl:value-of select="$page.margin.outer"/>
  <xsl:if test="$fop.extensions != 0">
    <xsl:value-of select="concat(' - (',$title.margin.left,')')"/>
        </xsl:if>
      </xsl:attribute>
      <xsl:attribute name="margin-{$direction.align.end}">
        <xsl:value-of select="$page.margin.inner"/>
      </xsl:attribute>
      <xsl:if test="$axf.extensions != 0">
        <xsl:call-template name="axf-page-master-properties">
          <xsl:with-param name="page.master">body-even</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <fo:region-body margin-bottom="{$body.margin.bottom}"
                      margin-top="{$body.margin.top}"
                      reference-orientation="90"
                      column-gap="{$column.gap.body}"
                      column-count="{$column.count.body}">
        <xsl:attribute name="margin-{$direction.align.start}">
          <xsl:value-of select="$body.margin.outer"/>
        </xsl:attribute>
        <xsl:attribute name="margin-{$direction.align.end}">
          <xsl:value-of select="$body.margin.inner"/>
        </xsl:attribute>
      </fo:region-body>
      <fo:region-before region-name="xsl-region-before-even"
                        extent="{$region.before.extent}"
                        precedence="{$region.before.precedence}"
                        display-align="before"/>
      <fo:region-after region-name="xsl-region-after-even"
                       extent="{$region.after.extent}"
                       precedence="{$region.after.precedence}"
                       display-align="after"/>
      <xsl:call-template name="region.outer">
        <xsl:with-param name="pageclass">body</xsl:with-param>
        <xsl:with-param name="sequence">even</xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="region.inner">
        <xsl:with-param name="pageclass">body</xsl:with-param>
        <xsl:with-param name="sequence">even</xsl:with-param>
      </xsl:call-template>
    </fo:simple-page-master>

    <!-- setup for body pages -->
    <fo:page-sequence-master master-name="landscape">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="blank"
                                              blank-or-not-blank="blank"/>
        <xsl:if test="$force.blank.pages != 0">
          <fo:conditional-page-master-reference master-reference="landscape-first"
                                                page-position="first"/>
        </xsl:if>
        <fo:conditional-page-master-reference master-reference="landscape-odd"
                                              odd-or-even="odd"/>
        <fo:conditional-page-master-reference 
                                              odd-or-even="even">
          <xsl:attribute name="master-reference">
            <xsl:choose>
              <xsl:when test="$double.sided != 0">landscape-even</xsl:when>
              <xsl:otherwise>body-odd</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </fo:conditional-page-master-reference>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>


</xsl:template>

  <xsl:template match="d:guibutton">
    <fo:inline border="1px outset #dddddd" background-color="#dddddd">
      <xsl:call-template name="inline.charseq"/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="d:guilabel">
    <fo:inline font-style="italic" font-weight="bold">
      <xsl:call-template name="inline.charseq"/>
    </fo:inline>
  </xsl:template>
  
  <xsl:attribute-set name="table.properties">
    <xsl:attribute name="background-color">
      <xsl:choose>
        <xsl:when test="@tabstyle='shaded'">#EEEEEE</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:attribute-set>

  <xsl:template name="object.id">
    <xsl:param name="object" select="."/>

    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="xid" select="@xml:id"/>

    <xsl:variable name="preceding.id"
                  select="count(preceding::*[@id = $id])"/>

    <xsl:variable name="preceding.xid"
                  select="count(preceding::*[@xml:id = $xid])"/>

    <xsl:choose>
      <xsl:when test="$object/@id and $preceding.id != 0">
        <xsl:value-of select="concat($object/@id, $preceding.id)"/>
      </xsl:when>
      <xsl:when test="$object/@id">
        <xsl:value-of select="$object/@id"/>
      </xsl:when>
      <xsl:when test="$object/@xml:id and $preceding.xid != 0">
        <xsl:value-of select="concat($object/@xml:id, $preceding.xid)"/>
      </xsl:when>
      <xsl:when test="$object/@xml:id">
        <xsl:value-of select="$object/@xml:id"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="generate-id($object)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- PI to cause a line break
  usage: <?hard-linebreak?>, <?line-break?> or <?lb?>  -->
  <xsl:template match="processing-instruction('lb')">
    <fo:block />
  </xsl:template>

  <xsl:template match="processing-instruction('line-break')">
    <fo:block />
  </xsl:template>

  <xsl:template match="processing-instruction('hard-linebreak')">
    <fo:block break-before='page' />
  </xsl:template>
  
  <!-- Add support for new elements, based on "example" template -->
<xsl:template match="d:requirement | d:editorial-rule" >
  <xsl:variable name="param.placement"
             select="substring-after(normalize-space($formal.title.placement),
                                     concat(local-name(.), ' '))"/>

  <xsl:variable name="placement">
    <xsl:choose>
      <xsl:when test="contains($param.placement, ' ')">
        <xsl:value-of select="substring-before($param.placement, ' ')"/>
      </xsl:when>
      <xsl:when test="$param.placement = ''">before</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param.placement"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- Example doesn't have a pgwide attribute, so may use a PI -->
  <xsl:variable name="pgwide.pi">
    <xsl:call-template name="pi.dbfo_pgwide"/>
  </xsl:variable>

  <xsl:variable name="pgwide">
    <xsl:choose>
      <xsl:when test="$pgwide.pi">
        <xsl:value-of select="$pgwide.pi"/>
      </xsl:when>
      <!-- child element may set pgwide -->
      <xsl:when test="*[@pgwide]">
        <xsl:value-of select="*[@pgwide][1]/@pgwide"/>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <!-- Get align value from internal mediaobject -->
  <xsl:variable name="align">
    <xsl:if test="d:mediaobject|d:mediaobjectco">
      <xsl:variable name="olist" select="d:mediaobject/d:imageobject
                     |d:mediaobjectco/d:imageobjectco
                     |d:mediaobject/d:videoobject
                     |d:mediaobject/d:audioobject
                     |d:mediaobject/d:textobject"/>

      <xsl:variable name="object.index">
        <xsl:call-template name="select.mediaobject.index">
          <xsl:with-param name="olist" select="$olist"/>
          <xsl:with-param name="count" select="1"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="object" select="$olist[position() = $object.index]"/>

      <xsl:value-of select="$object/descendant::d:imagedata[@align][1]/@align"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="example">
    <xsl:choose>
      <xsl:when test="$pgwide = '1'">
        <fo:block xsl:use-attribute-sets="pgwide.properties">
          <xsl:if test="$align != ''">
            <xsl:attribute name="text-align">
              <xsl:value-of select="$align"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="formal.object">
            <xsl:with-param name="placement" select="$placement"/>
          </xsl:call-template>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block>
          <xsl:if test="$align != ''">
            <xsl:attribute name="text-align">
              <xsl:value-of select="$align"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="formal.object">
            <xsl:with-param name="placement" select="$placement"/>
          </xsl:call-template>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="floatstyle">
    <xsl:call-template name="floatstyle"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$floatstyle != ''">
      <xsl:call-template name="floater">
        <xsl:with-param name="position" select="$floatstyle"/>
        <xsl:with-param name="content" select="$example"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$example"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!-- add new elements to front Lists of -->
<!-- You can rearrange the order of the lists here -->
<xsl:template name="make.book.tocs">

  <xsl:variable name="lot-master-reference">
    <xsl:call-template name="select.pagemaster">
      <xsl:with-param name="pageclass" select="'lot'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="toc.params">
    <xsl:call-template name="find.path.params">
      <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="contains($toc.params, 'toc')">
    <xsl:call-template name="page.sequence">
      <xsl:with-param name="master-reference"
                      select="$lot-master-reference"/>
      <xsl:with-param name="element" select="'toc'"/>
      <xsl:with-param name="gentext-key" select="'TableofContents'"/>
      <xsl:with-param name="content">
        <xsl:call-template name="division.toc">
          <xsl:with-param name="toc.title.p" 
                          select="contains($toc.params, 'title')"/>
        </xsl:call-template>

        <xsl:if test="contains($toc.params,'figure') and .//d:figure">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'figure'"/>
            <xsl:with-param name="nodes" select=".//d:figure"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'table') and .//d:table">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'table'"/>
            <xsl:with-param name="nodes" select=".//d:table[not(@tocentry = 0)]"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'example') and .//d:example">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'example'"/>
            <xsl:with-param name="nodes" select=".//d:example"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'requirement') and .//d:requirement">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'requirement'"/>
            <xsl:with-param name="nodes" select=".//d:requirement"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'editorial-rule') and .//d:editorial-rule">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'editorial-rule'"/>
            <xsl:with-param name="nodes" select=".//d:editorial-rule"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'equation') and 
                 .//d:equation[d:title or d:info/d:title]">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'equation'"/>
            <xsl:with-param name="nodes" 
                            select=".//d:equation[d:title or d:info/d:title]"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'procedure') and 
                 .//d:procedure[d:title or d:info/d:title]">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'procedure'"/>
            <xsl:with-param name="nodes" 
                            select=".//d:procedure[d:title or d:info/d:title]"/>
          </xsl:call-template>
        </xsl:if>

      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>

</xsl:template>

<xsl:template name="list.of.titles">
  <xsl:param name="titles" select="'table'"/>
  <xsl:param name="nodes" select=".//d:table"/>
  <xsl:param name="toc-context" select="."/>

  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:if test="$nodes">
    <fo:block id="lot...{$titles}...{$id}"
        xsl:use-attribute-sets="toc.margin.properties">
      <xsl:choose>
        <xsl:when test="$titles='table'">
          <xsl:call-template name="list.of.tables.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='figure'">
          <xsl:call-template name="list.of.figures.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='equation'">
          <xsl:call-template name="list.of.equations.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='requirement'">
          <xsl:call-template name="list.of.requirements.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='editorial-rule'">
          <xsl:call-template name="list.of.editorial-rules.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='example'">
          <xsl:call-template name="list.of.examples.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='procedure'">
          <xsl:call-template name="list.of.procedures.titlepage"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.unknowns.titlepage"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="$nodes" mode="toc">
        <xsl:with-param name="toc-context" select="$toc-context"/>
      </xsl:apply-templates>
    </fo:block>
  </xsl:if>
</xsl:template>

<xsl:template match="d:requirement|d:editorial-rule" mode="toc">
  <xsl:param name="toc-context" select="."/>
  <xsl:call-template name="toc.line">
    <xsl:with-param name="toc-context" select="$toc-context"/>
  </xsl:call-template>
</xsl:template>

<!-- These styles for the title are copied from fo/titlepage.templates.xsl -->
<xsl:template name="list.of.requirements.titlepage">
  <fo:block xsl:use-attribute-sets="list.of.examples.titlepage.recto.style" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" start-indent="0pt" font-size="17.28pt" font-weight="bold" font-family="{$title.fontset}">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'ListofRequirements'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template name="list.of.editorial-rules.titlepage">
  <fo:block xsl:use-attribute-sets="list.of.examples.titlepage.recto.style" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" start-indent="0pt" font-size="17.28pt" font-weight="bold" font-family="{$title.fontset}">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'ListofEditorialRules'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>
  
<!-- Modified table and figure label format -->
  <xsl:attribute-set name="formal.title.properties">
    <!--
    <xsl:attribute name="color">#696969</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    -->
   <!--   if needed add this conditional blcok for table/figure -->
    <xsl:attribute name="font-size"> 
    <xsl:choose>
        <xsl:when test="self::d:table">10pt</xsl:when>
        <xsl:when test="self::d:figure">10pt</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
      </xsl:attribute>
    <xsl:attribute name="color"> 
      <xsl:choose>
        <xsl:when test="self::d:table">#696969</xsl:when>
        <xsl:when test="self::d:figure">#696969</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="text-align"> 
      <xsl:choose>
        <xsl:when test="self::d:table">center</xsl:when>
        <xsl:when test="self::d:figure">center</xsl:when>
        <xsl:otherwise>inherit</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="font-family">Helvetica
      <!--<xsl:choose>-->
        <!--<xsl:when test="self::d:table">Helvetica</xsl:when>-->
        <!--<xsl:when test="self::d:figure">Helvetica</xsl:when>-->
      <!--</xsl:choose>-->
    </xsl:attribute>
  </xsl:attribute-set>

<!-- These titles are handled by formal.object.heading template,
so these templates do nothing-->
<xsl:template match="d:requirement/d:title"/>
<xsl:template match="d:editorial-rule/d:title"/>

<!-- Border for media object/figure -->
  <!-- Border added for media object/figure -->
    <xsl:template match="d:mediaobject">
    <fo:block border="0.5pt solid gray">
      <xsl:apply-imports/>
    </fo:block>   
    <!-- to add the figure border selectively, uncomment:
    <xsl:choose>
      <xsl:when test="@role = 'bordered'">
        <fo:block border="0.5pt solid gray">
          <xsl:apply-imports/>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-imports/>
      </xsl:otherwise>
    </xsl:choose>
     -->
  </xsl:template>

<!-- You can customize the header content with this template -->
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

<!--
  <fo:block>
    <xsl:value-of select="$pageclass"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$sequence"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$position"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$gentext-key"/>
  </fo:block>
-->

  <fo:block>

    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$sequence = 'blank'">
        <!-- nothing -->
      </xsl:when>

      <!--<xsl:when test="$position='left'">-->
        <!--&lt;!&ndash; Same for odd, even, empty, and blank sequences &ndash;&gt;-->
        <!--<xsl:call-template name="draft.text"/>-->
      <!--</xsl:when>-->

      <xsl:when test="($sequence='odd' or $sequence='even') and $position='center'">
        <xsl:if test="$pageclass != 'titlepage'">
          <xsl:apply-templates select="." mode="titleabbrev.markup"/>
        </xsl:if>
      </xsl:when>

      <!--<xsl:when test="$position='right'">-->
        <!--&lt;!&ndash; Same for odd, even, empty, and blank sequences &ndash;&gt;-->
        <!--<xsl:call-template name="draft.text"/>-->
      <!--</xsl:when>-->

      <xsl:when test="$sequence = 'first'">
        <!-- nothing for first pages -->
      </xsl:when>

      <xsl:when test="$sequence = 'blank'">
        <!-- nothing for blank pages -->
      </xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- you can customize the footer content with this template -->
<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

<!--
  <fo:block>
    <xsl:value-of select="$pageclass"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$sequence"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$position"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$gentext-key"/>
  </fo:block>
-->

  <fo:block>
    <!-- pageclass can be front, body, back -->
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'">
        <!-- nop; no footer on title pages -->
      </xsl:when>

      <!--<xsl:when test="$position='center'">-->
        <!--<fo:page-number/>-->
      <!--</xsl:when>-->
      <xsl:when test="$position='left'">
        <fo:block>Page <fo:page-number/></fo:block>
        <fo:block>2021 Logica Health, Health Level Seven International,  all rights reserved.</fo:block>
      </xsl:when>
      <xsl:when test="$position='right'">
        <fo:block>HL7 Standardized Terminology Knowledgebase, Release 1</fo:block>
      </xsl:when>
      <xsl:otherwise>
        <!-- nop -->
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

<xsl:template name="set.flow.properties">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>
  <xsl:attribute name="hyphenate">false</xsl:attribute>

  <!-- <xsl:choose>
    <xsl:when test="starts-with($master-reference, 'index') or
                    starts-with($master-reference, 'titlepage') or
                    starts-with($master-reference, 'lot') or  
                    starts-with($master-reference, 'front')">
      <xsl:attribute name="hyphenate">false</xsl:attribute>
    </xsl:when>
    <xsl:otherwise>
      <xsl:attribute name="hyphenate">
        <xsl:value-of select="$hyphenate"/>
      </xsl:attribute>
    </xsl:otherwise>
  </xsl:choose>
  ...

  -->

</xsl:template>

</xsl:stylesheet>
