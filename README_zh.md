lua-patterns
============

收集用Lua写的设计模式和风格.

已有的模式:

| 模式 | 说明 |
| -----| ---- |
| [三层架构](3-tier.lua) | 数据<->业务逻辑<->描述 分离 (严格的关系) |
| [mvc](mvc.lua) | 模型<->视图<->控制器 (非严格的关系) |
| [单例模式](singleton.lua) | 同一个类创建的实体有且只有一个 |
| [abstract_factory](abstract_factory.lua) | 用一个通用的方法, 根据特定的工厂类来创建一个类的实例 |
| [factory_method](factory_method.lua) | 根据专门的函数或者方法, 创建一个类的实例 |
