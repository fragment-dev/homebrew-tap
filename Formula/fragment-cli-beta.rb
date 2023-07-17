require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3082.0.0-darwin-x64.tar.gz"
    sha256 "41b67f594619e24336eb0b7afac79b1420939bd5f8987e90e5a5924f2eb8455b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3082.0.0-darwin-arm64.tar.gz"
      sha256 "41d848720cb7bec8266c65a4b2f20dd42730072e19075935609c33fad1709bd7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3082.0.0-linux-x64.tar.gz"
    sha256 "c0d8aa050e68dc0ed84327057eaf00765167a86279a2208d9daafb209699a3d2"
  end
  version "3082.0.0"
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
