function ts {
	args=$@
	tmux send-keys -t right "$args" C-m
}
