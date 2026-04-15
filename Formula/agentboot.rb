class Agentboot < Formula
  desc "Convention over configuration for agentic development teams"
  homepage "https://agentboot.dev"
  url "https://registry.npmjs.org/agentboot/-/agentboot-0.10.3.tgz"
  sha256 "cde1e818f5537a9e15e9d8a3e841898259fd3e149c99434e468b7f8aa20acdfc"
  license "Apache-2.0"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/agentboot"
  end

  def caveats
    macos_version = MacOS.version.to_s rescue ""
    if macos_version.start_with?("26") || macos_version.start_with?("16")
      <<~EOS
        ⚠️  macOS Tahoe detected.

        Homebrew's sandbox is incompatible with macOS Tahoe, which may cause
        the install to fail with "nice: Operation not permitted".

        If the install failed, use npm instead:

            brew uninstall agentboot
            npm install -g agentboot

        Or use npx without installing:

            npx agentboot --help

        See: https://github.com/agentboot-dev/homebrew-agentboot#macos-tahoe-macos-26-known-issue
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentboot --version")
  end
end
