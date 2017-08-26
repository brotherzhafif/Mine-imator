/// project_read_particles()
/*
pc_spawn_constant = buffer_read_byte()						debug("pc_spawn_constant", pc_spawn_constant)
pc_spawn_amount = buffer_read_int()							debug("pc_spawn_amount", pc_spawn_amount)

pc_spawn_region_use = buffer_read_byte()					debug("pc_spawn_region_use", pc_spawn_region_use)
pc_spawn_region_type = buffer_read_string_int()				debug("pc_spawn_region_type", pc_spawn_region_type)
pc_spawn_region_sphere_radius = buffer_read_double()		debug("pc_spawn_region_sphere_radius", pc_spawn_region_sphere_radius)
pc_spawn_region_cube_size = buffer_read_double()			debug("pc_spawn_region_cube_size", pc_spawn_region_cube_size)

pc_spawn_region_box_size[XPOS] = buffer_read_double()
pc_spawn_region_box_size[YPOS] = buffer_read_double()
pc_spawn_region_box_size[ZPOS] = buffer_read_double()
debug("pc_spawn_region_box_size", pc_spawn_region_box_size[XPOS], pc_spawn_region_box_size[YPOS], pc_spawn_region_box_size[ZPOS])

pc_bounding_box_type = buffer_read_byte()					debug("pc_bounding_box_type", pc_bounding_box_type)
if (load_format >= project_100demo4)
	pc_bounding_box_ground_z = buffer_read_double()
else
	pc_bounding_box_ground_z = 0
debug("pc_bounding_box_ground_z", pc_bounding_box_ground_z)

pc_bounding_box_custom_start[XPOS] = buffer_read_double()
pc_bounding_box_custom_start[YPOS] = buffer_read_double()
pc_bounding_box_custom_start[ZPOS] = buffer_read_double()
debug("pc_bounding_box_custom_start", pc_bounding_box_custom_start[XPOS], pc_bounding_box_custom_start[YPOS], pc_bounding_box_custom_start[ZPOS])

pc_bounding_box_custom_end[XPOS] = buffer_read_double()
pc_bounding_box_custom_end[YPOS] = buffer_read_double()
pc_bounding_box_custom_end[ZPOS] = buffer_read_double()
debug("pc_bounding_box_custom_end", pc_bounding_box_custom_end[XPOS], pc_bounding_box_custom_end[YPOS], pc_bounding_box_custom_end[ZPOS])

pc_bounding_box_relative = buffer_read_byte() debug("pc_bounding_box_relative", pc_bounding_box_relative)

pc_destroy_at_animation_finish = buffer_read_byte()			debug("pc_destroy_at_animation_finish", pc_destroy_at_animation_finish)
pc_destroy_at_amount = buffer_read_byte()					debug("pc_destroy_at_amount", pc_destroy_at_amount)
pc_destroy_at_amount_val = buffer_read_int()				debug("pc_destroy_at_amount_val", pc_destroy_at_amount_val)
pc_destroy_at_time = buffer_read_byte()						debug("pc_destroy_at_time", pc_destroy_at_time)
pc_destroy_at_time_seconds = buffer_read_double()			debug("pc_destroy_at_time_seconds", pc_destroy_at_time_seconds)
pc_destroy_at_time_israndom = buffer_read_byte()			debug("pc_destroy_at_time_israndom", pc_destroy_at_time_israndom)
pc_destroy_at_time_random_min = buffer_read_double()		debug("pc_destroy_at_time_random_min", pc_destroy_at_time_random_min)
pc_destroy_at_time_random_max = buffer_read_double()		debug("pc_destroy_at_time_random_max", pc_destroy_at_time_random_max)

pc_types = buffer_read_int()								debug("pc_types", pc_types) debug_indent++
for (var p = 0; p < pc_types; p++)
{
	pc_type[p] = new(obj_particle_type)
	with (pc_type[p])
	{
		debug("Particle type") debug_indent++
		loaded = true
		creator = other.id
		creator_pos = p
		if (load_format >= project_100debug)
		{
			iid = iid_read()
			iid_current = max(iid + 1, iid_current)
		}
		else
			iid = null													debug("iid", iid)
		name = buffer_read_string_int()									debug("name", name)
		temp = iid_read()												debug("temp", temp)
		text = buffer_read_string_int()									debug("text", text)
		if (load_format >= project_100demo3)
				spawn_rate = buffer_read_double()						debug("spawn_rate", spawn_rate)
		sprite_tex = iid_read()											debug("sprite_tex", sprite_tex)
		sprite_tex_image = buffer_read_byte()							debug("sprite_tex_image", sprite_tex_image)
		sprite_frame_width = buffer_read_int()							debug("sprite_frame_width", sprite_frame_width)
		sprite_frame_height = buffer_read_int()							debug("sprite_frame_height", sprite_frame_height)
		sprite_frame_start = buffer_read_int()							debug("sprite_frame_start", sprite_frame_start)
		sprite_frame_end = buffer_read_int()							debug("sprite_frame_end", sprite_frame_end)
		sprite_animation_speed = buffer_read_double()					debug("sprite_animation_speed", sprite_animation_speed)
		sprite_animation_speed_israndom = buffer_read_byte()			debug("sprite_animation_speed_israndom", sprite_animation_speed_israndom)
		sprite_animation_speed_random_min = buffer_read_double()		debug("sprite_animation_speed_random_min", sprite_animation_speed_random_min)
		sprite_animation_speed_random_max = buffer_read_double()		debug("sprite_animation_speed_random_max", sprite_animation_speed_random_max)
		sprite_animation_onend = buffer_read_byte()						debug("sprite_animation_onend", sprite_animation_onend)
		rot_extend = buffer_read_byte()									debug("rot_extend", rot_extend)
		spd_extend = buffer_read_byte()									debug("spd_extend", spd_extend)
		rot_spd_extend = buffer_read_byte()								debug("rot_spd_extend", rot_spd_extend)
		
		for (var a = X; a <= Z; a++)
		{
			spd[a] = buffer_read_double()
			spd_israndom[a] = buffer_read_byte()
			spd_random_min[a] = buffer_read_double()
			spd_random_max[a] = buffer_read_double()
			spd_add[a] = buffer_read_double()
			spd_add_israndom[a] = buffer_read_byte()
			spd_add_random_min[a] = buffer_read_double()
			spd_add_random_max[a] = buffer_read_double()
			spd_mul[a] = buffer_read_double()
			spd_mul_israndom[a] = buffer_read_byte()
			spd_mul_random_min[a] = buffer_read_double()
			spd_mul_random_max[a] = buffer_read_double()
			
			rot[a] = buffer_read_double()
			rot_israndom[a] = buffer_read_byte()
			rot_random_min[a] = buffer_read_double()
			rot_random_max[a] = buffer_read_double()
			rot_spd[a] = buffer_read_double()
			rot_spd_israndom[a] = buffer_read_byte()
			rot_spd_random_min[a] = buffer_read_double()
			rot_spd_random_max[a] = buffer_read_double()
			rot_spd_add[a] = buffer_read_double()
			rot_spd_add_israndom[a] = buffer_read_byte()
			rot_spd_add_random_min[a] = buffer_read_double()
			rot_spd_add_random_max[a] = buffer_read_double()
			rot_spd_mul[a] = buffer_read_double()
			rot_spd_mul_israndom[a] = buffer_read_byte()
			rot_spd_mul_random_min[a] = buffer_read_double()
			rot_spd_mul_random_max[a] = buffer_read_double()
		}
		
		debug("spd", spd)
		debug("spd_israndom", spd_israndom)
		debug("spd_random_min", spd_random_min)
		debug("spd_random_max", spd_random_max)
		debug("spd_add", spd_add)
		debug("spd_add_israndom", spd_add_israndom)
		debug("spd_add_random_min", spd_add_random_min)
		debug("spd_add_random_max", spd_add_random_max)
		debug("spd_mul", spd_mul)
		debug("spd_mul_israndom", spd_mul_israndom)
		debug("spd_mul_random_min", spd_mul_random_min)
		debug("spd_mul_random_max", spd_mul_random_max)
		debug("rot", rot)
		debug("rot_israndom", rot_israndom)
		debug("rot_random_min", rot_random_min)
		debug("rot_random_max", rot_random_max)
		debug("rot_spd", rot_spd)
		debug("rot_spd_israndom", rot_spd_israndom)
		debug("rot_spd_random_min", rot_spd_random_min)
		debug("rot_spd_random_max", rot_spd_random_max)
		debug("rot_spd_add", rot_spd_add)
		debug("rot_spd_add_israndom", rot_spd_add_israndom)
		debug("rot_spd_add_random_min", rot_spd_add_random_min)
		debug("rot_spd_add_random_max", rot_spd_add_random_max)
		debug("rot_spd_mul", rot_spd_mul)
		debug("rot_spd_mul_israndom", rot_spd_mul_israndom)
		debug("rot_spd_mul_random_min", rot_spd_mul_random_min)
		debug("rot_spd_mul_random_max", rot_spd_mul_random_max)
		
		scale = buffer_read_double()							debug("scale", scale)
		scale_israndom = buffer_read_byte()						debug("scale_israndom", scale_israndom)
		scale_random_min = buffer_read_double()					debug("scale_random_min", scale_random_min)
		scale_random_max = buffer_read_double()					debug("scale_random_max", scale_random_max)
		scale_add = buffer_read_double()						debug("scale_add", scale_add)
		scale_add_israndom = buffer_read_byte()					debug("scale_add_israndom", scale_add_israndom)
		scale_add_random_min = buffer_read_double()				debug("scale_add_random_min", scale_add_random_min)
		scale_add_random_max = buffer_read_double()				debug("scale_add_random_max", scale_add_random_max)
		
		alpha = buffer_read_double()							debug("alpha", alpha)
		alpha_israndom = buffer_read_byte()						debug("alpha_israndom", alpha_israndom)
		alpha_random_min = buffer_read_double()					debug("alpha_random_min", alpha_random_min)
		alpha_random_max = buffer_read_double()					debug("alpha_random_max", alpha_random_max)
		alpha_add = buffer_read_double()						debug("alpha_add", alpha_add)
		alpha_add_israndom = buffer_read_byte()					debug("alpha_add_israndom", alpha_add_israndom)
		alpha_add_random_min = buffer_read_double()				debug("alpha_add_random_min", alpha_add_random_min)
		alpha_add_random_max = buffer_read_double()				debug("alpha_add_random_max", alpha_add_random_max)
		
		color = buffer_read_int()								debug("color", color)
		color_israndom = buffer_read_byte()						debug("color_israndom", color_israndom)
		color_random_start = buffer_read_int()					debug("color_random_start", color_random_start)
		color_random_end = buffer_read_int()					debug("color_random_end", color_random_end)
		color_mix_enabled = buffer_read_byte()					debug("color_mix_enabled", color_mix_enabled)
		color_mix = buffer_read_int()							debug("color_mix", color_mix)
		color_mix_israndom = buffer_read_byte()					debug("color_mix_israndom", color_mix_israndom)
		color_mix_random_start = buffer_read_int()				debug("color_mix_random_start", color_mix_random_start)
		color_mix_random_end = buffer_read_int()				debug("color_mix_random_end", color_mix_random_end)
		color_mix_time = buffer_read_double()					debug("color_mix_time", color_mix_time)
		color_mix_time_israndom = buffer_read_byte()			debug("color_mix_time_israndom", color_mix_time_israndom)
		color_mix_time_random_min = buffer_read_double()		debug("color_mix_time_random_min", color_mix_time_random_min)
		color_mix_time_random_max = buffer_read_double()		debug("color_mix_time_random_max", color_mix_time_random_max)
		
		if (load_format >= project_100demo3)
			spawn_region = buffer_read_byte()					debug("spawn_region", spawn_region)
		
		bounding_box = buffer_read_byte()						debug("bounding_box", bounding_box)
		bounce = buffer_read_byte()								debug("bounce", bounce)
		bounce_factor = buffer_read_double()					debug("bounce_factor", bounce_factor)
		orbit = buffer_read_byte()								debug("orbit", orbit)
		debug_indent--
	}
}

debug_indent--
*/