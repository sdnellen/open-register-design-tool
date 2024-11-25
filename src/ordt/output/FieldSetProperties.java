/*
 * Copyright (c) 2016 Juniper Networks, Inc. All rights reserved. 
 */
package ordt.output;

import ordt.extract.DefinedProperties;
import ordt.extract.PropertyList;
import ordt.extract.model.ModComponent;
import ordt.extract.model.ModIndexedInstance;
import ordt.extract.model.ModInstance;

/** class of properties needed for display of active signal instance */
public class FieldSetProperties extends InstanceProperties {
	private Integer fieldSetWidth = 0;   // default to empty fieldset        
	private Integer offset = null;   // no specific index set
	private String fieldSetPrefixString = ""; // fieldset prefix string for fields/enums in this fieldset 

	/** init properties using defaults -> component -> instance values */
	public FieldSetProperties(ModInstance fieldSetInst) {	
		super(fieldSetInst);  // init instance, id
	}
	
	public FieldSetProperties(FieldSetProperties oldInstance) {
		super(oldInstance);
	}
	
	/** display info  */
    @Override
	public void display() {
		super.display();
		System.out.println("  FieldSetProperty info:" );  
		System.out.println("   fieldset width=" + this.getFieldSetWidth());  		
		System.out.println("   fieldset offset=" + this.getOffset());  		
		System.out.println("   fieldset prefix=" + this.getFieldSetPrefixString());  		
	}
	
	/** extract properties from the calling instance */
    @Override
	public void extractProperties(PropertyList pList) {
		super.extractProperties(pList);  // extract common parameters
		//Jrdl.infoMessage("FieldSetProperties: id=" + getId() + ", pList=" + pList);
		// go directly to extractInstance to get fieldset width/indices
		setFieldSetWidth(getExtractInstance());  // set width of fieldset
    }	
    
	/** extract a PropertyList of user defined parameters for this instance */
    @Override
	protected void extractSpecialPropertyLists(PropertyList pList) {
		setUserDefinedProperties(pList, DefinedProperties.userDefFieldSetPropertyNames);
		setJsPassthruProperties(pList, DefinedProperties.jsPassthruFieldSetPropertyNames);
	}

	/** get extractInstance
	 *  @return the extractInstance
	 */
	@Override
	public ModIndexedInstance getExtractInstance() {
		return (ModIndexedInstance) extractInstance;
	}

	// -------------------------- fieldset width/index methods ------------------------------

	/** get fieldSetWidth
	 *  @return the fieldSetWidth
	 */
	public Integer getFieldSetWidth() {
		return fieldSetWidth;
	}

	/** set fieldSetWidth from inst/comp properties
	 *  @param instance
	 */
	public void setFieldSetWidth(ModIndexedInstance fsetInst) {
		ModComponent fsetComp = fsetInst.getRegComp();  // get the component of this instance
		// otherwise look for width set in instance 
		//if ((fsetInst.getWidth() != null) && (fsetInst.getWidth() > 0))   
		//	this.fieldSetWidth = fsetInst.getWidth(); 
		// if instance prop is set then use it
		if (fsetInst.hasProperty("fieldstructwidth")) 
			this.fieldSetWidth = fsetInst.getIntegerProperty("fieldstructwidth"); 
		// otherwise look for a fieldstructwidth set in component
		else if ((fsetComp != null) && (fsetComp.hasProperty("fieldstructwidth"))) {
			this.fieldSetWidth = fsetComp.getIntegerProperty("fieldstructwidth");
		}
		//System.out.println("FieldSetProperties setFieldSetWidth: " + fsetInst.getId() + ", fieldSetWidth=" + fieldSetWidth);
	}

	/** get relative bit offset of this fieldset in parent
	 */
	public Integer getOffset() {
		return offset;
	}
	
	/** set relative bit offset of this fieldset in parent
	 */
	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	/** get fieldSetPrefixString
	 *  @return the fieldSetPrefixString
	 */
	public String getFieldSetPrefixString() {
		return fieldSetPrefixString;
	}

	/** set fieldSetPrefixString
	 *  @param fieldSetPrefixString the fieldSetPrefixString to set
	 */
	public void setFieldSetPrefixString(String fieldSetPrefixString) {
		this.fieldSetPrefixString = fieldSetPrefixString;
	}


	/** hashcode/equals overrides 
	 * - ignores rhsReferences in compare
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((fieldSetWidth == null) ? 0 : fieldSetWidth.hashCode());
		result = prime * result + ((offset == null) ? 0 : offset.hashCode());
		result = prime * result + ((fieldSetPrefixString == null) ? 0 : fieldSetPrefixString.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		FieldSetProperties other = (FieldSetProperties) obj;
		if (fieldSetWidth == null) {
			if (other.fieldSetWidth != null)
				return false;
		} else if (!fieldSetWidth.equals(other.fieldSetWidth))
			return false;
		if (offset == null) {
			if (other.offset != null)
				return false;
		} else if (!offset.equals(other.offset))
			return false;
		if (fieldSetPrefixString == null) {
			if (other.fieldSetPrefixString != null)
				return false;
		} else if (!fieldSetPrefixString.equals(other.fieldSetPrefixString))
			return false;
		return true;
	}


}
