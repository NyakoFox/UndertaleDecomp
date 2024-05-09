/// @func caster_loop(sound_handle, volume, pitch)
/// @param {Asset.GMSound OR Id.Sound} sound_handle
/// @param {Real} volume
/// @param {Real} pitch
function caster_loop(_sound_handle, _volume, _pitch)
{
	this_song_i = audio_play_sound(_sound_handle, 120, true)
	audio_sound_pitch(_sound_handle, _pitch)
	// Daniela: decomp code
	if (array_contains(global.music_array, _sound_handle))
		audio_sound_gain(_sound_handle, _volume * (global.decomp_vars.MusicVolume / 100), 0);
	else
		audio_sound_gain(_sound_handle, _volume, 0);
	return this_song_i;
}
