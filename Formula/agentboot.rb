class Agentboot < Formula
  desc "Convention over configuration for agentic development teams"
  homepage "https://agentboot.dev"
  url "https://registry.npmjs.org/agentboot/-/agentboot-0.4.5.tgz"
  sha256 "17ca9f86c4c396880e4ecd5da02e39b6116792c893abc09d095cfbffffd75efc"
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
