import CGLib

// MARK: - RWLock Record

/// The `RWLockProtocol` protocol exposes the methods and properties of an underlying `GRWLock` instance.
/// The default implementation of these can be found in the protocol extension below.
/// For a concrete class that implements these methods and properties, see `RWLock`.
/// Alternatively, use `RWLockRef` as a lighweight, `unowned` reference if you already have an instance you just want to use.
///
/// The GRWLock struct is an opaque data structure to represent a
/// reader-writer lock. It is similar to a `GMutex` in that it allows
/// multiple threads to coordinate access to a shared resource.
/// 
/// The difference to a mutex is that a reader-writer lock discriminates
/// between read-only ('reader') and full ('writer') access. While only
/// one thread at a time is allowed write access (by holding the 'writer'
/// lock via `g_rw_lock_writer_lock()`), multiple threads can gain
/// simultaneous read-only access (by holding the 'reader' lock via
/// `g_rw_lock_reader_lock()`).
/// 
/// It is unspecified whether readers or writers have priority in acquiring the
/// lock when a reader already holds the lock and a writer is queued to acquire
/// it.
/// 
/// Here is an example for an array with access functions:
/// (C Language Example):
/// ```C
///   GRWLock lock;
///   GPtrArray *array;
/// 
///   gpointer
///   my_array_get (guint index)
///   {
///     gpointer retval = NULL;
/// 
///     if (!array)
///       return NULL;
/// 
///     g_rw_lock_reader_lock (&lock);
///     if (index < array->len)
///       retval = g_ptr_array_index (array, index);
///     g_rw_lock_reader_unlock (&lock);
/// 
///     return retval;
///   }
/// 
///   void
///   my_array_set (guint index, gpointer data)
///   {
///     g_rw_lock_writer_lock (&lock);
/// 
///     if (!array)
///       array = g_ptr_array_new ();
/// 
///     if (index >= array->len)
///       g_ptr_array_set_size (array, index+1);
///     g_ptr_array_index (array, index) = data;
/// 
///     g_rw_lock_writer_unlock (&lock);
///   }
///  
/// ```
/// This example shows an array which can be accessed by many readers
/// (the `my_array_get()` function) simultaneously, whereas the writers
/// (the `my_array_set()` function) will only be allowed one at a time
/// and only if no readers currently access the array. This is because
/// of the potentially dangerous resizing of the array. Using these
/// functions is fully multi-thread safe now.
/// 
/// If a `GRWLock` is allocated in static storage then it can be used
/// without initialisation.  Otherwise, you should call
/// `g_rw_lock_init()` on it and `g_rw_lock_clear()` when done.
/// 
/// A GRWLock should only be accessed with the g_rw_lock_ functions.
public protocol RWLockProtocol {
        /// Untyped pointer to the underlying `GRWLock` instance.
    var ptr: UnsafeMutableRawPointer! { get }

    /// Typed pointer to the underlying `GRWLock` instance.
    var _ptr: UnsafeMutablePointer<GRWLock>! { get }

}

/// The `RWLockRef` type acts as a lightweight Swift reference to an underlying `GRWLock` instance.
/// It exposes methods that can operate on this data type through `RWLockProtocol` conformance.
/// Use `RWLockRef` only as an `unowned` reference to an existing `GRWLock` instance.
///
/// The GRWLock struct is an opaque data structure to represent a
/// reader-writer lock. It is similar to a `GMutex` in that it allows
/// multiple threads to coordinate access to a shared resource.
/// 
/// The difference to a mutex is that a reader-writer lock discriminates
/// between read-only ('reader') and full ('writer') access. While only
/// one thread at a time is allowed write access (by holding the 'writer'
/// lock via `g_rw_lock_writer_lock()`), multiple threads can gain
/// simultaneous read-only access (by holding the 'reader' lock via
/// `g_rw_lock_reader_lock()`).
/// 
/// It is unspecified whether readers or writers have priority in acquiring the
/// lock when a reader already holds the lock and a writer is queued to acquire
/// it.
/// 
/// Here is an example for an array with access functions:
/// (C Language Example):
/// ```C
///   GRWLock lock;
///   GPtrArray *array;
/// 
///   gpointer
///   my_array_get (guint index)
///   {
///     gpointer retval = NULL;
/// 
///     if (!array)
///       return NULL;
/// 
///     g_rw_lock_reader_lock (&lock);
///     if (index < array->len)
///       retval = g_ptr_array_index (array, index);
///     g_rw_lock_reader_unlock (&lock);
/// 
///     return retval;
///   }
/// 
///   void
///   my_array_set (guint index, gpointer data)
///   {
///     g_rw_lock_writer_lock (&lock);
/// 
///     if (!array)
///       array = g_ptr_array_new ();
/// 
///     if (index >= array->len)
///       g_ptr_array_set_size (array, index+1);
///     g_ptr_array_index (array, index) = data;
/// 
///     g_rw_lock_writer_unlock (&lock);
///   }
///  
/// ```
/// This example shows an array which can be accessed by many readers
/// (the `my_array_get()` function) simultaneously, whereas the writers
/// (the `my_array_set()` function) will only be allowed one at a time
/// and only if no readers currently access the array. This is because
/// of the potentially dangerous resizing of the array. Using these
/// functions is fully multi-thread safe now.
/// 
/// If a `GRWLock` is allocated in static storage then it can be used
/// without initialisation.  Otherwise, you should call
/// `g_rw_lock_init()` on it and `g_rw_lock_clear()` when done.
/// 
/// A GRWLock should only be accessed with the g_rw_lock_ functions.
public struct RWLockRef: RWLockProtocol {
        /// Untyped pointer to the underlying `GRWLock` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!
}

public extension RWLockRef {
    /// Designated initialiser from the underlying `C` data type
    @inlinable init(_ p: UnsafeMutablePointer<GRWLock>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type
    @inlinable init(_ p: UnsafePointer<GRWLock>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: p))
    }

    /// Conditional initialiser from an optional pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafeMutablePointer<GRWLock>?) {
        guard let p = maybePointer else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable pointer to the underlying `C` data type
    @inlinable init!(_ maybePointer: UnsafePointer<GRWLock>?) {
        guard let p = UnsafeMutablePointer(mutating: maybePointer) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional `gpointer`
    @inlinable init!(gpointer g: gpointer?) {
        guard let p = g else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Conditional initialiser from an optional, non-mutable `gconstpointer`
    @inlinable init!(gconstpointer g: gconstpointer?) {
        guard let p = UnsafeMutableRawPointer(mutating: g) else { return nil }
        ptr = p
    }

    /// Reference intialiser for a related type that implements `RWLockProtocol`
    @inlinable init<T: RWLockProtocol>(_ other: T) {
        ptr = other.ptr
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable init<T>(cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable init<T>(constPointer: UnsafePointer<T>) {
        ptr = UnsafeMutableRawPointer(mutating: UnsafeRawPointer(constPointer))
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable init(mutating raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable init(raw: UnsafeMutableRawPointer) {
        ptr = raw
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable init(opaquePointer: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(opaquePointer)
    }

    }

/// The `RWLock` type acts as an owner of an underlying `GRWLock` instance.
/// It provides the methods that can operate on this data type through `RWLockProtocol` conformance.
/// Use `RWLock` as a strong reference or owner of a `GRWLock` instance.
///
/// The GRWLock struct is an opaque data structure to represent a
/// reader-writer lock. It is similar to a `GMutex` in that it allows
/// multiple threads to coordinate access to a shared resource.
/// 
/// The difference to a mutex is that a reader-writer lock discriminates
/// between read-only ('reader') and full ('writer') access. While only
/// one thread at a time is allowed write access (by holding the 'writer'
/// lock via `g_rw_lock_writer_lock()`), multiple threads can gain
/// simultaneous read-only access (by holding the 'reader' lock via
/// `g_rw_lock_reader_lock()`).
/// 
/// It is unspecified whether readers or writers have priority in acquiring the
/// lock when a reader already holds the lock and a writer is queued to acquire
/// it.
/// 
/// Here is an example for an array with access functions:
/// (C Language Example):
/// ```C
///   GRWLock lock;
///   GPtrArray *array;
/// 
///   gpointer
///   my_array_get (guint index)
///   {
///     gpointer retval = NULL;
/// 
///     if (!array)
///       return NULL;
/// 
///     g_rw_lock_reader_lock (&lock);
///     if (index < array->len)
///       retval = g_ptr_array_index (array, index);
///     g_rw_lock_reader_unlock (&lock);
/// 
///     return retval;
///   }
/// 
///   void
///   my_array_set (guint index, gpointer data)
///   {
///     g_rw_lock_writer_lock (&lock);
/// 
///     if (!array)
///       array = g_ptr_array_new ();
/// 
///     if (index >= array->len)
///       g_ptr_array_set_size (array, index+1);
///     g_ptr_array_index (array, index) = data;
/// 
///     g_rw_lock_writer_unlock (&lock);
///   }
///  
/// ```
/// This example shows an array which can be accessed by many readers
/// (the `my_array_get()` function) simultaneously, whereas the writers
/// (the `my_array_set()` function) will only be allowed one at a time
/// and only if no readers currently access the array. This is because
/// of the potentially dangerous resizing of the array. Using these
/// functions is fully multi-thread safe now.
/// 
/// If a `GRWLock` is allocated in static storage then it can be used
/// without initialisation.  Otherwise, you should call
/// `g_rw_lock_init()` on it and `g_rw_lock_clear()` when done.
/// 
/// A GRWLock should only be accessed with the g_rw_lock_ functions.
open class RWLock: RWLockProtocol {
        /// Untyped pointer to the underlying `GRWLock` instance.
    /// For type-safe access, use the generated, typed pointer `_ptr` property instead.
    public let ptr: UnsafeMutableRawPointer!

    /// Designated initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafeMutablePointer<GRWLock>) {
        ptr = UnsafeMutableRawPointer(op)
    }

    /// Designated initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(_ op: UnsafePointer<GRWLock>) {
        ptr = UnsafeMutableRawPointer(UnsafeMutablePointer(mutating: op))
    }

    /// Optional initialiser from a non-mutating `gpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: gpointer to the underlying object
    @inlinable public init!(gpointer op: gpointer?) {
        guard let p = UnsafeMutableRawPointer(op) else { return nil }
        ptr = p
    }

    /// Optional initialiser from a non-mutating `gconstpointer` to
    /// the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(gconstpointer op: gconstpointer?) {
        guard let p = op else { return nil }
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Optional initialiser from a constant pointer to the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafePointer<GRWLock>?) {
        guard let p = UnsafeMutablePointer(mutating: op) else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Optional initialiser from the underlying `C` data type.
    /// This creates an instance without performing an unbalanced retain
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init!(_ op: UnsafeMutablePointer<GRWLock>?) {
        guard let p = op else { return nil }
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Designated initialiser from the underlying `C` data type.
    /// `GRWLock` does not allow reference counting, so despite the name no actual retaining will occur.
    /// i.e., ownership is transferred to the `RWLock` instance.
    /// - Parameter op: pointer to the underlying object
    @inlinable public init(retaining op: UnsafeMutablePointer<GRWLock>) {
        ptr = UnsafeMutableRawPointer(op)
        // no reference counting for GRWLock, cannot ref(_ptr)
    }

    /// Reference intialiser for a related type that implements `RWLockProtocol`
    /// `GRWLock` does not allow reference counting.
    /// - Parameter other: an instance of a related type that implements `RWLockProtocol`
    @inlinable public init<T: RWLockProtocol>(_ other: T) {
        ptr = other.ptr
        // no reference counting for GRWLock, cannot ref(_ptr)
    }

    /// Do-nothing destructor for `GRWLock`.
    deinit {
        // no reference counting for GRWLock, cannot unref(_ptr)
    }

    /// Unsafe typed initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable public init<T>(cPointer p: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe typed, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter cPointer: pointer to the underlying object
    @inlinable public init<T>(retainingCPointer cPointer: UnsafeMutablePointer<T>) {
        ptr = UnsafeMutableRawPointer(cPointer)
        // no reference counting for GRWLock, cannot ref(_ptr)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter p: raw pointer to the underlying object
    @inlinable public init(raw p: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    @inlinable public init(retainingRaw raw: UnsafeRawPointer) {
        ptr = UnsafeMutableRawPointer(mutating: raw)
        // no reference counting for GRWLock, cannot ref(_ptr)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter p: mutable raw pointer to the underlying object
    @inlinable public init(raw p: UnsafeMutableRawPointer) {
        ptr = p
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter raw: mutable raw pointer to the underlying object
    @inlinable public init(retainingRaw raw: UnsafeMutableRawPointer) {
        ptr = raw
        // no reference counting for GRWLock, cannot ref(_ptr)
    }

    /// Unsafe untyped initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable public init(opaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
    }

    /// Unsafe untyped, retaining initialiser.
    /// **Do not use unless you know the underlying data type the pointer points to conforms to `RWLockProtocol`.**
    /// - Parameter p: opaque pointer to the underlying object
    @inlinable public init(retainingOpaquePointer p: OpaquePointer) {
        ptr = UnsafeMutableRawPointer(p)
        // no reference counting for GRWLock, cannot ref(_ptr)
    }



}

// MARK: no RWLock properties

// MARK: no RWLock signals


// MARK: RWLock Record: RWLockProtocol extension (methods and fields)
public extension RWLockProtocol {
    /// Return the stored, untyped pointer as a typed pointer to the `GRWLock` instance.
    @inlinable var _ptr: UnsafeMutablePointer<GRWLock>! { return ptr?.assumingMemoryBound(to: GRWLock.self) }

    /// Frees the resources allocated to a lock with `g_rw_lock_init()`.
    /// 
    /// This function should not be used with a `GRWLock` that has been
    /// statically allocated.
    /// 
    /// Calling `g_rw_lock_clear()` when any thread holds the lock
    /// leads to undefined behaviour.
    /// 
    /// Sine: 2.32
    @inlinable func clear() {
        g_rw_lock_clear(_ptr)
    
    }

    /// Initializes a `GRWLock` so that it can be used.
    /// 
    /// This function is useful to initialize a lock that has been
    /// allocated on the stack, or as part of a larger structure.  It is not
    /// necessary to initialise a reader-writer lock that has been statically
    /// allocated.
    /// 
    /// (C Language Example):
    /// ```C
    ///   typedef struct {
    ///     GRWLock l;
    ///     ...
    ///   } Blob;
    /// 
    /// Blob *b;
    /// 
    /// b = g_new (Blob, 1);
    /// g_rw_lock_init (&b->l);
    /// ```
    /// 
    /// To undo the effect of `g_rw_lock_init()` when a lock is no longer
    /// needed, use `g_rw_lock_clear()`.
    /// 
    /// Calling `g_rw_lock_init()` on an already initialized `GRWLock` leads
    /// to undefined behaviour.
    @inlinable func init_() {
        g_rw_lock_init(_ptr)
    
    }

    /// Obtain a read lock on `rw_lock`. If another thread currently holds
    /// the write lock on `rw_lock`, the current thread will block. If another thread
    /// does not hold the write lock, but is waiting for it, it is implementation
    /// defined whether the reader or writer will block. Read locks can be taken
    /// recursively.
    /// 
    /// It is implementation-defined how many threads are allowed to
    /// hold read locks on the same lock simultaneously. If the limit is hit,
    /// or if a deadlock is detected, a critical warning will be emitted.
    @inlinable func readerLock() {
        g_rw_lock_reader_lock(_ptr)
    
    }

    /// Tries to obtain a read lock on `rw_lock` and returns `true` if
    /// the read lock was successfully obtained. Otherwise it
    /// returns `false`.
    @inlinable func readerTrylock() -> Bool {
        let rv = ((g_rw_lock_reader_trylock(_ptr)) != 0)
        return rv
    }

    /// Release a read lock on `rw_lock`.
    /// 
    /// Calling `g_rw_lock_reader_unlock()` on a lock that is not held
    /// by the current thread leads to undefined behaviour.
    @inlinable func readerUnlock() {
        g_rw_lock_reader_unlock(_ptr)
    
    }

    /// Obtain a write lock on `rw_lock`. If any thread already holds
    /// a read or write lock on `rw_lock`, the current thread will block
    /// until all other threads have dropped their locks on `rw_lock`.
    @inlinable func writerLock() {
        g_rw_lock_writer_lock(_ptr)
    
    }

    /// Tries to obtain a write lock on `rw_lock`. If any other thread holds
    /// a read or write lock on `rw_lock`, it immediately returns `false`.
    /// Otherwise it locks `rw_lock` and returns `true`.
    @inlinable func writerTrylock() -> Bool {
        let rv = ((g_rw_lock_writer_trylock(_ptr)) != 0)
        return rv
    }

    /// Release a write lock on `rw_lock`.
    /// 
    /// Calling `g_rw_lock_writer_unlock()` on a lock that is not held
    /// by the current thread leads to undefined behaviour.
    @inlinable func writerUnlock() {
        g_rw_lock_writer_unlock(_ptr)
    
    }

    // var p is unavailable because p is private

    // var i is unavailable because i is private

}


