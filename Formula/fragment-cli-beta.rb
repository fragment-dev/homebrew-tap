require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4376.0.0-darwin-x64.tar.gz"
    sha256 "cdb45cfa98d108480e1e22729aae27919adda3ea631ece51f8ed50e23699341a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4376.0.0-darwin-arm64.tar.gz"
      sha256 "c00d2f75009ae2be88646b3ee5f70762fd7c4ca029fa0611fcac9841e40e8c69"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4376.0.0-linux-x64.tar.gz"
    sha256 "d535cb7f48d8bc2c8873683f8df528231fa5ce0d36a75d98d80323cbc0ddd4fb"
  end
  version "4376.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
