package com.teamway.netty.serialization.hessian;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import com.caucho.hessian.io.Hessian2Input;
import com.caucho.hessian.io.Hessian2Output;
import com.teamway.netty.serialization.Serializer;

/**
 * ${DESCRIPTION}
 *
 * @author Ricky Fung
 */
public class HessianSerializer implements Serializer {

    public byte[] encode(Object msg) throws IOException {
        Hessian2Output out = null;
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            out = new Hessian2Output(bos);
            out.writeObject(msg);
            out.flush();
            return bos.toByteArray();
        } finally {
            if(out!=null){
                out.close();
            }
        }
    }

    public <T> T decode(byte[] buf, Class<T> type) throws IOException {
        Hessian2Input input = null;
        try {
            input = new Hessian2Input(new ByteArrayInputStream(buf));
            return (T) input.readObject(type);
        } finally {
            if(input!=null){
                input.close();
            }
        }
    }
}