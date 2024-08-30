require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5556.0.0-darwin-x64.tar.gz"
    sha256 "739d23b53fffc46666a6eef2ea0ff9694d6f2208ba2a6c920303d403c6398f09"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5556.0.0-darwin-arm64.tar.gz"
      sha256 "503d51e6b85daf97fd3eb984355d82974991c39d4d2e11293deb7d3ee265c2a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5556.0.0-linux-x64.tar.gz"
    sha256 "b34b326249e44aa2c61585611e5f47bfaf6ba4b2cd2e0e816523d662b8d82714"
  end
  version "5556.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
