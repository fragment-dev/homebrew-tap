require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3616.0.0-darwin-x64.tar.gz"
    sha256 "a2718df469a6ab415e29c8afad91afc89d4011e9a7b1af8955b53f23ac748c83"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3616.0.0-darwin-arm64.tar.gz"
      sha256 "4daad3e999c6400c8a9739afabdde0362b318d70c9135bd4d66889082ab851b7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3616.0.0-linux-x64.tar.gz"
    sha256 "7c9d864d1e349e6e7e635aa63715b488859b20f9bc87d4fe7665dcf26d6a043f"
  end
  version "3616.0.0"
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
