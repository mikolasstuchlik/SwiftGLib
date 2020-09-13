// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "GLib",
    products: [ .library(name: "GLib", targets: ["GLib"]) ],
    targets: [
        .systemLibrary(name: "CGLib", pkgConfig: "glib-2.0 gio-unix-2.0",
            providers: [
                .brew(["glib", "glib-networking", "gobject-introspection"]),
                .apt(["libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(name: "GLib", dependencies: ["CGLib"]),
        .testTarget(name: "GLibTests", dependencies: ["GLib"]),
    ]
)