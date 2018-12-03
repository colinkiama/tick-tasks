namespace TickTasks.View {


    public class ToDoView : Gtk.Grid {
        public ToDoView () {
            // this.add (new Gtk.Button.with_label ("Hi"));
            Gtk.CheckButton task = new Gtk.CheckButton.with_label ("Hello elementary development");

            Gtk.ListStore list_store = new Gtk.ListStore (2, typeof (bool), typeof (string));
            Gtk.TreeIter iter;

            list_store.append (out iter);
            list_store.set (iter, 0, false, 1, "Hello World");


            Gtk.TreeView view = new Gtk.TreeView.with_model (list_store);

            Gtk.CellRendererToggle toggle = new Gtk.CellRendererToggle ();
            Gtk.CellRendererText text = new Gtk.CellRendererText ();
            view.insert_column_with_attributes (-1, "isDone", toggle, "active",
            0);

            view.insert_column_with_attributes(-1, "task", text, "text", 1);
            view.set_headers_visible (false);

            this.add(view);

        }
    }

}
