package com.teamway.netty.serialization.fst;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import org.nustaq.serialization.FSTConfiguration;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.teamway.netty.serialization.Serializer;

/**
 * https://github.com/RuedigerMoeller/fast-serialization/wiki/Serialization
 *
 */
public class FstSerializer implements Serializer {

    private static final LoadingCache<Class<?>, FSTConfiguration> configurationLoadingCache = CacheBuilder.newBuilder()
            .build(new CacheLoader<Class<?>, FSTConfiguration>() {
                public FSTConfiguration load(Class<?> cls) throws Exception {
                    return FSTConfiguration.createDefaultConfiguration();
                }
            });

    public byte[] encode(Object msg) throws IOException {
        return getFSTConfiguration(msg.getClass()).asByteArray(msg);
    }

    public <T> T decode(byte[] buf, Class<T> type) throws IOException {
        return (T) getFSTConfiguration(type).asObject(buf);
    }

    private static FSTConfiguration getFSTConfiguration(Class<?> clz) throws IOException {
        try {
            return configurationLoadingCache.get(clz);
        } catch (ExecutionException e) {
            throw new IOException("create FSTConfiguration error, class:"+clz);
        }
    }
}