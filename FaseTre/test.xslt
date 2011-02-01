<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

	<xsl:template match="/">

		<xsl:value-of select="play/title"/>
		<xsl:text>|</xsl:text>		
		
		<xsl:for-each select="play/personae/persona">
			<xsl:value-of select="normalize-space(./name)"/>
			<xsl:text>|</xsl:text>
			<xsl:value-of select="normalize-space(./alias)"/>
			<xsl:text>|</xsl:text>
		</xsl:for-each>
		
		<xsl:for-each select="play/act">
			<xsl:value-of select="normalize-space(./number)"/>
			<xsl:text>|</xsl:text>
			
			<xsl:for-each select="./scene">
				<xsl:value-of select="normalize-space(./title)"/>
				<xsl:text>|</xsl:text>
				
				<xsl:for-each select="./speeches">
					<xsl:value-of select="normalize-space(./stagedir)"/>
					<xsl:text>|</xsl:text>
					
					<xsl:for-each select="./speech">
						<xsl:value-of select="normalize-space(./text)"/>
						<xsl:text>|</xsl:text>
					</xsl:for-each>
					
				</xsl:for-each>
			
			</xsl:for-each>
			
		</xsl:for-each>	
	</xsl:template>
	
</xsl:stylesheet>