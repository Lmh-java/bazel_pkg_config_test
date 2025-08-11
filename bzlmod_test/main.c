#include <glib.h>

int main(int argc, char *argv[]) {
    g_print("Hello from GLib!\n");

    GList *list = NULL;
    list = g_list_append(list, "Alice");
    list = g_list_append(list, "Bob");
    list = g_list_append(list, "Charlie");

    for (GList *l = list; l != NULL; l = l->next) {
        g_print("Name: %s\n", (char *)l->data);
    }

    g_list_free(list);
    return 0;
}
