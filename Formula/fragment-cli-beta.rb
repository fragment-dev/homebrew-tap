require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3533.0.0-darwin-x64.tar.gz"
    sha256 "0c9909098d54db17c8c5f6b9213b2644b8942fe28e66b5d6c9ed53e09e1bd73e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3533.0.0-darwin-arm64.tar.gz"
      sha256 "d6b545fccc1ee03fedf2290ec39f0c1fd5c0186b2c4ddc664e6b82456f3959dc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3533.0.0-linux-x64.tar.gz"
    sha256 "4c100eaaf19c1d4ffa9aefef8ec264164fb48fd18db05a183d82cde3b039fb86"
  end
  version "3533.0.0"
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
