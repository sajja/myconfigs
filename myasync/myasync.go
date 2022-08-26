package main

import (
	"flag"
	"fmt"
	"time"
	"sync"
	"os/exec"
	"strings"
	"os"
)

func invoke(command string, args string, wg *sync.WaitGroup) {
	wg.Add(1)
	exec.Command(command, args).Output()
	wg.Done()
}

func main() {
	var wg sync.WaitGroup

	var command string
	var times int

	flag.StringVar(&command, "command", "", "Command with params")
	flag.IntVar(&times, "count", 1, "How many invocation times")
	flag.Parse()

	if len(command) == 0 {
		fmt.Println("useage myasync -command <command> -count N")
		os.Exit(1)
	}
	var splittedCommand = strings.SplitN(command, " ", 2)
	var bin = splittedCommand[0]
	var args string = ""

	if (len(splittedCommand) > 1) {
		args = splittedCommand[1]
	}

	start := time.Now()
	for i := 0; i < times; i++ {
		go invoke(bin, args, &wg)
	}

	elapsed := time.Since(start)

	wg.Wait()
	fmt.Printf("Execution took %s\n", elapsed)
}
