package com.ruoyi.framework.security.context;

import org.springframework.security.core.Authentication;

/**
 * 身份验证信息的线程本地存储管理类
 * 提供方法来获取、设置和清除线程本地存储中的身份验证信息
 *
 * @author ruoyi
 */
public class AuthenticationContextHolder
{
    // 使用ThreadLocal来存储身份验证信息，确保每个线程都有自己独立的实例
    private static final ThreadLocal<Authentication> contextHolder = new ThreadLocal<>();

    /**
     * 获取当前线程本地存储中的身份验证信息
     *
     * @return 当前线程的身份验证信息，如果没有设置则返回null
     */
    public static Authentication getContext()
    {
        return contextHolder.get();
    }

    /**
     * 设置当前线程本地存储中的身份验证信息
     *
     * @param context 身份验证信息对象，通常包含用户信息和权限信息
     */
    public static void setContext(Authentication context)
    {
        contextHolder.set(context);
    }

    /**
     * 清除当前线程本地存储中的身份验证信息
     * 通常在请求处理完成后调用，以避免内存泄漏
     */
    public static void clearContext()
    {
        contextHolder.remove();
    }
}
