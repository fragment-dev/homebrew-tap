require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3118.0.0-darwin-x64.tar.gz"
    sha256 "2a78fb746611e69b912395b6ae48519b605c9c74a57f8aaeb8df187c76b8bccd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3118.0.0-darwin-arm64.tar.gz"
      sha256 "733d0227dfcd32f3e74b5f2c9ec133f43f3962f99096d0b57515ada626ee3679"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3118.0.0-linux-x64.tar.gz"
    sha256 "c1d2fa5a22d3b510f0f8b0e37bc520e37ed0d24540eb25e3f48f8a2ae4faa882"
  end
  version "3118.0.0"
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
