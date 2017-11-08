package com.teamway.netty.serialization.jackson;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamway.netty.serialization.Serializer;

/**
 * @author Ricky Fung
 */
public class JacksonSerializer implements Serializer {

    private static final String CHARSET = "UTF-8";
    private final ObjectMapper objectMapper = new ObjectMapper();

    public byte[] encode(Object msg) throws IOException {
        String jsonString = objectMapper.writeValueAsString(msg);
        return jsonString.getBytes(CHARSET);
    }

    public <T> T decode(byte[] buf, Class<T> type) throws IOException {
        String jsonString =  new String(buf, CHARSET);
        return objectMapper.readValue(jsonString, type);
    }
}