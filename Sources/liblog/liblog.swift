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
	public func debug(_ message: String) {
		native.debug("\(message)")
	}

	public func info(_ message: String) {
		native.info("\(message)")
	}

	public func log(_ message: String) {
		native.log("\(message)")
	}

	public func warn(_ message: String) {
		native.warning("\(message)")
	}

	public func error(_ message: String) {
		native.error("\(message)")
	}

	public func critical(_ message: String) {
		native.critical("\(message)")
	}

	public func fault(_ message: String) {
		native.fault("\(message)")
	}

	public func trace(_ message: String) {
		native.trace("\(message)")
	}

	public func notice(_ message: String) {
		native.notice("\(message)")
	}
#else
	public func debug(_ message: String) {
		print("[DBG ]: \(message)")
	}

	public func info(_ message: String) {
		print("[INFO]: \(message)")
	}

	public func log(_ message: String) {
		print("[LOG ]: \(message)")
	}

	public func warn(_ message: String) {
		print("[WARN]: \(message)")
	}

	public func error(_ message: String) {
		print("[EROR]: \(message)")
	}

	public func critical(_ message: String) {
		print("[CRIT]: \(message)")
	}

	public func fault(_ message: String) {
		print("[FALT]: \(message)")
	}

	public func trace(_ message: String) {
		print("[TRCE]: \(message)")
	}

	public func notice(_ message: String) {
		print("[NOTE]: \(message)")
	}
#endif
}