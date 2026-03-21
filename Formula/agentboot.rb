class Agentboot < Formula
  desc "Convention over configuration for agentic development teams"
  homepage "https://agentboot.dev"
  url "https://registry.npmjs.org/agentboot/-/agentboot-0.2.0.tgz"
  sha256 "da76e917fc6f640180c02b72f98f4e64b7ce0c0e427412f94d9df7a11ed4e501"
  license "Apache-2.0"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/agentboot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentboot --version")
  end
end
