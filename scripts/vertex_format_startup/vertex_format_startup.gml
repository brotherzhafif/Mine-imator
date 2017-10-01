/// vertex_format_startup()

globalvar vertex_format, vertex_wave, vertex_wave_zmin, vertex_wave_zmax, vertex_brightness;

log("Create vertex format")
vertex_format_begin()
vertex_format_add_position_3d()
vertex_format_add_normal()
vertex_format_add_colour()
vertex_format_add_texcoord()
vertex_format_add_custom(vertex_type_float3, vertex_usage_texcoord)
vertex_format = vertex_format_end()

vertex_wave = e_vertex_wave.NONE
vertex_wave_zmin = null
vertex_wave_zmax = null
vertex_brightness = 0
