package com.fc.flf.common.util;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileNotFoundException;

import javax.imageio.ImageIO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author 冯鹄
 *
 */
public class ChangePhotoSize {
    private static final Log log = LogFactory.getLog(ChangePhotoSize.class);
    public static String fileSeparator = System.getProperty("file.separator");
    

    public  void imageGet(String filePath, String outPutFile, 
            int width, int height, boolean replace) 
            throws Exception, FileNotFoundException {
        File inPutFile = new File(filePath);
        File outPut = new File(outPutFile);
        imageJudge(inPutFile, outPut, width, height, replace);
    }
    
    public  void imageJudge(File inPutFile, File outPutFile, 
            int width, int height, boolean replace) 
            throws Exception, FileNotFoundException {
        if (!inPutFile.isFile()) {
            log.error("文件不存在:" + inPutFile);
            throw new FileNotFoundException("文件不存在:" + inPutFile);
        }
        if (!outPutFile.exists() || replace) {
        	changeImageSize(inPutFile, outPutFile, height, width);
        }
    }
    
    /**
     * 按指定大小缩放图片
     * @param inPutFile
     * @param outPutFile
     * @param height
     * @param width
     * @throws Exception
     */
    public  void changeImageSize(File inPutFile, File outPutFile, 
            int width, int height) throws Exception {
        System.out.println("进入方法");
        BufferedImage source = ImageIO.read(inPutFile);
        if (source == null) {
            return;
        }
        double hx = (double)height / source.getHeight();
        double wy = (double)width / source.getWidth();
        if (hx < wy) {
            wy = hx;
            width = (int)(source.getWidth() * wy);
        } else {
            hx = wy;
            height = (int)(source.getHeight() * hx);
        }
        
        int type = source.getType();
        BufferedImage target = null;
        if (type == BufferedImage.TYPE_CUSTOM) { // handmade
            ColorModel cm = source.getColorModel();
            WritableRaster raster = 
                cm.createCompatibleWritableRaster(width, height);
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);
        } else {
            target = new BufferedImage(width, height, type);
        }
        Graphics2D g = target.createGraphics();
        // smoother than exlax:
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BICUBIC);

        g.drawRenderedImage(source, AffineTransform.getScaleInstance(wy, hx));
        g.dispose();

        try {
            ImageIO.write(target, "JPEG", outPutFile);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
