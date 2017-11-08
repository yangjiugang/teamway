package com.teamway.netty.serialization.fastjson;

import java.io.IOException;

import com.alibaba.fastjson.JSON;
import com.teamway.netty.serialization.Serializer;

/**
 *
 */
public class FastjsonSerializer implements Serializer {

    private static final String CHARSET = "UTF-8";

    @Override
    public byte[] encode(Object msg) throws IOException {
        String jsonString = JSON.toJSONString(msg);
        return jsonString.getBytes(CHARSET);
    }

    @Override
    public <T> T decode(byte[] buf, Class<T> type) throws IOException {
        String jsonString = new String(buf, CHARSET);
        return JSON.parseObject(jsonString, type);
    }
}