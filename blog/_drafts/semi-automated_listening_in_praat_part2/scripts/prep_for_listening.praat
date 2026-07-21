################################################################################
#
# This script was written for a tutorial on my website. It loops through the 
# recordings in the audio folder and finds THR tokens. It saves it out into a 
# file called to_listen.csv. There is no prep work needed to run it other
# than making sure it's in the right folder. 
# 
# Joey Stanley
# 5:14pm, Wednesday, May 20, 2026
# While riding the 822 bus by Walmart, Spanish Fork, Utah
#
################################################################################

writeInfoLine: "Counting tokens..."

# Where is all the audio?
dir$ = "../audio/"

# Where is the output file?
output_file$ = "to_listen.csv"
writeFileLine: output_file$, "variable,speaker,time,word,realization"

# Other globals
phoneme_tier = 2
word_tier    = 1

# Get a list of all the speakers
speakers = Create Strings as directory list: "speaker_directories", "'dir$'*"

# Loop through those speakers
n_speakers = Get number of strings
# Uncomment this when you're ready to go 
for i_speaker from 1 to n_speakers
# Keep this version while developing the script. Comment when done.
#for i_speaker from 1 to 2
    
    # Get the name of the speaker's folder
    selectObject: speakers
    speaker$ = Get string: i_speaker

    # Get paths to this speaker's files
    speaker_dir$ = "'dir$''speaker$'/"
    path_to_tg$ = "'speaker_dir$''speaker$'_interview.TextGrid"
    appendInfoLine: path_to_tg$

    # Only continue if it exists
    if fileReadable(path_to_tg$)

        # Read in the TextGrid
        this_tg = Read from file: path_to_tg$

        # Loop through intervals and find matches.
        #@velar_nasals
		@thr_flapping
		#@mountain

        # Clean up this TextGrid
        selectObject: this_tg
        Remove

    endif
    
endfor

# Clean up
selectObject: speakers
Remove

appendInfoLine: newline$, "...done!"


procedure velar_nasals

    # Loop through all the phoneme intervals
    n_phonemes = Get number of intervals: phoneme_tier
    #for i_phoneme from 1 to n_phonemes
    for i_phoneme from 1 to 1000
    
        # Only focus on velar nasals
        this_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme
        if this_phoneme_label$ = "NG"
            this_phoneme_start = Get start time of interval: phoneme_tier, i_phoneme
            this_phoneme_word_interval = Get interval at time: word_tier, this_phoneme_start
            this_phoneme_word$ = Get label of interval: word_tier, this_phoneme_word_interval
            appendInfoLine: this_phoneme_word$
        endif

    endfor

endproc



procedure thr_flapping

    # Loop through all the phoneme intervals
    n_phonemes = Get number of intervals: phoneme_tier
    for i_phoneme from 1 to n_phonemes-1
    
        # Only focus on TH
        this_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme
        next_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme+1

        if this_phoneme_label$ = "TH" and next_phoneme_label$ = "R"
            this_phoneme_start = Get start time of interval: phoneme_tier, i_phoneme
            this_phoneme_word_interval = Get interval at time: word_tier, this_phoneme_start
            this_phoneme_word$ = Get label of interval: word_tier, this_phoneme_word_interval

            next_phoneme_start = Get start time of interval: phoneme_tier, i_phoneme+1
            next_phoneme_word_interval = Get interval at time: word_tier, next_phoneme_start
        
            if this_phoneme_word_interval = next_phoneme_word_interval
                appendFileLine: output_file$, "thr-flapping,'speaker$','this_phoneme_start','this_phoneme_word$',"
            endif

        endif

    endfor

endproc




procedure mountain

    # Loop through all the phoneme intervals
    n_phonemes = Get number of intervals: phoneme_tier
    for i_phoneme from 2 to n_phonemes-2
    
        # Only focus on T AH0 N
        this_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme
        next_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme+1
        nextnext_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme+2

        # Make sure they're all in the same word
        if this_phoneme_label$ = "T" and next_phoneme_label$ = "AH0" and nextnext_phoneme_label$ = "N"

            # Check the previous phoneme
            prev_phoneme_label$ = Get label of interval: phoneme_tier, i_phoneme-1
            prev_phoneme_label_length = length(prev_phoneme_label$)

            # Make sure the previous interval is a vowel or a liquid
            if prev_phoneme_label$ = "R" or prev_phoneme_label$ = "L" or prev_phoneme_label$ = "N" or prev_phoneme_label_length = 3

                # Get info about this phoneme
                this_phoneme_start = Get start time of interval: phoneme_tier, i_phoneme
                this_phoneme_word_interval = Get interval at time: word_tier, this_phoneme_start

                # Get info about the phoneme two intervals down
                nextnext_phoneme_start = Get start time of interval: phoneme_tier, i_phoneme+2
                nextnext_phoneme_word_interval = Get interval at time: word_tier, nextnext_phoneme_start
            
                # Make sure the two are in the same word
                if this_phoneme_word_interval = nextnext_phoneme_word_interval

                    # Get word info and exclude "important"
                    this_phoneme_word$ = Get label of interval: word_tier, this_phoneme_word_interval
                    if this_phoneme_word$ <> "important"
                        appendInfoLine: this_phoneme_word$
                    endif

                endif

            endif

        endif

    endfor

endproc