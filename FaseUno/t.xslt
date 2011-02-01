<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/">
		
		<!-- RICOPIARE LE PARTI PRINCIPALI DAL FILE XML INTERMEDIO -->
		<play>
					
			<title>
				<xsl:value-of select="play/title"/>
			</title>
			
			<personae>
			
				<xsl:for-each select="play/personae/persona">
				<persona>
						<name>
							<xsl:value-of select="./name"/>
						</name>
						<alias>
							<xsl:value-of select="./alias"/>
						</alias>										
				</persona>
				</xsl:for-each>	
							
			</personae>
			
			<xsl:for-each select="play/act">
			<act>
				<number><xsl:value-of select="./number"/></number>
				
				<xsl:for-each select="./scene">
					<scene>
						<title> <xsl:value-of select="./title"/></title>
						
						<!-- INVOCAZIONE DEL TEMPLATE PER LA RIDIVISIONE DEGLI SPEECH E STAGEDIR -->						
						<xsl:apply-templates select="speech/stagedir"/>
																							
					</scene>
				</xsl:for-each>
				
			</act>
			</xsl:for-each>
			
		</play>
	</xsl:template>
	
	<!-- TEMPLATE RIDIVISIONE IN SPEECHES -->
	
	<xsl:template match="speech/stagedir">
		<xsl:param name="nomestage">
			<xsl:value-of select="text()" />
		</xsl:param>
		
		<xsl:param name="sname">
			<xsl:value-of select="following-sibling::sceneN[text()]"/>
		</xsl:param>
		
		<xsl:if test="count(preceding::stagedir[text()=$nomestage]) &lt; 1">
		
			<speeches>
				<stagedir>  
					<xsl:value-of select="text()"/>
				</stagedir>
				<xsl:call-template name="trova">
   					<xsl:with-param name="stage" select="$nomestage"/>
   					<xsl:with-param name="scN" select="$sname"/>
				</xsl:call-template>
	       	</speeches>
		</xsl:if>
	</xsl:template>
	
	<!--  TROVA GLI SPEECH ASSOCIATI A QUELLO STAGEDIR E LI METTE SOTTO L'APPROPRIATO SPEECHES -->
	<xsl:template name="trova">
		<xsl:param name="stage"/>
		<xsl:param name="scN"/>
		<xsl:for-each select="//speech"> 
		
		<!-- controlla se lo stagedir e la scena passate come riferimento siano le stesse di quelle dello speech che è sotto controllo -->
			<xsl:if test="stagedir[text()=$stage]">
			<xsl:if test="sceneN[text()=$scN]">
			<speech>	 
				<persona>
					<xsl:value-of select="./persona"/>
				</persona>
				<text>
					<xsl:value-of select="./text"/>
				</text>
			</speech>
			</xsl:if>
			</xsl:if>
         	
         </xsl:for-each>        	
    </xsl:template>
		
</xsl:stylesheet>



