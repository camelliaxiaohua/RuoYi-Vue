import com.google.code.kaptcha.Producer;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.web.controller.common.CaptchaController;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;

public class CaptchaControllerTest {

    @InjectMocks
    private CaptchaController captchaController;

    @Mock
    private RedisCache redisCache;

    @Mock
    private ISysConfigService configService;

    @Mock
    private Producer captchaProducer;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetCode() throws Exception {
        // Mock ISysConfigService to return true for captchaEnabled
        when(configService.selectCaptchaEnabled()).thenReturn(true);

        // Mock the captcha producer to generate a test image and code
        String captchaText = "1234";
        when(captchaProducer.createText()).thenReturn(captchaText);
        when(captchaProducer.createImage(captchaText)).thenReturn(createTestImage(captchaText));

        // Mock the RedisCache's setCacheObject method
        doNothing().when(redisCache).setCacheObject(anyString(), anyString(), eq(2), eq(TimeUnit.MINUTES));

        // Create a mock HttpServletResponse
        MockHttpServletResponse response = new MockHttpServletResponse();

        // Call the method under test
        AjaxResult result = captchaController.getCode(response);

        // Verify the result
        assert result.get("captchaEnabled").equals(true);
        assert result.get("uuid") != null;
        assert result.get("img") != null;
    }

    private BufferedImage createTestImage(String text) {
        int width = 100;
        int height = 50;

        // Create a buffered image
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = img.createGraphics();

        // Set background color
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);

        // Set font color and font
        g.setColor(Color.BLACK);
        g.setFont(new Font("Arial", Font.BOLD, 24));

        // Draw the captcha text
        g.drawString(text, 20, 30);
        g.dispose(); // Dispose of the graphics context

        return img;
    }
}
