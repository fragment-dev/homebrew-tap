require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2906.0.0-darwin-x64.tar.gz"
    sha256 "9c62931dd0203a208179077e4d31a90c8a25d0ca0ef15accb2735f786a97c946"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2906.0.0-darwin-arm64.tar.gz"
      sha256 "8a3d7795abdab0d19ddf0d375001ee02528f85c2a61bf9c6daac3bdcb26fd718"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2906.0.0-linux-x64.tar.gz"
    sha256 "eb56890a5b05f1d89167981cb0f4bf223915a9aa37bf1b68d73a7adee9faf620"
  end
  version "2906.0.0"
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
