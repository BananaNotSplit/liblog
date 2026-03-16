#if canImport(OSLog)
import OSLog
#endif
// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct Log: Sendable {
#if canImport(OSLog)
	private var native: Logger

	public init(
		subsystem: String = Bundle.main.bundleIdentifier ?? "app",
   	category: String = "general"
	) {
		native = .init(subsystem: subsystem, category: category)
	}
#else
	public init(
		subsystem: String = "",
		category: String = ""
	) {} // We do nothing - no data is needed here.
#endif

#if canImport(OSLog)
	public func debug(_ message: StaticString) {
		native.debug("\(message)")
	}

	public func info(_ message: StaticString) {
		native.info("\(message)")
	}

	public func log(_ message: StaticString) {
		native.log("\(message)")
	}

	public func warn(_ message: StaticString) {
		native.warning("\(message)")
	}

	public func error(_ message: StaticString) {
		native.error("\(message)")
	}

	public func critical(_ message: StaticString) {
		native.critical("\(message)")
	}

	public func fault(_ message: StaticString) {
		native.fault("\(message)")
	}

	public func trace(_ message: StaticString) {
		native.trace("\(message)")
	}

	public func notice(_ message: StaticString) {
		native.notice("\(message)")
	}
#else
	public func debug(_ message: StaticString) {
		print("[DBG ]: \(message)")
	}

	public func info(_ message: StaticString) {
		print("[INFO]: \(message)")
	}

	public func log(_ message: StaticString) {
		print("[LOG ]: \(message)")
	}

	public func warn(_ message: StaticString) {
		print("[WARN]: \(message)")
	}

	public func error(_ message: StaticString) {
		print("[EROR]: \(message)")
	}

	public func critical(_ message: StaticString) {
		print("[CRIT]: \(message)")
	}

	public func fault(_ message: StaticString) {
		print("[FALT]: \(message)")
	}

	public func trace(_ message: StaticString) {
		print("[TRCE]: \(message)")
	}

	public func notice(_ message: StaticString) {
		print("[NOTE]: \(message)")
	}
#endif
}