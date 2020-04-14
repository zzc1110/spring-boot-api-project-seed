package ${basePackage}.web;
import ${basePackage}.core.Result;
import ${basePackage}.core.ResultGenerator;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@RestController
@RequestMapping("${baseRequestMapping}")
@Api(value = "value", description = "description")
public class ${modelNameUpperCamel}Controller {
    private Logger logger = LoggerFactory.getLogger(${modelNameUpperCamel}Controller.class);

    @Autowired
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping("/add")
    @ApiOperation(value = "value", notes = "notes", tags = "tags")
    public Result add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    @ApiOperation(value = "value", notes = "notes", tags = "tags")
    public Result delete(@ApiParam(name = "id", value = "id", required = true) @RequestParam Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    @ApiOperation(value = "value", notes = "notes", tags = "tags")
    public Result update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    @ApiOperation(value = "value", notes = "notes", tags = "tags")
    public Result detail(@ApiParam(name = "id", value = "id", required = true) @RequestParam Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }

    @PostMapping("/list")
    @ApiOperation(value = "value", notes = "notes", tags = "tags")
    public Result list(@ApiParam(name = "pageNum", value = "pageNum", required = true) @RequestParam(defaultValue = "0") Integer pageNum, @ApiParam(name = "pageSize", value = "pageSize", required = true) @RequestParam(defaultValue = "0") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
