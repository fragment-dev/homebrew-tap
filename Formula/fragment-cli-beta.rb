require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3661.0.0-darwin-x64.tar.gz"
    sha256 "26c1c3870fbf29e7628b60bd7f16301721660a02c870691d1a79fa96f989f936"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3661.0.0-darwin-arm64.tar.gz"
      sha256 "37a06258c22dab6ff4d225eeeec5da5fd2e2be74aa4207e7b2ef53235a370fb2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3661.0.0-linux-x64.tar.gz"
    sha256 "185c6a5dfd8bda2a5d0f6072fc2239cf25f13e17e99d39ce298c090fb98fab0f"
  end
  version "3661.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
