package com.ruoyi.web.controller.housdata;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.housdata.domain.QueryUser;
import com.ruoyi.housdata.service.IQueryUserService;
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
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 信息查询Controller
 *
 * @author camellia
 * @date 2024-10-23
 */
@RestController
@RequestMapping("/housdata/users")
public class QueryUserController extends BaseController
{
    @Autowired
    private IQueryUserService queryUserService;

    /**
     * 查询信息查询列表
     */
    @Anonymous
    @PreAuthorize("@ss.hasPermi('housdata:users:list')")
    @GetMapping("/list")
    public TableDataInfo list(QueryUser queryUser)
    {
        startPage();
        List<QueryUser> list = queryUserService.selectQueryUserList(queryUser);
        return getDataTable(list);
    }

    /**
     * 导出信息查询列表
     */
    @PreAuthorize("@ss.hasPermi('housdata:users:export')")
    @Log(title = "信息查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, QueryUser queryUser)
    {
        List<QueryUser> list = queryUserService.selectQueryUserList(queryUser);
        ExcelUtil<QueryUser> util = new ExcelUtil<QueryUser>(QueryUser.class);
        util.exportExcel(response, list, "信息查询数据");
    }

    /**
     * 获取信息查询详细信息
     */
    @PreAuthorize("@ss.hasPermi('housdata:users:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(queryUserService.selectQueryUserById(id));
    }

    /**
     * 新增信息查询
     */
    @PreAuthorize("@ss.hasPermi('housdata:users:add')")
    @Log(title = "信息查询", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody QueryUser queryUser)
    {
        return toAjax(queryUserService.insertQueryUser(queryUser));
    }

    /**
     * 修改信息查询
     */
    @PreAuthorize("@ss.hasPermi('housdata:users:edit')")
    @Log(title = "信息查询", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody QueryUser queryUser)
    {
        return toAjax(queryUserService.updateQueryUser(queryUser));
    }

    /**
     * 删除信息查询
     */
    @PreAuthorize("@ss.hasPermi('housdata:users:remove')")
    @Log(title = "信息查询", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(queryUserService.deleteQueryUserByIds(ids));
    }
}
