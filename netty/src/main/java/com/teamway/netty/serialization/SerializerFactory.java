package com.teamway.netty.serialization;

import com.teamway.netty.serialization.hessian.HessianSerializer;

/**
 * @author Ricky Fung
 */
public class SerializerFactory {

    public static Serializer getSerializer(){
        return new HessianSerializer();
    }
}
