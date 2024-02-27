require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4645.0.0-darwin-x64.tar.gz"
    sha256 "60b765025f446223176e980aa02376aaafc6e0cbb8c654d9b33409533b431b4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4645.0.0-darwin-arm64.tar.gz"
      sha256 "3017b9726abfc8b4bea52b8b4316d85c1864a48ace74efa3fadbb4b0f3745cc7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4645.0.0-linux-x64.tar.gz"
    sha256 "423668206c098393c70c8f51802959e411076e8bcfa1892cd5d1fb98b556f64a"
  end
  version "4645.0.0"
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
