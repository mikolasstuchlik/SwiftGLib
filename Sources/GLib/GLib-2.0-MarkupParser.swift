import CGLib

// MARK: - MarkupParser Record

/// The `MarkupParserProtocol` protocol exposes the methods and properties of an underlying `GMarkupParser` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `MarkupParser`.
/// Alternatively, use `MarkupParserRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// Any of the fields in `GMarkupParser` can be `nil`, in which case they
/// will be ignored. Except for the `error` function, any of these callbacks
/// can set an error; in particular the `G_MARKUP_ERROR_UNKNOWN_ELEMENT`,
/// `G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE`, and `G_MARKUP_ERROR_INVALID_CONTENT`
/// errors are intended to be set from these callbacks. If you set an error
/// from a callback, `g_markup_parse_context_parse()` will report that error
/// back to its caller.
public protocol MarkupParserProtocol {
        /// Untyped pointer to the underlying `GMarkupParser` instance.
    var ptr: UnsafeMutableRawPointer { get }

    /// Typed pointer to the underlying `GMarkupParser` instance.
    var _ptr: UnsafeMutablePointer<GMarkupParser> { get }
}

/// The `MarkupParserRef` type acts as a lightweight Swift reference to an underlying `GMarkupParser` instance.
/// It exposes methods that can operate on this data type through `MarkupParserProtocol` conformance.
/// Use `MarkupParserRef` only as an `unowned` reference to an existing `GMarkupParser` instance.
///
/// Any of the fields in `GMarkupParser` can be `nil`, in which case they
/// will be ignored. Except for the `error` function, any of these callbacks
/// can set an error; in particular the `G_MARKUP_ERROR_UNKNOWN_ELEMENT`,
/// `G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE`, and `G_MARKUP_ERROR_INVALID_CONTENT`
/// errors are intended to be set from these callbacks. If you set an error
/// from a callback, `g_markup_parse_context_parse()` will report that error
/// back to its caller.
public struct MarkupParserRef: MarkupParserProtocol {
        /// Untyped pointer to the underlying `GMarkupParser` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer
}

public extension MarkupParserRef {
    /// Designated initialiser from the underlying `C` data type
    init(_ p: UnsafeMutablePointer<GMarkupParser>) {
        ptr = UnsafeMutableRawPointer(p)    }

    /// Reference intialiser for a related type that implements `MarkupParserProtocol`
    init<T: MarkupParserProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    init(raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `MarkupParser` type acts as an owner of an underlying `GMarkupParser` instance.
/// It provides the methods that can operate on this data type through `MarkupParserProtocol` conformance.
/// Use `MarkupParser` as a strong reference or owner of a `GMarkupParser` instance.
///
/// Any of the fields in `GMarkupParser` can be `nil`, in which case they
/// will be ignored. Except for the `error` function, any of these callbacks
/// can set an error; in particular the `G_MARKUP_ERROR_UNKNOWN_ELEMENT`,
/// `G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE`, and `G_MARKUP_ERROR_INVALID_CONTENT`
/// errors are intended to be set from these callbacks. If you set an error
/// from a callback, `g_markup_parse_context_parse()` will report that error
/// back to its caller.
open class MarkupParser: MarkupParserProtocol {
        /// Untyped pointer to the underlying `GMarkupParser` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `MarkupParser` instance.
    /// - Parameter op: pointer to the underlying object
    public init(_ op: UnsafeMutablePointer<GMarkupParser>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `GMarkupParser` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `MarkupParser` instance.
    /// - Parameter op: pointer to the underlying object
    public init(retaining op: UnsafeMutablePointer<GMarkupParser>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }

    /// Reference intialiser for a related type that implements `MarkupParserProtocol`
    /// `GMarkupParser` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `MarkupParserProtocol`
    public init<T: MarkupParserProtocol>(_ other: T) {
        ptr = UnsafeMutableRawPointer(other._ptr)
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }

    /// Do-nothing destructor for `GMarkupParser`.
    deinit {
        // no reference counting for GMarkupParser, cannot unref(cast(_ptr))
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `MarkupParserProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for GMarkupParser, cannot ref(cast(_ptr))
    }



}

// MARK: no MarkupParser properties

// MARK: no MarkupParser signals


// MARK: MarkupParser Record: MarkupParserProtocol extension (methods and fields)
public extension MarkupParserProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GMarkupParser` instance.
    var _ptr: UnsafeMutablePointer<GMarkupParser> { return ptr.assumingMemoryBound(to: GMarkupParser.self) }


    // var startElement is unavailable because start_element is void

    // var endElement is unavailable because end_element is void

    // var text is unavailable because text is void

    // var passthrough is unavailable because passthrough is void

    // var error is unavailable because error is void

}



