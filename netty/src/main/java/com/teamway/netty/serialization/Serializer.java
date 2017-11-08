package com.teamway.netty.serialization;

import java.io.IOException;

/**
 * @author Ricky Fung
 */
public interface Serializer {

    byte[] encode(Object msg) throws IOException;

    <T> T decode(byte[] buf, Class<T> type) throws IOException;
}
