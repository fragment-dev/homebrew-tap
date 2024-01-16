require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4342.0.0-darwin-x64.tar.gz"
    sha256 "965819342e7670f34c87fbebbebc7a71472b15634f6d8d29bc8067e23be779a4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4342.0.0-darwin-arm64.tar.gz"
      sha256 "12d118dfb64007890992f1ca205a96aa7a3892247c8c9700af9cd99c218ec762"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4342.0.0-linux-x64.tar.gz"
    sha256 "357a6087e975def0b7afc12bff5ff3ecba1fbbc8900e629634c6d4f55d93d710"
  end
  version "4342.0.0"
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
