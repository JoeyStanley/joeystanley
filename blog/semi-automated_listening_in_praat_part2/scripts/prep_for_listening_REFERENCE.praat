######################################################################
#
# Listening to consonantal variables in Kohler Tapes
#
# A script to first get a feel for how many words contain the 
# consonantal variables I'm interested in in the Kohler tapes.
#
# Joey Stanley
# 3:49pm, Wednesday, June 25, 2025
# My Office, JFSB, BYU, Provo, UT
# I just submitted grades so I'm free as a bird!
#
# Updated to work with UtahEnglish project for SHEL.
# This time it generates a single "to_listen" file with everything
# we'd want to listen for. This gets read into the next script.
# This has one column for each potential listener so we can work
# independently if needed.
# 
# Joey Stanley
# 1:25am, Wednesday, April 8, 2026
# Home, Spanish Fork, UT
# Can't sleep. Probably because of this project...
#
######################################################################

writeInfoLine: "Counting consonantal variables..."

phoneme_tier = 1
word_tier = 2
dir$ = "../../recordings/"

# Start the output file
output_file$ = "to_listen_new.csv"
writeFileLine: output_file$, "variable,speaker,time,word,joey,lisa,hallie"

speakers = Create Strings as directory list: "speaker_directories", "'dir$'*"
n_speakers = Get number of strings
for i_speaker from 1 to n_speakers
	selectObject: speakers
	speaker$ = Get string: i_speaker

	speaker_dir$ = "'dir$''speaker$'/"
	path_to_mfa_file$ = "'speaker_dir$'mfa/'speaker$'.TextGrid"
	appendInfoLine: path_to_mfa_file$

	# Only continue if it exists
	if fileReadable(path_to_mfa_file$)

		this_tg = Read from file: path_to_mfa_file$

		# Now do the processing
		@process_transcription
	
		selectObject: this_tg
		Remove

	endif

endfor



selectObject: speakers
Remove

appendInfoLine: newline$, "Done!"





# A general procedure for general processing. Individual variables processed within.
procedure process_transcription

	n_phonemes = Get number of intervals: phoneme_tier
	
	# Older features
	#@cordcard
	@false
	# offglides in lax vowels
	# PRICE monophthongization
	@whaspiration
	# tensing in unstressed vowels

	# Newer features
	#@feelfill
	#@failfell
	@ng
	#@unfronting
	@thr
	@lth
	@mountain
	#@beg


endproc






procedure cordcard

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want AA1 or AO1
		if this_interval_label$ = "AA1" or this_interval_label$ = "AO1"

			# Next phoneme has to be an R
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "R"

				# The words for the two have to be the same
				this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			 	next_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				this_interval_word_interval = Get interval at time: word_tier, this_interval_start
				next_interval_word_interval = Get interval at time: word_tier, next_interval_start
				if this_interval_word_interval = next_interval_word_interval

					this_word$ = Get label of interval: word_tier, this_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."cordcard", ",",
								...speaker$, ",", 
								...fixed$(this_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc


procedure false

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want L
		if this_interval_label$ = "L"

			# Next phoneme has to be an S
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "S"

				# The words for the two have to be the same
				l_interval_start = Get start time of interval: phoneme_tier, i_phoneme
				s_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				l_interval_word_interval = Get interval at time: word_tier, l_interval_start
				s_interval_word_interval = Get interval at time: word_tier, s_interval_start
				if l_interval_word_interval = s_interval_word_interval

					this_word$ = Get label of interval: word_tier, l_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."false", ",",
								...speaker$, ",", 
								...fixed$(l_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc




procedure feelfill

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want IY1
		if this_interval_label$ = "IY1"

			# Next phoneme has to be an L
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "L"

				# The words for the two have to be the same
				this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			 	next_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				this_interval_word_interval = Get interval at time: word_tier, this_interval_start
				next_interval_word_interval = Get interval at time: word_tier, next_interval_start
				if this_interval_word_interval = next_interval_word_interval

					this_word$ = Get label of interval: word_tier, this_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."feelfill", ",",
								...speaker$, ",", 
								...fixed$(this_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc




procedure failfell

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want EY1
		if this_interval_label$ = "EY1"

			# Next phoneme has to be an L
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "L"

				# The words for the two have to be the same
				this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			 	next_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				this_interval_word_interval = Get interval at time: word_tier, this_interval_start
				next_interval_word_interval = Get interval at time: word_tier, next_interval_start
				if this_interval_word_interval = next_interval_word_interval

					this_word$ = Get label of interval: word_tier, this_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."failfell", ",",
								...speaker$, ",", 
								...fixed$(this_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc






procedure unfronting

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want AH1
		if this_interval_label$ = "AH1"

			# Next phoneme has to be an N or an M
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "N" or next_interval_label$ = "M"

				# The words for the two have to be the same
				this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			 	next_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				this_interval_word_interval = Get interval at time: word_tier, this_interval_start
				next_interval_word_interval = Get interval at time: word_tier, next_interval_start
				if this_interval_word_interval = next_interval_word_interval

					this_word$ = Get label of interval: word_tier, this_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."unfronting", ",",
								...speaker$, ",", 
								...fixed$(this_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc





procedure thr

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want TH
		if this_interval_label$ = "TH"

			# Next phoneme has to be an R
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "R"

				# The words for the two have to be the same
				th_interval_start = Get start time of interval: phoneme_tier, i_phoneme
				r_interval_start  = Get start time of interval: phoneme_tier, i_phoneme+1
				th_interval_word_interval = Get interval at time: word_tier, th_interval_start
				r_interval_word_interval  = Get interval at time: word_tier, r_interval_start
				if th_interval_word_interval = r_interval_word_interval

					this_word$ = Get label of interval: word_tier, th_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."thr", ",",
								...speaker$, ",", 
								...fixed$(th_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc






procedure lth

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want L
		if this_interval_label$ = "L"

			# Next phoneme has to be an TH
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "TH"

				# The words for the two have to be the same
				l_interval_start  = Get start time of interval: phoneme_tier, i_phoneme
				th_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				l_interval_word_interval  = Get interval at time: word_tier, l_interval_start
				th_interval_word_interval = Get interval at time: word_tier, th_interval_start
				if l_interval_word_interval = th_interval_word_interval

					this_word$ = Get label of interval: word_tier, l_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."lth", ",",
								...speaker$, ",", 
								...fixed$(l_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc



procedure beg

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want EH
		if this_interval_label$ = "EH1"

			# Next phoneme has to be an G
			next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1
			if next_interval_label$ = "G"

				# The words for the two have to be the same
				e_interval_start = Get start time of interval: phoneme_tier, i_phoneme
				g_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
				e_interval_word_interval = Get interval at time: word_tier, e_interval_start
				g_interval_word_interval = Get interval at time: word_tier, g_interval_start
				if e_interval_word_interval = g_interval_word_interval

					this_word$ = Get label of interval: word_tier, e_interval_word_interval
					#appendInfoLine: tab$, this_word$

					# export it
					appendFileLine: output_file$, 
								..."beg", ",",
								...speaker$, ",", 
								...fixed$(e_interval_start,2), ",",
								...this_word$, ",,,"

				endif

			endif

		endif		

	endfor

endproc



# This one is a little different because it involves three sounds.
procedure mountain

	for i_phoneme from 1 to n_phonemes-2
		this_interval_label$  = Get label of interval: phoneme_tier, i_phoneme

		# We only want T
		if this_interval_label$ = "T"

			# Two phonemes down has to be an N
			after_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+2
			if after_interval_label$ == "N"

				# The words from the T and N have to be the same
				t_interval_start = Get start time of interval: phoneme_tier, i_phoneme
				n_interval_start = Get start time of interval: phoneme_tier, i_phoneme+2
				t_interval_word_interval = Get interval at time: word_tier, t_interval_start
				n_interval_word_interval = Get interval at time: word_tier, n_interval_start
				if t_interval_word_interval = n_interval_word_interval
		
					# Make sure the middle interval is a schwa then
					next_interval_label$ = Get label of interval: phoneme_tier, i_phoneme+1

					# Just unstressed vowels
					if next_interval_label$ = "AH0" or next_interval_label$ = "IH0"

						# Previous can't be s, ʃ, f, ŋ, k, or p
						prev_interval_label$  = Get label of interval: phoneme_tier, i_phoneme-1
						if prev_interval_label$ <> "S" and prev_interval_label$ <> "SH"and prev_interval_label$ <> "F" and prev_interval_label$ <> "NG" and prev_interval_label$ <> "P"and prev_interval_label$ <> "K"

							this_word$ = Get label of interval: word_tier, t_interval_word_interval
							#appendInfoLine: tab$, this_word$

							# export it
							appendFileLine: output_file$, 
										..."mountain", ",",
										...speaker$, ",", 
										...fixed$(t_interval_start,2), ",",
										...this_word$, ",,,"

						endif

					endif

				endif

			endif

		endif

	endfor

endproc





# This one is a little bit different because it goes to spelling.
# Right now, it constrains it to be word-initial.
procedure whaspiration

	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want W
		if this_interval_label$ = "W"

			this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			this_interval_word_interval = Get interval at time: word_tier, this_interval_start
			this_word$ = Get label of interval: word_tier, this_interval_word_interval

			# Containing word has to have "wh" in the spelling
			if left$(this_word$, 2) = "wh"

				# export it
				appendFileLine: output_file$, 
							..."wh", ",",
							...speaker$, ",", 
							...fixed$(this_interval_start,2), ",",
							...this_word$, ",,,"

			endif

		endif		

	endfor

endproc



# This one is a little different because it has to straddle a word-boundary.
# I'll contrain it to just word-final ones.
procedure ng


	for i_phoneme from 1 to n_phonemes - 1
		this_interval_label$ = Get label of interval: phoneme_tier, i_phoneme

		# We only want NG
		if this_interval_label$ = "NG"

			# The words for the two have to be different
			this_interval_start = Get start time of interval: phoneme_tier, i_phoneme
			next_interval_start = Get start time of interval: phoneme_tier, i_phoneme+1
			this_interval_word_interval = Get interval at time: word_tier, this_interval_start
			next_interval_word_interval = Get interval at time: word_tier, next_interval_start
			if this_interval_word_interval <> next_interval_word_interval

				this_word$ = Get label of interval: word_tier, this_interval_word_interval
				#appendInfoLine: tab$, this_word$

				# export it
				appendFileLine: output_file$, 
							..."ng", ",",
							...speaker$, ",", 
							...fixed$(this_interval_start,2), ",",
							...this_word$, ",,,"

			endif

		endif		

	endfor

endproc