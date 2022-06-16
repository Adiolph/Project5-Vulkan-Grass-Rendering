# Question List

- `Blades::Blades()`: in our enginde, do we set y direction as height?
- What is the coordinate frame of blade orientation?

## Error records

### Error 1

``` shell
Validation layer: Validation Error: [ UNASSIGNED-CoreValidation-Shader-InterfaceTypeMismatch ] Object 0: handle = 0x67022e000000004b, type = VK_OBJECT_TYPE_SHADER_MODULE; | MessageID = 0xb6cf33fe | Number of elements inside builtin block differ between stages (vertex shader 1 vs tessellation control shader 4).
Validation layer: Validation Error: [ VUID-vkCmdBindVertexBuffers-pBuffers-00627 ] Object 0: handle = 0xa2eb680000000026, type = VK_OBJECT_TYPE_BUFFER; | MessageID = 0x9ae31e79 | Invalid usage flag for VkBuffer 0xa2eb680000000026[] used by vkCmdBindVertexBuffers(). In this case, VkBuffer should have VK_BUFFER_USAGE_VERTEX_BUFFER_BIT set during creation. The Vulkan spec states: All elements of pBuffers must have been created with the VK_BUFFER_USAGE_VERTEX_BUFFER_BIT flag (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkCmdBindVertexBuffers-pBuffers-00627)
Validation layer: Validation Error: [ VUID-vkCmdBindVertexBuffers-pBuffers-00627 ] Object 0: handle = 0xa2eb680000000026, type = VK_OBJECT_TYPE_BUFFER; | MessageID = 0x9ae31e79 | Invalid usage flag for VkBuffer 0xa2eb680000000026[] used by vkCmdBindVertexBuffers(). In this case, VkBuffer should have VK_BUFFER_USAGE_VERTEX_BUFFER_BIT set during creation. The Vulkan spec states: All elements of pBuffers must have been created with the VK_BUFFER_USAGE_VERTEX_BUFFER_BIT flag (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkCmdBindVertexBuffers-pBuffers-00627)
Validation layer: Validation Error: [ VUID-vkCmdBindVertexBuffers-pBuffers-00627 ] Object 0: handle = 0xa2eb680000000026, type = VK_OBJECT_TYPE_BUFFER; | MessageID = 0x9ae31e79 | Invalid usage flag for VkBuffer 0xa2eb680000000026[] used by vkCmdBindVertexBuffers(). In this case, VkBuffer should have VK_BUFFER_USAGE_VERTEX_BUFFER_BIT set during creation. The Vulkan spec states: All elements of pBuffers must have been created with the VK_BUFFER_USAGE_VERTEX_BUFFER_BIT flag (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkCmdBindVertexBuffers-pBuffers-00627)
Validation layer: Validation Error: [ VUID-vkCmdBindVertexBuffers-pBuffers-00627 ] Object 0: handle = 0xa2eb680000000026, type = VK_OBJECT_TYPE_BUFFER; | MessageID = 0x9ae31e79 | Invalid usage flag for VkBuffer 0xa2eb680000000026[] used by vkCmdBindVertexBuffers(). In this case, VkBuffer should have VK_BUFFER_USAGE_VERTEX_BUFFER_BIT set during creation. The Vulkan spec states: All elements of pBuffers must have been created with the VK_BUFFER_USAGE_VERTEX_BUFFER_BIT flag (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkCmdBindVertexBuffers-pBuffers-00627)
Validation layer: Validation Error: [ VUID-vkCmdBindVertexBuffers-pBuffers-00627 ] Object 0: handle = 0xa2eb680000000026, type = VK_OBJECT_TYPE_BUFFER; | MessageID = 0x9ae31e79 | Invalid usage flag for VkBuffer 0xa2eb680000000026[] used by vkCmdBindVertexBuffers(). In this case, VkBuffer should have VK_BUFFER_USAGE_VERTEX_BUFFER_BIT set during creation. The Vulkan spec states: All elements of pBuffers must have been created with the VK_BUFFER_USAGE_VERTEX_BUFFER_BIT flag (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkCmdBindVertexBuffers-pBuffers-00627)
VUID-vkDestroyInstance-instance-00629(ERROR / SPEC): msgNum: -1958900200 - Validation Error: [ VUID-vkDestroyInstance-instance-00629 ] Object 0: handle = 0x292cfbd93e0, type = VK_OBJECT_TYPE_INSTANCE; Object 1: handle = 0xfab64d0000000002, type = VK_OBJECT_TYPE_SURFACE_KHR; | MessageID = 0x8b3d8e18 | OBJ ERROR : For VkInstance 0x292cfbd93e0[], VkSurfaceKHR 0xfab64d0000000002[] has not been destroyed. The Vulkan spec states: All child objects created using instance must have been destroyed prior to destroying instance (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkDestroyInstance-instance-00629)
    Objects: 2
        [0] 0x292cfbd93e0, type: 1, name: NULL
        [1] 0xfab64d0000000002, type: 1000000000, name: NULL
```

Solution: Change `bladesBuffer` from `VK_BUFFER_USAGE_STORAGE_BUFFER_BIT` to `VK_BUFFER_USAGE_VERTEX_BUFFER_BIT`.

### Error 2

``` shell
Validation layer: Validation Error: [ UNASSIGNED-CoreValidation-Shader-InterfaceTypeMismatch ] Object 0: handle = 0x67022e000000004b, type = VK_OBJECT_TYPE_SHADER_MODULE; | MessageID = 0xb6cf33fe | Number of elements inside builtin block differ between stages (vertex shader 1 vs tessellation control shader 4).
VUID-vkDestroyInstance-instance-00629(ERROR / SPEC): msgNum: -1958900200 - Validation Error: [ VUID-vkDestroyInstance-instance-00629 ] Object 0: handle = 0x1522d31a970, type = VK_OBJECT_TYPE_INSTANCE; Object 1: handle = 0xfab64d0000000002, type = VK_OBJECT_TYPE_SURFACE_KHR; | MessageID = 0x8b3d8e18 | OBJ ERROR : For VkInstance 0x1522d31a970[], VkSurfaceKHR 0xfab64d0000000002[] has not been destroyed. The Vulkan spec states: All child objects created using instance must have been destroyed prior to destroying instance (https://vulkan.lunarg.com/doc/view/1.3.211.0/windows/1.3-extensions/vkspec.html#VUID-vkDestroyInstance-instance-00629)
    Objects: 2
        [0] 0x1522d31a970, type: 1, name: NULL
        [1] 0xfab64d0000000002, type: 1000000000, name: NULL
```
