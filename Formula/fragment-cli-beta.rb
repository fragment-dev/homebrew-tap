require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4387.0.0-darwin-x64.tar.gz"
    sha256 "b8fd508dc9e08faab59f7c3b7a31004ad15c545519d04f8a53c54b4dd1d0ea30"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4387.0.0-darwin-arm64.tar.gz"
      sha256 "dc1a8c8114f6fccd3647b1ff24f03b405c50da36c026e10bc11b942b09dc083a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4387.0.0-linux-x64.tar.gz"
    sha256 "945248bfe8ca0acfe76976c8d900786eafe7df81f9692c2c90bf01babbd36564"
  end
  version "4387.0.0"
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
