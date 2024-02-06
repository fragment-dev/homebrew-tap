require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4499.0.0-darwin-x64.tar.gz"
    sha256 "bba1789f6a7ebcaa08cd4720422a6b803a4244a2c87245dac474118c8656413f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4499.0.0-darwin-arm64.tar.gz"
      sha256 "1f6a306a9ff8326c302724e284ecd676622ea53342fa54a97b557e2609d91482"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4499.0.0-linux-x64.tar.gz"
    sha256 "d10f4014e5978d83ba10d2d16660e419ad88b58d13aeaa8059f0bb09a31758c7"
  end
  version "4499.0.0"
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
