package com.ruoyi.framework.security.handle;

import java.io.IOException;
import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;
import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.ServletUtils;
import com.ruoyi.common.utils.StringUtils;

/**
 * 认证失败处理类，用于返回未授权的错误信息
 * 实现了Spring Security的AuthenticationEntryPoint接口
 * 当用户尝试访问一个受保护的资源但未提供正确的认证信息时，此方法将被调用
 *
 * @author ruoyi
 */
@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint, Serializable
{
    // 序列化ID，用于版本控制
    private static final long serialVersionUID = -8970718410437077606L;

    /**
     * 处理认证失败的请求
     *
     * @param request 当前请求对象，包含请求信息
     * @param response 响应对象，用于向客户端发送响应
     * @param e 认证异常，包含认证失败的信息
     * @throws IOException 当响应发送过程中发生I/O错误
     */
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e)
            throws IOException
    {
        // 定义未授权错误码
        int code = HttpStatus.UNAUTHORIZED;
        // 构造错误信息，包含请求的URI
        String msg = StringUtils.format("请求访问：{}，认证失败，无法访问系统资源", request.getRequestURI());
        // 使用AjaxResult封装错误信息，并以JSON格式返回给客户端
        ServletUtils.renderString(response, JSON.toJSONString(AjaxResult.error(code, msg)));
    }
}
