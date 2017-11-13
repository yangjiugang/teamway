/**
 * Autogenerated by Thrift Compiler (0.10.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package org.apache.cassandra.thrift;

@SuppressWarnings({"cast", "rawtypes", "serial", "unchecked", "unused"})
/**
 * A Mutation is either an insert (represented by filling column_or_supercolumn) or a deletion (represented by filling the deletion attribute).
 * @param column_or_supercolumn. An insert to a column or supercolumn (possibly counter column or supercolumn)
 * @param deletion. A deletion of a column or supercolumn
 */
@javax.annotation.Generated(value = "Autogenerated by Thrift Compiler (0.10.0)", date = "2017-11-10")
public class Mutation implements org.apache.thrift.TBase<Mutation, Mutation._Fields>, java.io.Serializable, Cloneable, Comparable<Mutation> {
  private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("Mutation");

  private static final org.apache.thrift.protocol.TField COLUMN_OR_SUPERCOLUMN_FIELD_DESC = new org.apache.thrift.protocol.TField("column_or_supercolumn", org.apache.thrift.protocol.TType.STRUCT, (short)1);
  private static final org.apache.thrift.protocol.TField DELETION_FIELD_DESC = new org.apache.thrift.protocol.TField("deletion", org.apache.thrift.protocol.TType.STRUCT, (short)2);

  private static final org.apache.thrift.scheme.SchemeFactory STANDARD_SCHEME_FACTORY = new MutationStandardSchemeFactory();
  private static final org.apache.thrift.scheme.SchemeFactory TUPLE_SCHEME_FACTORY = new MutationTupleSchemeFactory();

  public ColumnOrSuperColumn column_or_supercolumn; // optional
  public Deletion deletion; // optional

  /** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
  public enum _Fields implements org.apache.thrift.TFieldIdEnum {
    COLUMN_OR_SUPERCOLUMN((short)1, "column_or_supercolumn"),
    DELETION((short)2, "deletion");

    private static final java.util.Map<java.lang.String, _Fields> byName = new java.util.HashMap<java.lang.String, _Fields>();

    static {
      for (_Fields field : java.util.EnumSet.allOf(_Fields.class)) {
        byName.put(field.getFieldName(), field);
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, or null if its not found.
     */
    public static _Fields findByThriftId(int fieldId) {
      switch(fieldId) {
        case 1: // COLUMN_OR_SUPERCOLUMN
          return COLUMN_OR_SUPERCOLUMN;
        case 2: // DELETION
          return DELETION;
        default:
          return null;
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, throwing an exception
     * if it is not found.
     */
    public static _Fields findByThriftIdOrThrow(int fieldId) {
      _Fields fields = findByThriftId(fieldId);
      if (fields == null) throw new java.lang.IllegalArgumentException("Field " + fieldId + " doesn't exist!");
      return fields;
    }

    /**
     * Find the _Fields constant that matches name, or null if its not found.
     */
    public static _Fields findByName(java.lang.String name) {
      return byName.get(name);
    }

    private final short _thriftId;
    private final java.lang.String _fieldName;

    _Fields(short thriftId, java.lang.String fieldName) {
      _thriftId = thriftId;
      _fieldName = fieldName;
    }

    public short getThriftFieldId() {
      return _thriftId;
    }

    public java.lang.String getFieldName() {
      return _fieldName;
    }
  }

  // isset id assignments
  private static final _Fields optionals[] = {_Fields.COLUMN_OR_SUPERCOLUMN,_Fields.DELETION};
  public static final java.util.Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> metaDataMap;
  static {
    java.util.Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> tmpMap = new java.util.EnumMap<_Fields, org.apache.thrift.meta_data.FieldMetaData>(_Fields.class);
    tmpMap.put(_Fields.COLUMN_OR_SUPERCOLUMN, new org.apache.thrift.meta_data.FieldMetaData("column_or_supercolumn", org.apache.thrift.TFieldRequirementType.OPTIONAL, 
        new org.apache.thrift.meta_data.StructMetaData(org.apache.thrift.protocol.TType.STRUCT, ColumnOrSuperColumn.class)));
    tmpMap.put(_Fields.DELETION, new org.apache.thrift.meta_data.FieldMetaData("deletion", org.apache.thrift.TFieldRequirementType.OPTIONAL, 
        new org.apache.thrift.meta_data.StructMetaData(org.apache.thrift.protocol.TType.STRUCT, Deletion.class)));
    metaDataMap = java.util.Collections.unmodifiableMap(tmpMap);
    org.apache.thrift.meta_data.FieldMetaData.addStructMetaDataMap(Mutation.class, metaDataMap);
  }

  public Mutation() {
  }

  /**
   * Performs a deep copy on <i>other</i>.
   */
  public Mutation(Mutation other) {
    if (other.isSetColumn_or_supercolumn()) {
      this.column_or_supercolumn = new ColumnOrSuperColumn(other.column_or_supercolumn);
    }
    if (other.isSetDeletion()) {
      this.deletion = new Deletion(other.deletion);
    }
  }

  public Mutation deepCopy() {
    return new Mutation(this);
  }

  @Override
  public void clear() {
    this.column_or_supercolumn = null;
    this.deletion = null;
  }

  public ColumnOrSuperColumn getColumn_or_supercolumn() {
    return this.column_or_supercolumn;
  }

  public Mutation setColumn_or_supercolumn(ColumnOrSuperColumn column_or_supercolumn) {
    this.column_or_supercolumn = column_or_supercolumn;
    return this;
  }

  public void unsetColumn_or_supercolumn() {
    this.column_or_supercolumn = null;
  }

  /** Returns true if field column_or_supercolumn is set (has been assigned a value) and false otherwise */
  public boolean isSetColumn_or_supercolumn() {
    return this.column_or_supercolumn != null;
  }

  public void setColumn_or_supercolumnIsSet(boolean value) {
    if (!value) {
      this.column_or_supercolumn = null;
    }
  }

  public Deletion getDeletion() {
    return this.deletion;
  }

  public Mutation setDeletion(Deletion deletion) {
    this.deletion = deletion;
    return this;
  }

  public void unsetDeletion() {
    this.deletion = null;
  }

  /** Returns true if field deletion is set (has been assigned a value) and false otherwise */
  public boolean isSetDeletion() {
    return this.deletion != null;
  }

  public void setDeletionIsSet(boolean value) {
    if (!value) {
      this.deletion = null;
    }
  }

  public void setFieldValue(_Fields field, java.lang.Object value) {
    switch (field) {
    case COLUMN_OR_SUPERCOLUMN:
      if (value == null) {
        unsetColumn_or_supercolumn();
      } else {
        setColumn_or_supercolumn((ColumnOrSuperColumn)value);
      }
      break;

    case DELETION:
      if (value == null) {
        unsetDeletion();
      } else {
        setDeletion((Deletion)value);
      }
      break;

    }
  }

  public java.lang.Object getFieldValue(_Fields field) {
    switch (field) {
    case COLUMN_OR_SUPERCOLUMN:
      return getColumn_or_supercolumn();

    case DELETION:
      return getDeletion();

    }
    throw new java.lang.IllegalStateException();
  }

  /** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
  public boolean isSet(_Fields field) {
    if (field == null) {
      throw new java.lang.IllegalArgumentException();
    }

    switch (field) {
    case COLUMN_OR_SUPERCOLUMN:
      return isSetColumn_or_supercolumn();
    case DELETION:
      return isSetDeletion();
    }
    throw new java.lang.IllegalStateException();
  }

  @Override
  public boolean equals(java.lang.Object that) {
    if (that == null)
      return false;
    if (that instanceof Mutation)
      return this.equals((Mutation)that);
    return false;
  }

  public boolean equals(Mutation that) {
    if (that == null)
      return false;
    if (this == that)
      return true;

    boolean this_present_column_or_supercolumn = true && this.isSetColumn_or_supercolumn();
    boolean that_present_column_or_supercolumn = true && that.isSetColumn_or_supercolumn();
    if (this_present_column_or_supercolumn || that_present_column_or_supercolumn) {
      if (!(this_present_column_or_supercolumn && that_present_column_or_supercolumn))
        return false;
      if (!this.column_or_supercolumn.equals(that.column_or_supercolumn))
        return false;
    }

    boolean this_present_deletion = true && this.isSetDeletion();
    boolean that_present_deletion = true && that.isSetDeletion();
    if (this_present_deletion || that_present_deletion) {
      if (!(this_present_deletion && that_present_deletion))
        return false;
      if (!this.deletion.equals(that.deletion))
        return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    int hashCode = 1;

    hashCode = hashCode * 8191 + ((isSetColumn_or_supercolumn()) ? 131071 : 524287);
    if (isSetColumn_or_supercolumn())
      hashCode = hashCode * 8191 + column_or_supercolumn.hashCode();

    hashCode = hashCode * 8191 + ((isSetDeletion()) ? 131071 : 524287);
    if (isSetDeletion())
      hashCode = hashCode * 8191 + deletion.hashCode();

    return hashCode;
  }

  @Override
  public int compareTo(Mutation other) {
    if (!getClass().equals(other.getClass())) {
      return getClass().getName().compareTo(other.getClass().getName());
    }

    int lastComparison = 0;

    lastComparison = java.lang.Boolean.valueOf(isSetColumn_or_supercolumn()).compareTo(other.isSetColumn_or_supercolumn());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetColumn_or_supercolumn()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.column_or_supercolumn, other.column_or_supercolumn);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = java.lang.Boolean.valueOf(isSetDeletion()).compareTo(other.isSetDeletion());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetDeletion()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.deletion, other.deletion);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    return 0;
  }

  public _Fields fieldForId(int fieldId) {
    return _Fields.findByThriftId(fieldId);
  }

  public void read(org.apache.thrift.protocol.TProtocol iprot) throws org.apache.thrift.TException {
    scheme(iprot).read(iprot, this);
  }

  public void write(org.apache.thrift.protocol.TProtocol oprot) throws org.apache.thrift.TException {
    scheme(oprot).write(oprot, this);
  }

  @Override
  public java.lang.String toString() {
    java.lang.StringBuilder sb = new java.lang.StringBuilder("Mutation(");
    boolean first = true;

    if (isSetColumn_or_supercolumn()) {
      sb.append("column_or_supercolumn:");
      if (this.column_or_supercolumn == null) {
        sb.append("null");
      } else {
        sb.append(this.column_or_supercolumn);
      }
      first = false;
    }
    if (isSetDeletion()) {
      if (!first) sb.append(", ");
      sb.append("deletion:");
      if (this.deletion == null) {
        sb.append("null");
      } else {
        sb.append(this.deletion);
      }
      first = false;
    }
    sb.append(")");
    return sb.toString();
  }

  public void validate() throws org.apache.thrift.TException {
    // check for required fields
    // check for sub-struct validity
    if (column_or_supercolumn != null) {
      column_or_supercolumn.validate();
    }
    if (deletion != null) {
      deletion.validate();
    }
  }

  private void writeObject(java.io.ObjectOutputStream out) throws java.io.IOException {
    try {
      write(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(out)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, java.lang.ClassNotFoundException {
    try {
      read(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(in)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private static class MutationStandardSchemeFactory implements org.apache.thrift.scheme.SchemeFactory {
    public MutationStandardScheme getScheme() {
      return new MutationStandardScheme();
    }
  }

  private static class MutationStandardScheme extends org.apache.thrift.scheme.StandardScheme<Mutation> {

    public void read(org.apache.thrift.protocol.TProtocol iprot, Mutation struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TField schemeField;
      iprot.readStructBegin();
      while (true)
      {
        schemeField = iprot.readFieldBegin();
        if (schemeField.type == org.apache.thrift.protocol.TType.STOP) { 
          break;
        }
        switch (schemeField.id) {
          case 1: // COLUMN_OR_SUPERCOLUMN
            if (schemeField.type == org.apache.thrift.protocol.TType.STRUCT) {
              struct.column_or_supercolumn = new ColumnOrSuperColumn();
              struct.column_or_supercolumn.read(iprot);
              struct.setColumn_or_supercolumnIsSet(true);
            } else { 
              org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
            }
            break;
          case 2: // DELETION
            if (schemeField.type == org.apache.thrift.protocol.TType.STRUCT) {
              struct.deletion = new Deletion();
              struct.deletion.read(iprot);
              struct.setDeletionIsSet(true);
            } else { 
              org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
            }
            break;
          default:
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
        }
        iprot.readFieldEnd();
      }
      iprot.readStructEnd();

      // check for required fields of primitive type, which can't be checked in the validate method
      struct.validate();
    }

    public void write(org.apache.thrift.protocol.TProtocol oprot, Mutation struct) throws org.apache.thrift.TException {
      struct.validate();

      oprot.writeStructBegin(STRUCT_DESC);
      if (struct.column_or_supercolumn != null) {
        if (struct.isSetColumn_or_supercolumn()) {
          oprot.writeFieldBegin(COLUMN_OR_SUPERCOLUMN_FIELD_DESC);
          struct.column_or_supercolumn.write(oprot);
          oprot.writeFieldEnd();
        }
      }
      if (struct.deletion != null) {
        if (struct.isSetDeletion()) {
          oprot.writeFieldBegin(DELETION_FIELD_DESC);
          struct.deletion.write(oprot);
          oprot.writeFieldEnd();
        }
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

  }

  private static class MutationTupleSchemeFactory implements org.apache.thrift.scheme.SchemeFactory {
    public MutationTupleScheme getScheme() {
      return new MutationTupleScheme();
    }
  }

  private static class MutationTupleScheme extends org.apache.thrift.scheme.TupleScheme<Mutation> {

    @Override
    public void write(org.apache.thrift.protocol.TProtocol prot, Mutation struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TTupleProtocol oprot = (org.apache.thrift.protocol.TTupleProtocol) prot;
      java.util.BitSet optionals = new java.util.BitSet();
      if (struct.isSetColumn_or_supercolumn()) {
        optionals.set(0);
      }
      if (struct.isSetDeletion()) {
        optionals.set(1);
      }
      oprot.writeBitSet(optionals, 2);
      if (struct.isSetColumn_or_supercolumn()) {
        struct.column_or_supercolumn.write(oprot);
      }
      if (struct.isSetDeletion()) {
        struct.deletion.write(oprot);
      }
    }

    @Override
    public void read(org.apache.thrift.protocol.TProtocol prot, Mutation struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TTupleProtocol iprot = (org.apache.thrift.protocol.TTupleProtocol) prot;
      java.util.BitSet incoming = iprot.readBitSet(2);
      if (incoming.get(0)) {
        struct.column_or_supercolumn = new ColumnOrSuperColumn();
        struct.column_or_supercolumn.read(iprot);
        struct.setColumn_or_supercolumnIsSet(true);
      }
      if (incoming.get(1)) {
        struct.deletion = new Deletion();
        struct.deletion.read(iprot);
        struct.setDeletionIsSet(true);
      }
    }
  }

  private static <S extends org.apache.thrift.scheme.IScheme> S scheme(org.apache.thrift.protocol.TProtocol proto) {
    return (org.apache.thrift.scheme.StandardScheme.class.equals(proto.getScheme()) ? STANDARD_SCHEME_FACTORY : TUPLE_SCHEME_FACTORY).getScheme();
  }
}
