require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2318.0.0-darwin-x64.tar.gz"
    sha256 "94731c3e1d86908fe0600b230a73907f428ed45c4f7897407675756c119ad305"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2318.0.0-darwin-arm64.tar.gz"
      sha256 "c5c8d03e74374778e359fdf2526e9e165982f9cc861363188872abb191b98d7c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2318.0.0-linux-x64.tar.gz"
    sha256 "91a30e29d12a723d868cbffe83e8da26b8fc835ead69c5fc5db6565a620e091c"
  end
  version "2318.0.0"
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
