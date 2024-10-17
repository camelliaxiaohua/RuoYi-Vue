package com.ruoyi.web.controller.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.service.ISysConfigService;

/**
 * 验证码操作处理
 *
 * @author ruoyi
 */
@RestController
public class CaptchaController
{
    // 注入验证码生成器，用于生成字符和数学验证码
    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    // 注入 Redis 缓存服务
    @Autowired
    private RedisCache redisCache;

    // 注入系统配置服务
    @Autowired
    private ISysConfigService configService;

    /**
     * 生成验证码
     *
     * @param response HTTP 响应
     * @return AjaxResult 包含验证码和状态信息
     * @throws IOException 可能抛出的 IO 异常
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode(HttpServletResponse response) throws IOException
    {
        // 创建成功的 Ajax 结果
        AjaxResult ajax = AjaxResult.success();
        // 检查验证码是否启用
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled) // 如果未启用验证码，返回状态
        {
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID(); // 生成 UUID 作为验证码的唯一标识符
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid; // Redis 键

        String capStr = null, code = null;
        BufferedImage image = null;

        // 生成验证码
        String captchaType = RuoYiConfig.getCaptchaType(); // 获取验证码类型
        if ("math".equals(captchaType)) // 如果是数学验证码
        {
            String capText = captchaProducerMath.createText(); // 生成验证码文本
            capStr = capText.substring(0, capText.lastIndexOf("@")); // 提取显示文本
            code = capText.substring(capText.lastIndexOf("@") + 1); // 提取实际验证码
            image = captchaProducerMath.createImage(capStr); // 生成验证码图像
        }
        else if ("char".equals(captchaType)) // 如果是字符验证码
        {
            capStr = code = captchaProducer.createText(); // 生成验证码文本
            image = captchaProducer.createImage(capStr); // 生成验证码图像
        }

        // 将验证码存储在 Redis 中，设置过期时间
        redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);

        // 创建字节数组输出流以存储图像数据
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            // 将图像写入输出流
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e) // 捕获可能的异常
        {
            return AjaxResult.error(e.getMessage()); // 返回错误信息
        }

        // 将 UUID 和 Base64 编码的图像添加到返回结果中
        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray())); // 转换为 Base64 编码
        return ajax; // 返回结果
    }
}
