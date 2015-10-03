lua-patterns
============

[中文](./README_zh.md)

A collection of design patterns/idioms in Lua

Current Patterns:

| Pattern | Description |
| ------- | ----------- |
| [3-tier](3-tier.lua) | data<->business logic<->presentation separation (strict relationships) |
| [mvc](mvc.lua) | model<->view<->controller (non-strict relationships) |
| [singleton](singleton.lua) | only one instance create with same Class |
| [abstract_factory](abstract_factory.lua) | use a generic function with specific factories |
| [factory_method](factory_method.lua) | delegate a specialized function/method to create instances |
| [prototype](prototype.lua) | use a factory and clones of a prototype for new instances (if instantiation is expensive) |