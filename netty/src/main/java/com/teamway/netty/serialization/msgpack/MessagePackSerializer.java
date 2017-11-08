package com.teamway.netty.serialization.msgpack;

import java.io.IOException;

import org.msgpack.jackson.dataformat.MessagePackFactory;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamway.netty.serialization.Serializer;

/**
 * msgpack-java: https://github.com/msgpack/msgpack-java
 *
 */
public class MessagePackSerializer implements Serializer {

    private final ObjectMapper objectMapper = new ObjectMapper(new MessagePackFactory());;

    @Override
    public byte[] encode(Object msg) throws IOException {
        return objectMapper.writeValueAsBytes(msg);
    }

    @Override
    public <T> T decode(byte[] buf, Class<T> type) throws IOException {
        return objectMapper.readValue(buf, type);
    }
}
