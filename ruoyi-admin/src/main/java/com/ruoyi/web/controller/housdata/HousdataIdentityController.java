package com.ruoyi.web.controller.housdata;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.housdata.domain.HousdataIdentity;
import com.ruoyi.housdata.service.IHousdataIdentityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户身份标识Controller
 * 
 * @author ruoyi
 * @date 2024-10-24
 */
@RestController
@RequestMapping("/housdata/datas")
public class HousdataIdentityController extends BaseController
{
    @Autowired
    private IHousdataIdentityService housdataIdentityService;

    /**
     * 查询用户身份标识列表
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:list')")
    @GetMapping("/list")
    public TableDataInfo list(HousdataIdentity housdataIdentity)
    {
        startPage();
        List<HousdataIdentity> list = housdataIdentityService.selectHousdataIdentityList(housdataIdentity);
        return getDataTable(list);
    }

    /**
     * 导出用户身份标识列表
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:export')")
    @Log(title = "用户身份标识", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HousdataIdentity housdataIdentity)
    {
        List<HousdataIdentity> list = housdataIdentityService.selectHousdataIdentityList(housdataIdentity);
        ExcelUtil<HousdataIdentity> util = new ExcelUtil<HousdataIdentity>(HousdataIdentity.class);
        util.exportExcel(response, list, "用户身份标识数据");
    }

    /**
     * 获取用户身份标识详细信息
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:query')")
    @GetMapping(value = "/{Id}")
    public AjaxResult getInfo(@PathVariable("Id") Long identityId)
    {
        return success(housdataIdentityService.selectHousdataIdentityById(identityId));
    }

    /**
     * 新增用户身份标识
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:add')")
    @Log(title = "用户身份标识", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HousdataIdentity housdataIdentity)
    {
        return toAjax(housdataIdentityService.insertHousdataIdentity(housdataIdentity));
    }

    /**
     * 修改用户身份标识
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:edit')")
    @Log(title = "用户身份标识", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HousdataIdentity housdataIdentity)
    {
        return toAjax(housdataIdentityService.updateHousdataIdentity(housdataIdentity));
    }

    /**
     * 删除用户身份标识
     */
    @PreAuthorize("@ss.hasPermi('housdata:datas:remove')")
    @Log(title = "用户身份标识", businessType = BusinessType.DELETE)
	@DeleteMapping("/{identityIds}")
    public AjaxResult remove(@PathVariable Long[] identityIds)
    {
        return toAjax(housdataIdentityService.deleteHousdataIdentityByIds(identityIds));
    }
}
