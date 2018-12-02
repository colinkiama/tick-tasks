using tickTasks.View;

namespace tickTasks {
    public class MyApp : Gtk.Application {

        public MyApp () {
            Object (
                application_id: "com.github.colinkiama.tick-tasks",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate () {
            var main_window = new Gtk.ApplicationWindow (this);

            main_window.default_height = 480;
            main_window.default_width = 640;
            main_window.title = "TickTasks";



            Gtk.Stack stack = new Gtk.Stack ();
            stack.add_titled (new ToDoView (), "toDo", "To-Do");
            stack.add_titled (new DoneView (), "done", "Done");

            Gtk.StackSwitcher stack_switcher = new Gtk.StackSwitcher ();
            stack_switcher.set_stack (stack);

            Gtk.Grid grid = new Gtk.Grid ();
            grid.add (stack_switcher);

            main_window.add (grid);
            main_window.show_all ();
        }

        public static int main (string[] args) {
            var app = new MyApp ();
            return app.run (args);
        }
    }
}
