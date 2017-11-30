/**
 * Autogenerated by Thrift Compiler (0.10.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package shenzhen.teamway.tms9000;

@SuppressWarnings({"cast", "rawtypes", "serial", "unchecked", "unused"})
@javax.annotation.Generated(value = "Autogenerated by Thrift Compiler (0.10.0)", date = "2017-11-22")
public class AlarmModel implements org.apache.thrift.TBase<AlarmModel, AlarmModel._Fields>, java.io.Serializable, Cloneable, Comparable<AlarmModel> {
  private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("AlarmModel");

  private static final org.apache.thrift.protocol.TField LOG_INFO_FIELD_DESC = new org.apache.thrift.protocol.TField("logInfo", org.apache.thrift.protocol.TType.STRING, (short)1);
  private static final org.apache.thrift.protocol.TField LOG_TYPE_FIELD_DESC = new org.apache.thrift.protocol.TField("logType", org.apache.thrift.protocol.TType.I32, (short)2);
  private static final org.apache.thrift.protocol.TField LOG_TIME_FIELD_DESC = new org.apache.thrift.protocol.TField("logTime", org.apache.thrift.protocol.TType.STRING, (short)3);

  private static final org.apache.thrift.scheme.SchemeFactory STANDARD_SCHEME_FACTORY = new AlarmModelStandardSchemeFactory();
  private static final org.apache.thrift.scheme.SchemeFactory TUPLE_SCHEME_FACTORY = new AlarmModelTupleSchemeFactory();

  public java.lang.String logInfo; // required
  public int logType; // required
  public java.lang.String logTime; // required

  /** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
  public enum _Fields implements org.apache.thrift.TFieldIdEnum {
    LOG_INFO((short)1, "logInfo"),
    LOG_TYPE((short)2, "logType"),
    LOG_TIME((short)3, "logTime");

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
        case 1: // LOG_INFO
          return LOG_INFO;
        case 2: // LOG_TYPE
          return LOG_TYPE;
        case 3: // LOG_TIME
          return LOG_TIME;
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
  private static final int __LOGTYPE_ISSET_ID = 0;
  private byte __isset_bitfield = 0;
  public static final java.util.Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> metaDataMap;
  static {
    java.util.Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> tmpMap = new java.util.EnumMap<_Fields, org.apache.thrift.meta_data.FieldMetaData>(_Fields.class);
    tmpMap.put(_Fields.LOG_INFO, new org.apache.thrift.meta_data.FieldMetaData("logInfo", org.apache.thrift.TFieldRequirementType.REQUIRED, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.STRING)));
    tmpMap.put(_Fields.LOG_TYPE, new org.apache.thrift.meta_data.FieldMetaData("logType", org.apache.thrift.TFieldRequirementType.REQUIRED, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.I32)));
    tmpMap.put(_Fields.LOG_TIME, new org.apache.thrift.meta_data.FieldMetaData("logTime", org.apache.thrift.TFieldRequirementType.REQUIRED, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.STRING)));
    metaDataMap = java.util.Collections.unmodifiableMap(tmpMap);
    org.apache.thrift.meta_data.FieldMetaData.addStructMetaDataMap(AlarmModel.class, metaDataMap);
  }

  public AlarmModel() {
  }

  public AlarmModel(
    java.lang.String logInfo,
    int logType,
    java.lang.String logTime)
  {
    this();
    this.logInfo = logInfo;
    this.logType = logType;
    setLogTypeIsSet(true);
    this.logTime = logTime;
  }

  /**
   * Performs a deep copy on <i>other</i>.
   */
  public AlarmModel(AlarmModel other) {
    __isset_bitfield = other.__isset_bitfield;
    if (other.isSetLogInfo()) {
      this.logInfo = other.logInfo;
    }
    this.logType = other.logType;
    if (other.isSetLogTime()) {
      this.logTime = other.logTime;
    }
  }

  public AlarmModel deepCopy() {
    return new AlarmModel(this);
  }

  @Override
  public void clear() {
    this.logInfo = null;
    setLogTypeIsSet(false);
    this.logType = 0;
    this.logTime = null;
  }

  public java.lang.String getLogInfo() {
    return this.logInfo;
  }

  public AlarmModel setLogInfo(java.lang.String logInfo) {
    this.logInfo = logInfo;
    return this;
  }

  public void unsetLogInfo() {
    this.logInfo = null;
  }

  /** Returns true if field logInfo is set (has been assigned a value) and false otherwise */
  public boolean isSetLogInfo() {
    return this.logInfo != null;
  }

  public void setLogInfoIsSet(boolean value) {
    if (!value) {
      this.logInfo = null;
    }
  }

  public int getLogType() {
    return this.logType;
  }

  public AlarmModel setLogType(int logType) {
    this.logType = logType;
    setLogTypeIsSet(true);
    return this;
  }

  public void unsetLogType() {
    __isset_bitfield = org.apache.thrift.EncodingUtils.clearBit(__isset_bitfield, __LOGTYPE_ISSET_ID);
  }

  /** Returns true if field logType is set (has been assigned a value) and false otherwise */
  public boolean isSetLogType() {
    return org.apache.thrift.EncodingUtils.testBit(__isset_bitfield, __LOGTYPE_ISSET_ID);
  }

  public void setLogTypeIsSet(boolean value) {
    __isset_bitfield = org.apache.thrift.EncodingUtils.setBit(__isset_bitfield, __LOGTYPE_ISSET_ID, value);
  }

  public java.lang.String getLogTime() {
    return this.logTime;
  }

  public AlarmModel setLogTime(java.lang.String logTime) {
    this.logTime = logTime;
    return this;
  }

  public void unsetLogTime() {
    this.logTime = null;
  }

  /** Returns true if field logTime is set (has been assigned a value) and false otherwise */
  public boolean isSetLogTime() {
    return this.logTime != null;
  }

  public void setLogTimeIsSet(boolean value) {
    if (!value) {
      this.logTime = null;
    }
  }

  public void setFieldValue(_Fields field, java.lang.Object value) {
    switch (field) {
    case LOG_INFO:
      if (value == null) {
        unsetLogInfo();
      } else {
        setLogInfo((java.lang.String)value);
      }
      break;

    case LOG_TYPE:
      if (value == null) {
        unsetLogType();
      } else {
        setLogType((java.lang.Integer)value);
      }
      break;

    case LOG_TIME:
      if (value == null) {
        unsetLogTime();
      } else {
        setLogTime((java.lang.String)value);
      }
      break;

    }
  }

  public java.lang.Object getFieldValue(_Fields field) {
    switch (field) {
    case LOG_INFO:
      return getLogInfo();

    case LOG_TYPE:
      return getLogType();

    case LOG_TIME:
      return getLogTime();

    }
    throw new java.lang.IllegalStateException();
  }

  /** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
  public boolean isSet(_Fields field) {
    if (field == null) {
      throw new java.lang.IllegalArgumentException();
    }

    switch (field) {
    case LOG_INFO:
      return isSetLogInfo();
    case LOG_TYPE:
      return isSetLogType();
    case LOG_TIME:
      return isSetLogTime();
    }
    throw new java.lang.IllegalStateException();
  }

  @Override
  public boolean equals(java.lang.Object that) {
    if (that == null)
      return false;
    if (that instanceof AlarmModel)
      return this.equals((AlarmModel)that);
    return false;
  }

  public boolean equals(AlarmModel that) {
    if (that == null)
      return false;
    if (this == that)
      return true;

    boolean this_present_logInfo = true && this.isSetLogInfo();
    boolean that_present_logInfo = true && that.isSetLogInfo();
    if (this_present_logInfo || that_present_logInfo) {
      if (!(this_present_logInfo && that_present_logInfo))
        return false;
      if (!this.logInfo.equals(that.logInfo))
        return false;
    }

    boolean this_present_logType = true;
    boolean that_present_logType = true;
    if (this_present_logType || that_present_logType) {
      if (!(this_present_logType && that_present_logType))
        return false;
      if (this.logType != that.logType)
        return false;
    }

    boolean this_present_logTime = true && this.isSetLogTime();
    boolean that_present_logTime = true && that.isSetLogTime();
    if (this_present_logTime || that_present_logTime) {
      if (!(this_present_logTime && that_present_logTime))
        return false;
      if (!this.logTime.equals(that.logTime))
        return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    int hashCode = 1;

    hashCode = hashCode * 8191 + ((isSetLogInfo()) ? 131071 : 524287);
    if (isSetLogInfo())
      hashCode = hashCode * 8191 + logInfo.hashCode();

    hashCode = hashCode * 8191 + logType;

    hashCode = hashCode * 8191 + ((isSetLogTime()) ? 131071 : 524287);
    if (isSetLogTime())
      hashCode = hashCode * 8191 + logTime.hashCode();

    return hashCode;
  }

  @Override
  public int compareTo(AlarmModel other) {
    if (!getClass().equals(other.getClass())) {
      return getClass().getName().compareTo(other.getClass().getName());
    }

    int lastComparison = 0;

    lastComparison = java.lang.Boolean.valueOf(isSetLogInfo()).compareTo(other.isSetLogInfo());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetLogInfo()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.logInfo, other.logInfo);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = java.lang.Boolean.valueOf(isSetLogType()).compareTo(other.isSetLogType());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetLogType()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.logType, other.logType);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = java.lang.Boolean.valueOf(isSetLogTime()).compareTo(other.isSetLogTime());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetLogTime()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.logTime, other.logTime);
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
    java.lang.StringBuilder sb = new java.lang.StringBuilder("AlarmModel(");
    boolean first = true;

    sb.append("logInfo:");
    if (this.logInfo == null) {
      sb.append("null");
    } else {
      sb.append(this.logInfo);
    }
    first = false;
    if (!first) sb.append(", ");
    sb.append("logType:");
    sb.append(this.logType);
    first = false;
    if (!first) sb.append(", ");
    sb.append("logTime:");
    if (this.logTime == null) {
      sb.append("null");
    } else {
      sb.append(this.logTime);
    }
    first = false;
    sb.append(")");
    return sb.toString();
  }

  public void validate() throws org.apache.thrift.TException {
    // check for required fields
    if (logInfo == null) {
      throw new org.apache.thrift.protocol.TProtocolException("Required field 'logInfo' was not present! Struct: " + toString());
    }
    // alas, we cannot check 'logType' because it's a primitive and you chose the non-beans generator.
    if (logTime == null) {
      throw new org.apache.thrift.protocol.TProtocolException("Required field 'logTime' was not present! Struct: " + toString());
    }
    // check for sub-struct validity
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
      // it doesn't seem like you should have to do this, but java serialization is wacky, and doesn't call the default constructor.
      __isset_bitfield = 0;
      read(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(in)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private static class AlarmModelStandardSchemeFactory implements org.apache.thrift.scheme.SchemeFactory {
    public AlarmModelStandardScheme getScheme() {
      return new AlarmModelStandardScheme();
    }
  }

  private static class AlarmModelStandardScheme extends org.apache.thrift.scheme.StandardScheme<AlarmModel> {

    public void read(org.apache.thrift.protocol.TProtocol iprot, AlarmModel struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TField schemeField;
      iprot.readStructBegin();
      while (true)
      {
        schemeField = iprot.readFieldBegin();
        if (schemeField.type == org.apache.thrift.protocol.TType.STOP) { 
          break;
        }
        switch (schemeField.id) {
          case 1: // LOG_INFO
            if (schemeField.type == org.apache.thrift.protocol.TType.STRING) {
              struct.logInfo = iprot.readString();
              struct.setLogInfoIsSet(true);
            } else { 
              org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
            }
            break;
          case 2: // LOG_TYPE
            if (schemeField.type == org.apache.thrift.protocol.TType.I32) {
              struct.logType = iprot.readI32();
              struct.setLogTypeIsSet(true);
            } else { 
              org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
            }
            break;
          case 3: // LOG_TIME
            if (schemeField.type == org.apache.thrift.protocol.TType.STRING) {
              struct.logTime = iprot.readString();
              struct.setLogTimeIsSet(true);
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
      if (!struct.isSetLogType()) {
        throw new org.apache.thrift.protocol.TProtocolException("Required field 'logType' was not found in serialized data! Struct: " + toString());
      }
      struct.validate();
    }

    public void write(org.apache.thrift.protocol.TProtocol oprot, AlarmModel struct) throws org.apache.thrift.TException {
      struct.validate();

      oprot.writeStructBegin(STRUCT_DESC);
      if (struct.logInfo != null) {
        oprot.writeFieldBegin(LOG_INFO_FIELD_DESC);
        oprot.writeString(struct.logInfo);
        oprot.writeFieldEnd();
      }
      oprot.writeFieldBegin(LOG_TYPE_FIELD_DESC);
      oprot.writeI32(struct.logType);
      oprot.writeFieldEnd();
      if (struct.logTime != null) {
        oprot.writeFieldBegin(LOG_TIME_FIELD_DESC);
        oprot.writeString(struct.logTime);
        oprot.writeFieldEnd();
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

  }

  private static class AlarmModelTupleSchemeFactory implements org.apache.thrift.scheme.SchemeFactory {
    public AlarmModelTupleScheme getScheme() {
      return new AlarmModelTupleScheme();
    }
  }

  private static class AlarmModelTupleScheme extends org.apache.thrift.scheme.TupleScheme<AlarmModel> {

    @Override
    public void write(org.apache.thrift.protocol.TProtocol prot, AlarmModel struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TTupleProtocol oprot = (org.apache.thrift.protocol.TTupleProtocol) prot;
      oprot.writeString(struct.logInfo);
      oprot.writeI32(struct.logType);
      oprot.writeString(struct.logTime);
    }

    @Override
    public void read(org.apache.thrift.protocol.TProtocol prot, AlarmModel struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TTupleProtocol iprot = (org.apache.thrift.protocol.TTupleProtocol) prot;
      struct.logInfo = iprot.readString();
      struct.setLogInfoIsSet(true);
      struct.logType = iprot.readI32();
      struct.setLogTypeIsSet(true);
      struct.logTime = iprot.readString();
      struct.setLogTimeIsSet(true);
    }
  }

  private static <S extends org.apache.thrift.scheme.IScheme> S scheme(org.apache.thrift.protocol.TProtocol proto) {
    return (org.apache.thrift.scheme.StandardScheme.class.equals(proto.getScheme()) ? STANDARD_SCHEME_FACTORY : TUPLE_SCHEME_FACTORY).getScheme();
  }
}
