package org.nv.dom.util;

import net.sf.cglib.beans.BeanCopier;
import net.sf.cglib.core.Converter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class BeanCopierUtils {

    //缓存beanCopier
    private static final Map<String, BeanCopier> BEAN_COPIERS = new ConcurrentHashMap<>();

    private static final Logger LOGGER = LoggerFactory.getLogger(BeanCopierUtils.class);

    public static <S, T> T copy(S source, T target, Converter converter) {
        if (source == null || target == null) return null;
        boolean converterFlag = converter != null;
        String converterKey = null;
        if (converterFlag) converterKey = converter.getClass().getName();
        StringBuilder keyBuilder = new StringBuilder();
        keyBuilder.append(source.getClass().getName()).append("#").append(target.getClass().getName()).append("#").append(converterKey);
        String key = keyBuilder.toString();
        BeanCopier copier = null;
        if (!BEAN_COPIERS.containsKey(key)) {
            copier = BeanCopier.create(source.getClass(), target.getClass(), converterFlag);
            BEAN_COPIERS.put(key, copier);
        } else {
            copier = BEAN_COPIERS.get(key);
        }
        copier.copy(source, target, converter);
        return target;
    }

    public static <S, T> T copy(S source, T target) {
        return copy(source, target, null);
    }

    public static <S, T> List<T> copyList(Class<S> sourceClazz, Class<T> targetClazz, List<S> sourceList) {
        return copyList(sourceClazz, targetClazz, sourceList, null);
    }

    public static <S, T> List<T> copyList(Class<S> sourceClazz, Class<T> targetClazz, List<S> sourceList, Converter converter) {
        List<T> targetList = null;
        if (sourceList != null) {
            T target;
            targetList = new ArrayList<>();
            try {
                for (S source : sourceList) {
                    target = targetClazz.newInstance();
                    targetList.add(copy(source, target, converter));
                }
            } catch (Exception e) {
                LOGGER.error("BeanCopierUtils copyList error :", e);
            }
        }
        return targetList;
    }


}