require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2288.0.0-darwin-x64.tar.gz"
    sha256 "aa1a289c6d29295dd212b1922e3e8064043fcf3f178ed6bf85c2330399f7729d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2288.0.0-darwin-arm64.tar.gz"
      sha256 "96f9b26f269107018414af1f7843efe4b6ce908165b4f7b9c5caf351031c4790"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2288.0.0-linux-x64.tar.gz"
    sha256 "c99a96021aeadbb0592ab3c3143ae813c853fa487e04e93b8b137d3a87d8471d"
  end
  version "2288.0.0"
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
