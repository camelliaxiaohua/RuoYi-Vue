package com.ruoyi.framework.security.context;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import com.ruoyi.common.core.text.Convert;

/**
 * 权限信息持有类
 * 提供权限信息的设置和获取方法，以便在请求范围内共享权限信息
 *
 * @author ruoyi
 */
public class PermissionContextHolder
{
    // 权限信息在请求属性中的名称常量
    private static final String PERMISSION_CONTEXT_ATTRIBUTES = "PERMISSION_CONTEXT";

    /**
     * 设置权限信息到请求属性中
     *
     * @param permission 权限信息字符串
     */
    public static void setContext(String permission)
    {
        // 使用RequestContextHolder设置权限信息到当前请求的属性中
        RequestContextHolder.currentRequestAttributes().setAttribute(PERMISSION_CONTEXT_ATTRIBUTES, permission,
                RequestAttributes.SCOPE_REQUEST);
    }

    /**
     * 从请求属性中获取权限信息
     *
     * @return 权限信息字符串，如果不存在则返回空字符串
     */
    public static String getContext()
    {
        // 使用RequestContextHolder从当前请求的属性中获取权限信息，并转换为字符串
        return Convert.toStr(RequestContextHolder.currentRequestAttributes().getAttribute(PERMISSION_CONTEXT_ATTRIBUTES,
                RequestAttributes.SCOPE_REQUEST));
    }
}
