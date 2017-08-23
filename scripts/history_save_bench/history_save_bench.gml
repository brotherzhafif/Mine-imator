/// history_save_bench()

var save = new(obj_history_save);
save.hobj = id

with (bench_settings)
	temp_copy(save)
	
with (save)
{
	temp_get_save_ids()
	
	// Save particle types
	if (type = "particles")
	{
		save.pc_type_amount = ds_list_size(app.bench_settings.pc_type_list)
		for (var p = 0; p < save.pc_type_amount; p++)
			with (other.id)
				save.pc_type_save_obj[p] = history_save_ptype(app.bench_settings.pc_type_list[|p])
	}
	
	// Save templates
	temp_amount = 0
	with (obj_template)
	{
		if (creator != app.bench_settings)
			continue
		
		var tsave = new(obj_history_save);
		tsave.hobj = save.hobj
		temp_copy(tsave)
		
		with (tsave)
		{
			save_id = other.save_id
			temp_get_save_ids()
		}
		
		save.temp_save_obj[save.temp_amount] = tsave
		save.temp_amount++
	}
}

return save
