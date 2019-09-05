## Two steps to configuring test shortcuts

VSCode integrates with external tools using “tasks” which are defined at the project level. They can be included in project repositories so they can be shared by the development team. Tasks are used throughout the editor to integrate things like build tools, linters, and test runners in a uniform way.

VSCode also allows you to create custom keybindings that can run any defined task. Keybindings are defined globally and are configured according to the user’s taste.

### TASK DEFINITION

Task definitions in tasks.js allow you to integrate external tools into VSCode. In this case we specify the test commands to run and how the output should be presented. The `tasks.json` file currently lives in the project’s `.vscode` directory.

Notice that in the example `tasks.json` files below the labels are reused for the different test types. In the keybindings section this allows the same global keybinding to trigger the appropriate project specific task.

#### label

Label is the name displayed in the user interface. It is shown in a list when you open “Tasks: Run Test Task” from the “Command Palette” (Ctrl+Shift+P or Cmd+Shift+P). The label is also used when binding a key to the task.

#### type

Type defines how the task should be run, in a shell or as a process. Normally test toolings expect to be run in a shell to provide useful output about results.

#### command

Command is what executes when the task runs. By default the command is run from the project root, but you can specify a different directory using the cwd option. There are also lots of convenient substitution variables you can use in the command string like relativeFile and lineNumber. A full list can be found at Predefined Variables.

#### group

Group is a way to present related tasks together. Right now VSCode supports the groups “build” and “test”. Using the “test” group adds your task to “Tasks: Run Test Task” in the “Command Palette”.

#### presentation

Presentation allows you to set options for how the task is displayed. I like to always pop open the output in the terminal view and reuse it for every test run. Other possible presentation options are available.

### KEYBINDING

Keybindings can now be defined for the test tasks. These are user specific and cannot be added to the .vscode directory and shared. If you use consistent labeling of your tasks then these same keybindings can work in all projects where matching test tasks are defined.

#### key

The keybinding to add, using the VSCode conventions. I chose to use the ctrl-k prefix and the mnemonic of ctrl-l for test example at line, ctrl-t for test file, and ctrl-a for all tests in the project. Of course you can bind these however you like.

#### command

We always use the runTask command since we want our keybindings to execute one of our defined tasks.

#### args

The args to the runTask command should be the label of our defined task.

#### when

When defines when the keybinding should be available. In this example you can “Run test suite” from any context but to “Run test file” or “Run test case” an editor must have focus.

The when option can be very specific, checking for a certain language mode or that the focused editor has a certain filename or extension. These conditions could be useful if you have a single project (or multiple project workspace) that uses multiple test toolings.

In that case you could bind the same keys to different tasks based on context. The available filters can be found at ‘when’ clause contexts.

## Running

```ln -s /Users/swm/Code/dotfiles/vscode/give_me_a_test_file.sh /usr/local/bin/give_me_a_test_file```