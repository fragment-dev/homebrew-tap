require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2042.0.0-darwin-x64.tar.gz"
    sha256 "a478377ba81f6516ce59d3953e968faee1c367059df774aee28ed3339144d7a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2042.0.0-darwin-arm64.tar.gz"
      sha256 "873ec08f3048dde8862de847a916c2a299e4703c462691c850c7d6bdd1d67cc0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2042.0.0-linux-x64.tar.gz"
    sha256 "dd21d3b80c90faf1d53aeb5a0534cd55c939ca38d3e74c74213c21176515fbda"
  end
  version "2042.0.0"
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
